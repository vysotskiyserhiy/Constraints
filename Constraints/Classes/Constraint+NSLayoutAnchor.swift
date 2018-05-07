//
//  Constraint+NSLayoutAnchor.swift
//  Constraints
//
//  Created by Serhiy Vysotskiy on 12/26/17.
//  Copyright © 2017 vysotskiyserhiy. All rights reserved.
//

import UIKit

extension Constraint {
    public func xAnchor(_ anchor: NSLayoutXAxisAnchor, to anotherAnchor: NSLayoutXAxisAnchor, c: CGFloat = 0) -> Constraint {
        constraintsChain.constraints.append(anchor.constraint(equalTo: anotherAnchor, constant: c))
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
    
    public func yAnchor(_ anchor: NSLayoutYAxisAnchor, to anotherAnchor: NSLayoutYAxisAnchor, c: CGFloat = 0) -> Constraint {
        constraintsChain.constraints.append(anchor.constraint(equalTo: anotherAnchor, constant: c))
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
    
    public func dAnchor(_ anchor: NSLayoutDimension, c: CGFloat) -> Constraint {
        constraintsChain.constraints.append(anchor.constraint(equalToConstant: c))
        return Constraint(view: view, superview: superview, constraintsChain: constraintsChain, constraint: constraintsChain.constraints.last)
    }
}

//@available(iOS 11.0, *)
//extension Constraint {
//    public func safePin(_ edges: Edge..., c: CGFloat = 0) -> Constraint {
//        var newEdges = edges
//
//        if edges.isEmpty {
//            newEdges = [.left, .top, .right, .bottom]
//        }
//
//        return newEdges.set.reduce(self) {
//            switch $1 {
//            case .left:
//                return $0.xAnchor(view.leftAnchor, to: superview.safeAreaLayoutGuide.leftAnchor, c: c)
//            case .top:
//                return $0.yAnchor(view.topAnchor, to: superview.safeAreaLayoutGuide.topAnchor, c: c)
//            case .right:
//                return $0.xAnchor(view.rightAnchor, to: superview.safeAreaLayoutGuide.rightAnchor, c: -c)
//            case .bottom:
//                return $0.yAnchor(view.bottomAnchor, to: superview.safeAreaLayoutGuide.bottomAnchor, c: -c)
//            }
//        }
//    }
//}

extension Constraint {
    public func safePin(_ edges: Edge..., c: CGFloat = 0) -> Constraint {
        if #available(iOS 11.0, *) {
            var newEdges = edges
            
            if edges.isEmpty {
                newEdges = [.left, .top, .right, .bottom]
            }
            
            return newEdges.set.reduce(self) {
                switch $1 {
                case .left:
                    return $0.xAnchor(view.leftAnchor, to: superview.safeAreaLayoutGuide.leftAnchor, c: c)
                case .top:
                    return $0.yAnchor(view.topAnchor, to: superview.safeAreaLayoutGuide.topAnchor, c: c)
                case .right:
                    return $0.xAnchor(view.rightAnchor, to: superview.safeAreaLayoutGuide.rightAnchor, c: -c)
                case .bottom:
                    return $0.yAnchor(view.bottomAnchor, to: superview.safeAreaLayoutGuide.bottomAnchor, c: -c)
                }
            }
        } else {
            guard !edges.isEmpty else {
                return pin(.left, to: .left, of: view, c: c)
                    .pin(.top, to: .top, of: view, c: c)
                    .pin(.right, to: .right, of: view, c: -c)
                    .pin(.bottom, to: .bottom, of: view, c: -c)
            }
            
            return edges.set.reduce(self) { constraint, edge in
                switch edge {
                case .left:
                    return constraint.pin(.left, to: .left, of: view, c: c)
                case .top:
                    return constraint.pin(.top, to: .top, of: view, c: c)
                case .right:
                    return constraint.pin(.right, to: .right, of: view, c: -c)
                case .bottom:
                    return constraint.pin(.bottom, to: .bottom, of: view, c: -c)
                }
            }
        }
    }
}
