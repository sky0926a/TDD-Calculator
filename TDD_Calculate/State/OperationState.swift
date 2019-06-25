//
//  OperationState.swift
//  TDD_Calculate
//
//  Created by Jimmy Li on 2019/3/18.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import Foundation

struct CalculateData {
    var display: String = .defaultValue
    var cache: String = .defaultValue
    var isEditing: Bool = false
}

class OperationContext {
    private var lastCommanState: OperationState = OperationStateClean()
    private var data: CalculateData = CalculateData()
    
    var display: String {
        return data.display
    }
    
    func press(state: OperationState) {
        state.press(reference: lastCommanState.type, data: &data)
        if state.type.operation == .command || state.type == .clean  {
            lastCommanState = state
        }
    }
}

protocol OperationState {
    var type: PressType {get}
    var name: String { get }
    var operation: OperationType { get }

    func press(reference: PressType, data: inout CalculateData)
}

extension OperationState {
    var name: String { return type.rawValue }
    var operation: OperationType { return type.operation }
}

protocol OperationDigitalState: OperationState {}

extension OperationDigitalState {
    func press(reference: PressType, data: inout CalculateData) {
        if data.display.count < 9  {
            if data.isEditing {
                data.display = data.display.isLeaderZero ? name : data.display + name
            }
            else {
                data.cache = data.display
                data.display = type.name
            }
        }
        data.isEditing = true
    }
}

protocol OperationCommandState: OperationState {
    func calcute(data: inout CalculateData)
}

extension OperationCommandState {
    func press(reference: PressType ,data: inout CalculateData) {
        if reference.operation == .command, data.isEditing,
            let command: OperationCommandState = reference.state as? OperationCommandState {
            command.calcute(data: &data)
        }
        data.isEditing = false
    }
}

class OperationStateZero: OperationDigitalState {
    var type: PressType { return .zero }
}

class OperationStateOne: OperationDigitalState {
    var type: PressType { return .one }
}

class OperationStateTwo: OperationDigitalState {
    var type: PressType { return .two }
}

class OperationStateThree: OperationDigitalState {
    var type: PressType { return .three }
}

class OperationStateFour: OperationDigitalState {
    var type: PressType { return .four }
}

class OperationStateFive: OperationDigitalState {
    var type: PressType { return .five }
}

class OperationStateSix: OperationDigitalState {
    var type: PressType { return .six }
}

class OperationStateSeven: OperationDigitalState {
    var type: PressType { return .seven }
}

class OperationStateEight: OperationDigitalState {
    var type: PressType { return .eight }
}

class OperationStateNight: OperationDigitalState {
    var type: PressType { return .nine }
}

class OperationStateAddition: OperationCommandState {
    var type: PressType { return .addition }
    func calcute(data: inout CalculateData) {
        data.display = (data.cache.value + data.display.value).toString
    }
}

class OperationStateSubtraction: OperationCommandState {
    var type: PressType { return .subtraction }
    func calcute(data: inout CalculateData) {
        data.display = (data.cache.value - data.display.value).toString
    }
}

class OperationStateMultiplication: OperationCommandState {
    var type: PressType { return .multiplication }
    func calcute(data: inout CalculateData) {
        data.display = (data.cache.value * data.display.value).toString
    }
}

class OperationStateDivision: OperationCommandState {
    var type: PressType { return .division }
    func calcute(data: inout CalculateData) {
        data.display = (data.cache.value / data.display.value).toString
    }
}

class OperationStateSign: OperationState {
    var type: PressType { return .sign }
    
    func press(reference: PressType, data: inout CalculateData) {
        data.display = (-data.display.value).toString
    }
}

class OperationStateClean: OperationState {
    var type: PressType { return .clean }
    
    func press(reference: PressType, data: inout CalculateData) {
        data.isEditing = false
        data.cache.clear()
        data.display.clear()
    }
}

class OperationStateEqual: OperationState {
    var type: PressType { return .equal }
    func press(reference: PressType, data: inout CalculateData) {
        if reference.state.operation == .command  {
            let temp: String = data.isEditing ? data.display : data.cache
            data.isEditing = true
            reference.state.press(reference: reference, data: &data)
            data.cache = temp
        }
        data.isEditing = false
    }
}


class OperationStatePercentage: OperationState {
    var type: PressType { return .percentage }
    
    func press(reference: PressType, data: inout CalculateData) {
        data.display = (data.display.value / 100.0).toString
    }
}

class OperationStateDigit: OperationState {
    var type: PressType { return .digit }
    
    func press(reference: PressType, data: inout CalculateData) {
        if !data.display.isContainDot {
            data.display.append(".")
        }
    }
}
