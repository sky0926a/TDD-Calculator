//
//  String.swift
//  TDD_Calculate
//
//  Created by Jimmy Li on 2019/3/22.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import Foundation

extension String {
    static let defaultValue: String = "0"
    
    var withoutTailDot: String {
        var value: String = self
        if let last = value.last, last == "." {
            value.removeLast()
        }
        return value
    }
    
    var isContainDot: Bool {
        return self.contains(".")
    }
    
    var value: Double {
        return Double(withoutTailDot) ?? 0.0
    }
    
    var isLeaderZero: Bool {
        return self == .defaultValue
    }
    
    mutating func clear() {
        self = .defaultValue
    }
}

extension Double {
    var toString: String {
        return String(format: "%g", self)
    }
}
