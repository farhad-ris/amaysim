//
//  AMTextFieldWithIconAndErrorLabel.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import Foundation
import UIKit

enum TheLocation: Int {
    case topLeft =          0
    case topCentre =        1
    case topRight =         2
    case bottomLeft =       3
    case bottomCentre =     4
    case bottomRight =      5
}

@IBDesignable
class AMTextFieldWithIconAndErrorLabel: UITextField, UITextFieldDelegate{
    
    var TitleLabel =                UILabel()
    var ErrorLabel =                UILabel()
    var paddings =                  UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 10)
    var didLayout =                 false
    var hostStack :                 UIStackView!
    var isThereLeftIcon =           false
    var isThereRightIcon =          false
    var theBackgroundCGColor :      CGColor?
    var theTitleLocation:           TheLocation?
    var theErrorLocation:           TheLocation?
    var theFont:                    UIFont?
    var theFontSize:                CGFloat?
    var theFontColor:               UIColor?
    
    
    @IBInspectable var theBackgroundColor : UIColor? {
        didSet {
            theBackgroundCGColor = theBackgroundColor?.cgColor
        }
    }
    
    
    @IBInspectable var textFont : String? = "Avenir-Book" {
        didSet{
            self.font = nil
            theFont = UIFont(name: textFont!, size: theFontSize ?? 16)
            self.font = theFont
        }
    }
    
    
    @IBInspectable var textFontSize : CGFloat = 16 {
        didSet{
            self.font = nil
            theFontSize = textFontSize
            theFont = UIFont(name: textFont ?? "Avenir-Book", size: theFontSize!)
            self.font = theFont
        }
    }
    
    
    @IBInspectable var textFontColor : UIColor? = UIColor.amTextFieldFontGreyishBrown {
        didSet{
            theFontColor = textFontColor
            self.textColor = theFontColor
        }
    }
    
    @IBInspectable var TitleString: String? {
        didSet{
            TitleLabel.text = TitleString
        }
    }
    
    @IBInspectable var TitleFontSize: CGFloat = 13 {
        didSet{
            let font = TitleLabel.font
            TitleLabel.font = UIFont(name: (font?.fontName)!, size: TitleFontSize)
        }
    }
    
    
    @IBInspectable var titleLocation: Int = 0 {
        didSet {
            if titleLocation < 6 {
                theTitleLocation = TheLocation(rawValue: titleLocation)
                
                switch theTitleLocation! {
                    
                case TheLocation.topLeft :
                    TitleLabel.frame = CGRect(x: 0,y: (20 + titleSpacing) * -1, width: frame.width, height: 20)
                    TitleLabel.textAlignment = .left
                    
                case TheLocation.topCentre :
                    TitleLabel.frame = CGRect(x: 0,y: (20 + titleSpacing) * -1, width: frame.width, height: 20)
                    TitleLabel.textAlignment = .center
                    
                case TheLocation.topRight :
                    TitleLabel.frame = CGRect(x: 0,y: (20 + titleSpacing) * -1, width: frame.width, height: 20)
                    TitleLabel.textAlignment = .right
                    
                case TheLocation.bottomLeft :
                    TitleLabel.frame = CGRect(x: 0,y: frame.height + titleSpacing, width: frame.width, height: 20)
                    TitleLabel.textAlignment = .left
                    
                case TheLocation.bottomCentre :
                    TitleLabel.frame = CGRect(x: 0,y: frame.height + titleSpacing, width: frame.width, height: 20)
                    TitleLabel.textAlignment = .center
                    
                case TheLocation.bottomRight :
                    TitleLabel.frame = CGRect(x: 0,y: frame.height + titleSpacing, width: frame.width, height: 20)
                    TitleLabel.textAlignment = .right
                }
            }
        }
    }
    
    
    @IBInspectable var titleColor: UIColor? {
        didSet {
            TitleLabel.textColor = titleColor
        }
    }
    
    
    @IBInspectable var titleSpacing : CGFloat = 5 {
        didSet{
            titleLocation = titleLocation  + 0
        }
    }
    
    @IBInspectable var ErrorString: String? {
        didSet{
            ErrorLabel.text = ErrorString
        }
    }
    
    
    @IBInspectable var ErrorFontSize: CGFloat = 11 {
        didSet{
            let font = ErrorLabel.font
            ErrorLabel.font = UIFont(name: (font?.fontName)!, size: ErrorFontSize)
        }
    }
    
    
    @IBInspectable var errorLocation: Int = 2 {
        didSet {
            if errorLocation < 6 {
                theErrorLocation = TheLocation(rawValue: errorLocation)
                
                switch theErrorLocation! {
                    
                case TheLocation.topLeft :
                    ErrorLabel.frame = CGRect(x: 0, y: (20 + errorSpacing) * -1, width: frame.width, height: 20)
                    ErrorLabel.textAlignment = .left
                    
                case TheLocation.topCentre :
                    ErrorLabel.frame = CGRect(x: 0, y: (20 + errorSpacing) * -1, width: frame.width, height: 20)
                    ErrorLabel.textAlignment = .center
                    
                case TheLocation.topRight :
                    ErrorLabel.frame = CGRect(x: 0, y: (20 + errorSpacing) * -1, width: frame.width, height: 20)
                    ErrorLabel.textAlignment = .right
                    
                case TheLocation.bottomLeft :
                    ErrorLabel.frame = CGRect(x: 0, y: frame.height + errorSpacing, width: frame.width, height: 20)
                    ErrorLabel.textAlignment = .left
                    
                case TheLocation.bottomCentre :
                    ErrorLabel.frame =  CGRect(x: 0, y: frame.height + errorSpacing, width: frame.width, height: 20)
                    ErrorLabel.textAlignment = .center
                    
                case TheLocation.bottomRight :
                    ErrorLabel.frame = CGRect(x: 0,y: frame.height + errorSpacing, width: frame.width, height: 20)
                    ErrorLabel.textAlignment = .right
                }
            }
        }
    }
    
    
    @IBInspectable var errorColor: UIColor? {
        didSet {
            ErrorLabel.textColor = errorColor
        }
    }
    
    
    @IBInspectable var errorSpacing : CGFloat = 5  {
        didSet{
            errorLocation = errorLocation + 0
        }
    }
    
    
    @IBInspectable var placeholderColor: UIColor?
    
    
    @IBInspectable var borderWidth : CGFloat = 0.5 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    @IBInspectable var borderColor : UIColor = UIColor.amTextFiledPlaceholderWarmGrey {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    @IBInspectable var leftIcon: UIImage? {
        didSet{
            
            isThereLeftIcon =           true
            if isThereRightIcon {
                
                paddings =              UIEdgeInsets(top: 14, left: CGFloat(frame.height + CGFloat(16)), bottom: 14, right: CGFloat(frame.height + CGFloat(16)))
                self.leftViewMode =     .always
                let le_img =            UIImageView(frame: CGRect(x: 0, y: 0, width: frame.height + 16 - 5, height: frame.height - 5))
                le_img.image =          leftIcon
                self.leftView =         le_img
                le_img.contentMode =    .scaleAspectFit
                le_img.image =          le_img.image!.withRenderingMode(.alwaysTemplate)
                le_img.tintColor =      textColor
                
            } else {
                
                paddings =              UIEdgeInsets(top: 14, left: CGFloat(frame.height + CGFloat(16)), bottom: 14, right: 14)
                self.leftViewMode =     .always
                let le_img =            UIImageView(frame: CGRect(x: 0, y: 0, width: frame.height + 16  - 5, height: frame.height - 5))
                le_img.image =          leftIcon
                self.leftView =         le_img
                le_img.contentMode =    .scaleAspectFit
                le_img.image =          le_img.image!.withRenderingMode(.alwaysTemplate)
                le_img.tintColor =      textColor
            }
        }
    }
    
    
    @IBInspectable var rightIcon: UIImage? {
        didSet{
            
            isThereRightIcon =          true
            if isThereLeftIcon {
                
                paddings =              UIEdgeInsets(top: 0, left: CGFloat(frame.height + CGFloat(16)), bottom: 0, right: CGFloat(frame.height + CGFloat(16)))
                self.rightViewMode =    .always
                let re_img =            UIImageView(frame: CGRect(x: 0, y: 0, width: frame.height - 5, height: frame.height - 5))
                re_img.image =          rightIcon
                self.rightView =        re_img
                re_img.contentMode =    .scaleAspectFit
                re_img.image =          re_img.image!.withRenderingMode(.alwaysTemplate)
                re_img.tintColor =      textColor
                
            } else {
                
                paddings =              UIEdgeInsets(top: 0, left: 10, bottom: 0, right: CGFloat(frame.height + CGFloat(16)))
                self.rightViewMode =    .always
                let re_img =            UIImageView(frame: CGRect(x: 0, y: 0, width: frame.height - 5, height: frame.height - 5))
                re_img.image =          rightIcon
                self.rightView =        re_img
                re_img.contentMode =    .scaleAspectFit
                re_img.image =          re_img.image!.withRenderingMode(.alwaysTemplate)
                re_img.tintColor =      textColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    override open func didMoveToSuperview() {
        
        if(self.superview  != nil){
            
            let instack = (superview?.isKind(of: UIStackView.self))
            if( instack! ){
                hostStack = superview as! UIStackView
            }
        }
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        if(!didLayout){
            //            theFont = self.font
            //            theFontSize = self.font?.pointSize
            self.font = nil
            self.font = UIFont(name: (theFont?.fontName)!, size: TitleFontSize)
            self.textColor = theFontColor
            
            didLayout = true
            let snapFrame = self.bounds
            let maskLayer = CAShapeLayer()
            let circlePath = UIBezierPath(roundedRect: snapFrame, cornerRadius: 5)
            maskLayer.path = circlePath.cgPath
            maskLayer.fillColor = theBackgroundCGColor ?? UIColor.amTextFiledbackgroundWhiteGray.cgColor
            self.layer.insertSublayer(maskLayer, at: 100)
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSForegroundColorAttributeName : placeholderColor ?? UIColor.amTextFiledPlaceholderWarmGrey, NSFontAttributeName:UIFont(name: "Avenir-Book", size: (font?.pointSize)!)!])
        }
    }
    
    override func prepareForInterfaceBuilder(){
        setup()
    }
    
    
    fileprivate func setup() {
        //set up\
        theFont = UIFont(name: textFont ?? "Avenir-Book", size: theFontSize ?? 16)
        theFontSize = theFontSize ?? 16
        theFontColor = self.textColor
        self.delegate = self
        self.font = nil
        self.font = UIFont(name: (theFont?.fontName)!, size: TitleFontSize)
        self.textColor = textFontColor ?? UIColor.amTextFieldFontGreyishBrown
        
        self.borderStyle = UITextBorderStyle.none
        self.layer.cornerRadius = 5
        self.clipsToBounds = false
        self.backgroundColor = UIColor.clear
        
        let thisColor = placeholderColor ?? UIColor.amTextFiledPlaceholderWarmGrey
        let thisFont =  UIFont(name: "Avenir-Book", size: (font?.pointSize)!)!
        let thisPlaceHolder = self.placeholder ?? ""
        let attString = NSAttributedString(string: thisPlaceHolder, attributes: [NSForegroundColorAttributeName : thisColor , NSFontAttributeName: thisFont])
        self.attributedPlaceholder = attString
        
        
        ErrorLabel = UILabel(frame: CGRect(x: 0, y: frame.height + errorSpacing, width: frame.width, height: 20) )
        ErrorLabel.textAlignment = .left
        ErrorLabel.clipsToBounds = false
        ErrorLabel.font = UIFont(name: (font?.fontName)!, size: ErrorFontSize)
        
        
        TitleLabel = UILabel(frame: CGRect(x: 0,y: frame.height + errorSpacing, width: frame.width, height: 20))
        TitleLabel.textAlignment = .left
        TitleLabel.clipsToBounds = false
        TitleLabel.font = UIFont(name: (font?.fontName)!, size: TitleFontSize)
        
        
        self.addSubview(TitleLabel)
        self.addSubview(ErrorLabel)
        ErrorLabel.isHidden = true
    }
    
    
    open func showError(){
        UIView.animate(withDuration: 0.7, animations: {
            self.resizeStack(22)
            self.ErrorLabel.isHidden = false
        })
    }
    
    
    open func hideError(){
        UIView.animate(withDuration: 0.7, animations: {
            self.ErrorLabel.isHidden = true
            self.resizeStack(8)
        })
    }
    
    
    fileprivate func resizeStack(_ sp:CGFloat) {
        if(ErrorString != nil && hostStack != nil) {
            hostStack.spacing = sp
            hostStack.setNeedsDisplay()
        }
    }
    
    
    open override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, paddings)
    }
    
    
    open override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, paddings)
    }
    
    
    open override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, paddings)
    }
    
    
    open func removeErrorMessage() {
        ErrorLabel.isHidden = true
    }
    
    
    open func inject(_ label:UILabel) {
        superview?.addSubview(label)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //        theFont = self.font
        //        theFontSize = self.font?.pointSize
        self.font = nil
        self.font = UIFont(name: (theFont?.fontName)!, size: TitleFontSize)
        self.textColor = theFontColor
        
    }
    
    @available(iOS 10.0, *)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        self.font = nil
        self.font = UIFont(name: (theFont?.fontName)!, size: TitleFontSize)
        self.textColor = theFontColor
        
    }
}
