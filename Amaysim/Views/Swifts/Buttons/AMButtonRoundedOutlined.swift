//
//  AMButtonRoundedOutlined.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import UIKit

@IBDesignable
class AMButtonRoundedOutlined: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            setupView()
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet{
            setupView()
        }
    }
    
    func setupView() {
        layer.cornerRadius =    cornerRadius
        layer.borderWidth =     borderWidth
        layer.borderColor =     borderColor?.cgColor
    }
    
    override func prepareForInterfaceBuilder(){
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}
