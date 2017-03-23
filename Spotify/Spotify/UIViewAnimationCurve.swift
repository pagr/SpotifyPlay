//
//  UIViewAnimationCurve.swift
//  Santander Mobile App Sweden
//
//  Created by Paul Griffin on 2017-02-15.
//  Copyright © 2017 Santander. All rights reserved.
//

import UIKit

extension UIViewAnimationCurve{
    var animationOption: UIViewAnimationOptions{
        get{
            switch self {
            case .easeIn:
                return .curveEaseIn
            case .easeOut:
                return .curveEaseOut
            case .easeInOut:
                return .curveEaseInOut
            case .linear:
                return .curveLinear
            }
        }
    }
}
