//
//  ViewController.swift
//  TDD_Calculate
//
//  Created by Jimmy Li on 2019/3/14.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct ViewData {
        var view: UIStackView
        var types: [PressType]
    }
    
    @IBOutlet weak var topCotainer: UIView!
    @IBOutlet weak var bottomCotainer: UIView!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var line0StackView: UIStackView!
    @IBOutlet weak var line1StackView: UIStackView!
    @IBOutlet weak var line2StackView: UIStackView!
    @IBOutlet weak var line3StackView: UIStackView!
    @IBOutlet weak var line4StackView: UIStackView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var line0OneType: [PressType] = [.clean,.sign,.percentage,.division]
    var line1OneType: [PressType] = [.seven,.eight,.nine,.multiplication]
    var line2OneType: [PressType] = [.four,.five,.six,.subtraction]
    var line3OneType: [PressType] = [.one,.two,.three,.addition]
    var line4OneType: [PressType] = [.zero,.digit,.equal]
    
    let model: ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        initMethod()
    }
}

extension ViewController: ViewControllerFlowProtocol {
    func setupUI() {
        view.backgroundColor = UIColor.black
        
        bottomCotainer.backgroundColor = UIColor.clear
        
        resultLabel.textColor = UIColor.white
        resultLabel.textAlignment = .right
        resultLabel.font = UIFont.systemFont(ofSize: 90, weight: .light)
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.minimumScaleFactor = 0.2
        
        containerStackView.spacing = 15
        
        let viewdatas: [ViewData] = [
            ViewData(view: line0StackView, types: line0OneType),
            ViewData(view: line1StackView, types: line1OneType),
            ViewData(view: line2StackView, types: line2OneType),
            ViewData(view: line3StackView, types: line3OneType),
            ViewData(view: line4StackView, types: line4OneType)
        ]
        
        for data in viewdatas {
            generateView(data: data)
        }
        
    }
    
    func setupLayout() {
        if let zeroButton: Button = line4StackView.arrangedSubviews[0] as? Button,
            let dotButton: Button = line4StackView.arrangedSubviews[1] as? Button,
            let equalButton: Button = line4StackView.arrangedSubviews[2] as? Button {
            NSLayoutConstraint(item: dotButton, attribute: .width, relatedBy: .equal, toItem: zeroButton, attribute: .width, multiplier: 0.5, constant: -10).isActive = true
            NSLayoutConstraint(item: equalButton, attribute: .width, relatedBy: .equal, toItem: zeroButton, attribute: .width, multiplier: 0.5, constant: -10).isActive = true
        }
    }
    func initMethod() {
        model.output.handler = { [weak self] value in
            self?.resultLabel.text = value
        }
        model.put(.clean)
    }
}

extension ViewController {
    func generateView(data: ViewData) {
        data.view.spacing = 15
        for atype in data.types {
            let button: Button = Button()
            button.setTitle(atype.name, for: .normal)
            button.setTitleColor(atype.operation.titleColor, for: .normal)
            button.backgroundColor = atype.operation.backgroundColor
            button.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
            data.view.addArrangedSubview(button)
        }
    }
    
    @objc func tap(_ button: UIButton) {
        guard let text: String = button.title(for: .normal), let atype: PressType = PressType(rawValue: text) else {
            return
        }
        model.put(atype)
    }
}
