//
//  ViewModel.swift
//  TDD_Calculate
//
//  Created by Jimmy Li on 2019/3/14.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import Foundation

class ViewModel {
    
    struct ViewModelOutput {
        var handler: ((String) -> Void)?
    }
    typealias Output = ViewModelOutput
    
    var output: Output
    
    let context: OperationContext = OperationContext()
    
    init() {
        self.output = Output()
    }
    
    func put(_ pressType: PressType) {
        context.press(state: pressType.state)
        output.handler?(context.display)
    }
}
