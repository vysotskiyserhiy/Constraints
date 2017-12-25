//
//  ConstraintsChain.swift
//  Constraints
//
//  Created by Serhiy Vysotskiy on 12/24/17.
//  Copyright © 2017 Serhiy Vysotskiy. All rights reserved.
//

/// The very engine for constrainting
public class ConstraintsChain {
    var constraints: [NSLayoutConstraint] = []
}

// MARK: - Basic pin method
extension ConstraintsChain {
    public func pin(on s: UIView, attribute a1: NSLayoutAttribute, of v1: UIView, to a2: NSLayoutAttribute, of v2: UIView?, r: NSLayoutRelation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> ConstraintsChain {
        check(v1, on: s)
        v2.map { check($0, on: s) }
        constraints.append(NSLayoutConstraint(item: v1, attribute: a1, relatedBy: r, toItem: v2, attribute: a2, multiplier: m, constant: c))
        return self
    }
    
    private func check(_ view: UIView, on superview: UIView) {
        if !(view.superview === superview || view === superview) {
            superview.addSubview(view)
        }
        
        if view !== superview {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

// MARK: - Activate/Deactivate constraints
extension ConstraintsChain {
    public func activate() {
        NSLayoutConstraint.activate(constraints)
    }
    
    public func deactivate() {
        NSLayoutConstraint.deactivate(constraints)
    }
}

// MARK: - Constraint conversion
extension ConstraintsChain {
    public func chain(with other: Constraint) -> Constraint {
        return Constraint(view: other.view, superview: other.superview, constraintsChain: other.constraintsChain.merged(self))
    }
    
    public func chain(with view: UIView, on superview: UIView) -> Constraint {
        return Constraint(view: view, superview: superview, constraintsChain: self)
    }
    
    public func merged(_ other: ConstraintsChain) -> ConstraintsChain {
        constraints.append(contentsOf: other.constraints)
        return self
    }
}

// MARK: - Convenience constrainting methods
extension ConstraintsChain {
    public func centerX(on s: UIView, views vs: [UIView], in p: UIView, c: CGFloat = 0, m: CGFloat = 1) -> ConstraintsChain {
        return vs.reduce(self, { $0.pin(on: s, attribute: .centerX, of: $1, to: .centerX, of: p, r: .equal, c: c, m: m) })
    }
    
    public func centerY(on s: UIView, views vs: [UIView], in p: UIView, c: CGFloat = 0, m: CGFloat = 1) -> ConstraintsChain {
        return vs.reduce(self, { $0.pin(on: s, attribute: .centerY, of: $1, to: .centerY, of: p, r: .equal, c: c, m: m) })
    }
}
