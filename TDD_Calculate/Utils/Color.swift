//
//  Color.swift
//  TDD_Calculate
//
//  Created by Jimmy Li on 2019/3/25.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        var a = Int(color >> 24) & mask;
        if hexString.count <= 8 {
            a = 255;
        }
        let alpha = CGFloat(a) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

extension UIColor {
    enum theme {
        case lightGary
        case darkGray
        case orange
    }
}

extension UIColor.theme {
    var apple: UIColor {
        switch self {
        case .lightGary:
            return UIColor(hexString: "#A5A5A5")
        case .darkGray:
            return UIColor(hexString: "#323332")
        case .orange:
            return UIColor(hexString: "#F09A37")
        }
    }
}
