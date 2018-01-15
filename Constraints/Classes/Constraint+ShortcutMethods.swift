//
//  Constraint+ShortcutMethods.swift
//  Constraints
//
//  Created by Serhiy Vysotskiy on 16.01.2018.
//  Copyright © 2018 vysotskiyserhiy. All rights reserved.
//

import UIKit

extension Constraint {
    public func pin(_ edges: Edge..., toViewsEdges view: UIView, c: CGFloat = 0) -> Constraint {
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
    
    public func pin(same a: NSLayoutAttribute, as v: UIView?, r: NSLayoutRelation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        _ = constraintsChain.pin(on: superview, attribute: a, of: view, to: a, of: v, r: r, c: c, m: m)
        return self
    }
    
    public func pin(_ a: NSLayoutAttribute, toTopOf v: UIView?, r: NSLayoutRelation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        _ = constraintsChain.pin(on: superview, attribute: a, of: view, to: .top, of: v, r: r, c: c, m: m)
        return self
    }
    
    public func pin(_ a: NSLayoutAttribute, toBottomOf v: UIView?, r: NSLayoutRelation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        _ = constraintsChain.pin(on: superview, attribute: a, of: view, to: .bottom, of: v, r: r, c: c, m: m)
        return self
    }
    
    public func pin(_ a: NSLayoutAttribute, toLeftOf v: UIView?, r: NSLayoutRelation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        _ = constraintsChain.pin(on: superview, attribute: a, of: view, to: .left, of: v, r: r, c: c, m: m)
        return self
    }
    
    public func pin(_ a: NSLayoutAttribute, toRightOf v: UIView?, r: NSLayoutRelation = .equal, c: CGFloat = 0, m: CGFloat = 1) -> Constraint {
        _ = constraintsChain.pin(on: superview, attribute: a, of: view, to: .right, of: v, r: r, c: c, m: m)
        return self
    }
}
