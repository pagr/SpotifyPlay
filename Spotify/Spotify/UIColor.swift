//
//  UIColor.swift
//  Santander Mobile App Sweden
//
//  Created by Paul Griffin on 2017-01-27.
//  Copyright © 2017 Santander. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt) {
        let red = CGFloat((hex >> 16) & 0xff) / 255.0
        let green = CGFloat((hex >> 8) & 0xff) / 255.0
        let blue = CGFloat(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func interpolateRGBColorTo(end:UIColor, fraction:CGFloat) -> UIColor {
        var f = max(0, fraction)
        f = min(1, fraction)
        
        var c1 = self.cgColor.components!
        var c2 = end.cgColor.components!
        var c3: [CGFloat] = [0, 0, 0, 0]
        let gamma:CGFloat = 2.2
        for i in 0..<4 {
            c1[i] = pow(c1[i], gamma)
            c2[i] = pow(c2[i], gamma)
            c3[i] = pow(c1[i] + (c2[i] - c1[i]) * f, 1 / gamma)
        }
        
        return UIColor.init(red:c3[0], green:c3[1], blue:c3[2], alpha:c3[3])
    }
}
