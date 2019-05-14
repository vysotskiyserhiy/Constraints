//
//  Constraint+NSLayoutAnchor.swift
//  Constraints
//
//  Created by Serhiy Vysotskiy on 12/26/17.
//  Copyright © 2017 vysotskiyserhiy. All rights reserved.
//

import UIKit

extension Constraint {
    @discardableResult
    public func xAnchor(_ anchor: XAnchor, to anotherAnchor: XAnchor, r: NSLayoutConstraint.Relation = .equal, c: CGFloat = 0) -> Constraint {
        let constraint: NSLayoutConstraint
        switch r {
        case .lessThanOrEqual:
            constraint = anchor.anchor.constraint(lessThanOrEqualTo: anotherAnchor.anchor, constant: c * scale)
        case .equal:
            constraint = anchor.anchor.constraint(equalTo: anotherAnchor.anchor, constant: c * scale)
        case .greaterThanOrEqual:
            constraint = anchor.anchor.constraint(greaterThanOrEqualTo: anotherAnchor.anchor, constant: c * scale)
        @unknown default:
            fatalError()
        }
        
        constraintsChain.constraints.append(constraint)
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
    
    @discardableResult
    public func yAnchor(_ anchor: YAnchor, to anotherAnchor: YAnchor, r: NSLayoutConstraint.Relation = .equal, c: CGFloat = 0) -> Constraint {
        let constraint: NSLayoutConstraint
        switch r {
        case .lessThanOrEqual:
            constraint = anchor.anchor.constraint(lessThanOrEqualTo: anotherAnchor.anchor, constant: c * scale)
        case .equal:
            constraint = anchor.anchor.constraint(equalTo: anotherAnchor.anchor, constant: c * scale)
        case .greaterThanOrEqual:
            constraint = anchor.anchor.constraint(greaterThanOrEqualTo: anotherAnchor.anchor, constant: c * scale)
        @unknown default:
            fatalError()
        }
        
        constraintsChain.constraints.append(constraint)
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
    
    @discardableResult
    public func dAnchor(_ anchor: DAnchor, r: NSLayoutConstraint.Relation = .equal, c: CGFloat) -> Constraint {
        let constraint: NSLayoutConstraint
        switch r {
        case .lessThanOrEqual:
            constraint = anchor.anchor.constraint(lessThanOrEqualToConstant: c * scale)
        case .equal:
            constraint = anchor.anchor.constraint(equalToConstant: c * scale)
        case .greaterThanOrEqual:
            constraint = anchor.anchor.constraint(greaterThanOrEqualToConstant: c * scale)
        @unknown default:
            fatalError()
        }
        
        constraintsChain.constraints.append(constraint)
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
    
    @discardableResult
    public func dAnchor(_ anchor: DAnchor, to anotherAnchor: DAnchor, r: NSLayoutConstraint.Relation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        let constraint: NSLayoutConstraint
        switch r {
        case .lessThanOrEqual:
            constraint = anchor.anchor.constraint(lessThanOrEqualTo: anotherAnchor.anchor, multiplier: m, constant: c * scale)
        case .equal:
            constraint = anchor.anchor.constraint(equalTo: anotherAnchor.anchor, multiplier: m, constant: c * scale)
        case .greaterThanOrEqual:
            constraint = anchor.anchor.constraint(greaterThanOrEqualTo: anotherAnchor.anchor, multiplier: m, constant: c * scale)
        @unknown default:
            fatalError()
        }
        
        constraintsChain.constraints.append(constraint)
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
    
    @discardableResult
    @available(iOS 11.0, *)
    public func safeXAnchor(_ anchor: XAnchor, to anotherAnchor: SafeXAnchor, r: NSLayoutConstraint.Relation = .equal, c: CGFloat = 0) -> Constraint {
        let constraint: NSLayoutConstraint
        switch r {
        case .lessThanOrEqual:
            constraint = anchor.anchor.constraint(lessThanOrEqualTo: anotherAnchor.anchor, constant: c * scale)
        case .equal:
            constraint = anchor.anchor.constraint(equalTo: anotherAnchor.anchor, constant: c * scale)
        case .greaterThanOrEqual:
            constraint = anchor.anchor.constraint(greaterThanOrEqualTo: anotherAnchor.anchor, constant: c * scale)
        @unknown default:
            fatalError()
        }
        
        constraintsChain.constraints.append(constraint)
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
    
    @discardableResult
    @available(iOS 11.0, *)
    public func safeYAnchor(_ anchor: YAnchor, to anotherAnchor: SafeYAnchor, r: NSLayoutConstraint.Relation = .equal, c: CGFloat = 0) -> Constraint {
        let constraint: NSLayoutConstraint
        switch r {
        case .lessThanOrEqual:
            constraint = anchor.anchor.constraint(lessThanOrEqualTo: anotherAnchor.anchor, constant: c * scale)
        case .equal:
            constraint = anchor.anchor.constraint(equalTo: anotherAnchor.anchor, constant: c * scale)
        case .greaterThanOrEqual:
            constraint = anchor.anchor.constraint(greaterThanOrEqualTo: anotherAnchor.anchor, constant: c * scale)
        @unknown default:
            fatalError()
        }
        
        constraintsChain.constraints.append(constraint)
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
    
    @discardableResult
    @available(iOS 11.0, *)
    public func safeDAnchor(_ anchor: DAnchor, to anotherAnchor: SafeDAnchor, r: NSLayoutConstraint.Relation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        let constraint: NSLayoutConstraint
        switch r {
        case .lessThanOrEqual:
            constraint = anchor.anchor.constraint(lessThanOrEqualTo: anotherAnchor.anchor, multiplier: m, constant: c * scale)
        case .equal:
            constraint = anchor.anchor.constraint(equalTo: anotherAnchor.anchor, multiplier: m, constant: c * scale)
        case .greaterThanOrEqual:
            constraint = anchor.anchor.constraint(greaterThanOrEqualTo: anotherAnchor.anchor, multiplier: m, constant: c * scale)
        @unknown default:
            fatalError()
        }
        
        constraintsChain.constraints.append(constraint)
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
}

public var safeMargins: UIEdgeInsets = .undefined

extension Constraint {
    @discardableResult
    public func safePin(_ edges: Edge..., r: NSLayoutConstraint.Relation = .equal, c: CGFloat = 0) -> Constraint {
        if #available(iOS 11.0, *) {
            var newEdges = edges
            
            if edges.isEmpty {
                newEdges = [.left, .top, .right, .bottom]
            }
            
            return newEdges.set.reduce(self) { ct, edge in
                switch edge {
                case .left:
                    return ct.safeXAnchor(.left(view), to: .left(superview), r: r, c: c)
                case .top:
                    return ct.safeYAnchor(.top(view), to: .top(superview), r: r, c: c)
                case .right:
                    return ct.safeXAnchor(.right(view), to: .right(superview), r: r, c: -c)
                case .bottom:
                    return ct.safeYAnchor(.bottom(view), to: .bottom(superview), r: r, c: -c)
                }
            }
            
            
        } else {
            if safeMargins == .undefined {
                assertionFailure("Please specify safe margins 'safeMargins = UIEdgeInsets(...)'")
                safeMargins = .zero
            }
            
            guard !edges.isEmpty else {
                return pin(.left, to: .left, of: superview, r: r, c: c + safeMargins.left)
                    .pin(.top, to: .top, of: superview, r: r, c: c + safeMargins.top)
                    .pin(.right, to: .right, of: superview, r: r, c: -c - safeMargins.right)
                    .pin(.bottom, to: .bottom, of: superview, r: r, c: -c - safeMargins.bottom)
            }
            
            return edges.set.reduce(self) { constraint, edge in
                switch edge {
                case .left:
                    return constraint.pin(.left, to: .left, of: superview, r: r, c: c + safeMargins.left)
                case .top:
                    return constraint.pin(.top, to: .top, of: superview, r: r, c: c + safeMargins.top)
                case .right:
                    return constraint.pin(.right, to: .right, of: superview, r: r, c: -c - safeMargins.right)
                case .bottom:
                    return constraint.pin(.bottom, to: .bottom, of: superview, r: r, c: -c - safeMargins.bottom)
                }
            }
        }
    }
}

fileprivate extension UIEdgeInsets {
    static let undefined = UIEdgeInsets(top: .greatestFiniteMagnitude, left: .greatestFiniteMagnitude, bottom: .greatestFiniteMagnitude, right: .greatestFiniteMagnitude)
}

public extension Constraint {
    @available(iOS 11.0, *)
    enum SafeXAnchor {
        case left(UIView)
        case right(UIView)
        case centerX(UIView)
        
        case leading(UIView)
        case trailing(UIView)
        
        var anchor: NSLayoutXAxisAnchor {
            switch self {
            case let .left(view):
                return view.safeAreaLayoutGuide.leftAnchor
            case let .right(view):
                return view.safeAreaLayoutGuide.rightAnchor
            case let .centerX(view):
                return view.safeAreaLayoutGuide.centerXAnchor
            case let .leading(view):
                return view.safeAreaLayoutGuide.leadingAnchor
            case let .trailing(view):
                return view.safeAreaLayoutGuide.trailingAnchor
            }
        }
    }
    
    @available(iOS 11.0, *)
    enum SafeYAnchor {
        case top(UIView)
        case bottom(UIView)
        case centerY(UIView)
        
        var anchor: NSLayoutYAxisAnchor {
            switch self {
            case let .top(view):
                return view.safeAreaLayoutGuide.topAnchor
            case let .bottom(view):
                return view.safeAreaLayoutGuide.bottomAnchor
            case let .centerY(view):
                return view.safeAreaLayoutGuide.centerYAnchor
            }
        }
    }
    
    @available(iOS 11.0, *)
    enum SafeDAnchor {
        case width(UIView)
        case height(UIView)
        
        var anchor: NSLayoutDimension {
            switch self {
            case let .width(view):
                return view.safeAreaLayoutGuide.widthAnchor
            case let .height(view):
                return view.safeAreaLayoutGuide.heightAnchor
            }
        }
    }
    
    enum XAnchor {
        case left(UIView)
        case right(UIView)
        case centerX(UIView)
        
        case leading(UIView)
        case trailing(UIView)
        
        var anchor: NSLayoutXAxisAnchor {
            switch self {
            case let .left(view):
                return view.leftAnchor
            case let .right(view):
                return view.rightAnchor
            case let .centerX(view):
                return view.centerXAnchor
            case let .leading(view):
                return view.leadingAnchor
            case let .trailing(view):
                return view.trailingAnchor
            }
        }
    }
    
    enum YAnchor {
        case top(UIView)
        case bottom(UIView)
        case centerY(UIView)
        
        case firstBaseline(UIView)
        case lastBaseline(UIView)
        
        var anchor: NSLayoutYAxisAnchor {
            switch self {
            case let .top(view):
                return view.topAnchor
            case let .bottom(view):
                return view.bottomAnchor
            case let .centerY(view):
                return view.centerYAnchor
            case let .firstBaseline(view):
                return view.firstBaselineAnchor
            case let .lastBaseline(view):
                return view.lastBaselineAnchor
            }
        }
    }
    
    enum DAnchor {
        case width(UIView)
        case height(UIView)
        
        var anchor: NSLayoutDimension {
            switch self {
            case let .width(view):
                return view.widthAnchor
            case let .height(view):
                return view.heightAnchor
            }
        }
    }
}
