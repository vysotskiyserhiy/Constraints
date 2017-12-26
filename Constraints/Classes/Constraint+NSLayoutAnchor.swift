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
        return self
    }
    
    public func yAnchor(_ anchor: NSLayoutYAxisAnchor, to anotherAnchor: NSLayoutYAxisAnchor, c: CGFloat = 0) -> Constraint {
        constraintsChain.constraints.append(anchor.constraint(equalTo: anotherAnchor, constant: c))
        return self
    }
    
    public func dAnchor(_ anchor: NSLayoutDimension, c: CGFloat) -> Constraint {
        constraintsChain.constraints.append(anchor.constraint(equalToConstant: c))
        return self
    }
}

