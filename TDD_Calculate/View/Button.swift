//
//  Button.swift
//  TDD_Calculate
//
//  Created by Li Jimmy on 2019/3/25.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import UIKit

class Button: UIButton {
    convenience init() {
        self.init(type: .system)
        setupUI()
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let size: CGFloat = min(rect.height, rect.width)
        self.layer.cornerRadius = size / 2
    }
}

extension Button: ViewControllerFlowProtocol {
    func setupUI() {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        clipsToBounds = true
    }
}
