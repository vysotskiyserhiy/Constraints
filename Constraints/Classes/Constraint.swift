//
//  Constraint.swift
//  Constraints
//
//  Created by Serhiy Vysotskiy on 12/24/17.
//  Copyright © 2017 Serhiy Vysotskiy. All rights reserved.
//

import UIKit.UIView

public extension UIView {
    public func constraint(on superview: UIView) -> Constraint {
        return Constraint(view: self, superview: superview, constraintsChain: ConstraintsChain())
    }
}

public struct Constraint {
    public let view: UIView
    public let superview: UIView
    public let constraintsChain: ConstraintsChain
    
    init(view: UIView, superview: UIView, constraintsChain: ConstraintsChain) {
        if superview !== view.superview, superview !== view {
            superview.addSubview(view)
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view = view
        self.superview = superview
        self.constraintsChain = constraintsChain
    }
}

// MARK: - Activate/Deactivate constraints
extension Constraint {
    public func activate() {
        constraintsChain.activate()
    }
    
    public func deactivate() {
        constraintsChain.deactivate()
    }
    
    public func activateConstraint() {
        constraint?.isActive = true
    }
    
    public func deactivateConstraint() {
        constraint?.isActive = false
    }
    
    public var constraint: NSLayoutConstraint? {
        return constraintsChain.constraints.last
    }
}

// MARK: - Chaining
extension Constraint {
    public func chain(with other: Constraint) -> Constraint {
        return Constraint(view: other.view, superview: other.superview, constraintsChain: other.constraintsChain.merged(constraintsChain))
    }
    
    public func chain(with view: UIView, on superview: UIView) -> Constraint {
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain)
    }
}

// MARK: - Constraint methods
extension Constraint {
    public func pin(_ a1: NSLayoutAttribute, to a2: NSLayoutAttribute, of v2: UIView?, r: NSLayoutRelation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        _ = constraintsChain.pin(on: superview, attribute: a1, of: view, to: a2, of: v2, r: r, c: c, m: m)
        return self
    }
    
    public func width(c: CGFloat, r: NSLayoutRelation = .equal, m: CGFloat = 1) -> Constraint {
        return self
            .pin(.width, to: .width, of: nil, r: r, c: c, m: m)
    }
    
    public func height(c: CGFloat, r: NSLayoutRelation = .equal, m: CGFloat = 1) -> Constraint {
        return self
            .pin(.height, to: .height, of: nil, r: r, c: c, m: m)
    }
    
    public func size(to size: CGSize, r: NSLayoutRelation = .equal, m: CGFloat = 1) -> Constraint {
        return self
            .width(c: size.width, r: r, m: m)
            .height(c: size.height, r: r, m: m)
    }
    
    public func square(to side: CGFloat, r: NSLayoutRelation = .equal, m: CGFloat = 1) -> Constraint {
        return size(to: CGSize(width: side, height: side), r: r, m: m)
    }
    
    public func centerX(in p: UIView, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        return self
            .pin(.centerX, to: .centerX, of: p, r: .equal, c: c, m: m)
    }
    
    public func centerY(in p: UIView, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        return self
            .pin(.centerY, to: .centerY, of: p, r: .equal, c: c, m: m)
    }
    
    public func center(in p: UIView, c: (x: CGFloat, y: CGFloat) = (0, 0)) -> Constraint {
        return self
            .centerX(in: p, c: c.x)
            .centerY(in: p, c: c.y)
    }
    
    public func inset(left: CGFloat?, top: CGFloat?, right: CGFloat?, bottom: CGFloat?) -> Constraint {
        var constraint = left.map { self.pin(.left, to: .left, of: superview, c: $0, m: 1) } ?? self
        constraint = top.map { self.pin(.top, to: .top, of: superview, c: $0, m: 1) } ?? constraint
        constraint = right.map { self.pin(.right, to: .right, of: superview, c: -$0, m: 1) } ?? constraint
        constraint = bottom.map { self.pin(.bottom, to: .bottom, of: superview, c: -$0, m: 1) } ?? constraint
        return constraint
    }
    
    public func inset(insets: UIEdgeInsets) -> Constraint {
        return self
            .pin(.left, to: .left, of: superview, c: insets.left)
            .pin(.right, to: .right, of: superview, c: -insets.right)
            .pin(.top, to: .top, of: superview, c: insets.top)
            .pin(.bottom, to: .bottom, of: superview, c: -insets.bottom)
    }
    
    public func pin(_ edges: Edge..., c: CGFloat = 0) -> Constraint {
        guard !edges.isEmpty else {
            return inset(insets: UIEdgeInsetsMake(c, c, c, c))
        }
        
        return edges.set.reduce(self) {
            switch $1 {
            case .left:
                return $0.pin(.left, to: .left, of: superview, c: c)
            case .top:
                return $0.pin(.top, to: .top, of: superview, c: c)
            case .right:
                return $0.pin(.right, to: .right, of: superview, c: -c)
            case .bottom:
                return $0.pin(.bottom, to: .bottom, of: superview, c: -c)
            }
        }
    }
    
    public enum Edge {
        case left, top, right, bottom
    }
    
    public func frame(_ frame: CGRect) -> Constraint {
        return self
            .size(to: frame.size)
            .pin(.left, to: .left, of: superview, c: frame.origin.x)
            .pin(.top, to: .top, of: superview, c: frame.origin.y)
    }
}

extension Array where Element: Hashable {
    var set: Set<Element> {
        return Set(self)
    }
}
