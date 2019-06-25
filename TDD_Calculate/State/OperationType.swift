//
//  OperationType.swift
//  TDD_Calculate
//
//  Created by Jimmy Li on 2019/3/22.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import UIKit

enum OperationType: Int {
    case command
    case function
    case digital
    case result
}

extension OperationType {
    var titleColor: UIColor {
        switch self {
        case .command:
            return UIColor.white
        case .function:
            return UIColor.black
        case .digital:
            return UIColor.white
        case .result:
            return UIColor.white
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .command:
            return UIColor.theme.orange.apple
        case .function:
            return UIColor.theme.lightGary.apple
        case .digital:
            return UIColor.theme.darkGray.apple
        case .result:
            return UIColor.theme.orange.apple
        }
    }
}

enum PressType: String {
    /// +
    case addition = "+"
    /// -
    case subtraction = "-"
    /// ×
    case multiplication = "×"
    /// ÷
    case division = "÷"
    /// =
    case equal = "="
    
    /// +/-
    case sign = "+/-"
    /// AC / C
    case clean = "AC"
    /// %
    case percentage = "%"
    
    /// .
    case digit = "."
    /// 0
    case zero = "0"
    /// 1
    case one = "1"
    /// 2
    case two = "2"
    /// 3
    case three = "3"
    /// 4
    case four = "4"
    /// 5
    case five = "5"
    /// 6
    case six = "6"
    /// 7
    case seven = "7"
    /// 8
    case eight = "8"
    /// 9
    case nine = "9"
}

extension PressType {
    var name: String {
        return rawValue
    }
    
    var operation: OperationType {
        switch self {
        case .addition,
             .subtraction,
             .division,
             .multiplication:
            return .command
        case .clean,
             .sign,
             .percentage:
            return .function
        case .equal:
            return .result
        default:
            return .digital
        }
    }
    
    var state: OperationState {
        switch self {
        case .addition:
            return OperationStateAddition()
        case .subtraction:
            return OperationStateSubtraction()
        case .division:
            return OperationStateDivision()
        case .multiplication:
            return OperationStateMultiplication()
        case .equal:
            return OperationStateEqual()
        case .sign:
            return OperationStateSign()
        case .clean:
            return OperationStateClean()
        case .percentage:
            return OperationStatePercentage()
        case .digit:
            return OperationStateDigit()
        case .zero:
            return OperationStateZero()
        case .one:
            return OperationStateOne()
        case .two:
            return OperationStateTwo()
        case .three:
            return OperationStateThree()
        case .four:
            return OperationStateFour()
        case .five:
            return OperationStateFive()
        case .six:
            return OperationStateSix()
        case .seven:
            return OperationStateSeven()
        case .eight:
            return OperationStateEight()
        case .nine:
            return OperationStateNight()
        }
    }
}
