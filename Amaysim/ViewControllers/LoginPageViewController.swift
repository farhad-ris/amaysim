//
//  LoginPageViewController.swift
//  Amaysim
//
//  Created by Farhad Rismanchian on 15/1/17.
//  Copyright © 2017 Farhad Rismanchian. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    
    
    @IBOutlet var loginButton:              AMButtonRoundedOutlined!
    @IBOutlet var loginTextField:           AMTextFieldWithIconAndErrorLabel!
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        loginButton.addTarget(self, action: #selector(getter: LoginPageViewController.loginButton), for: .editingDidEnd)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.setNeedsLayout()
        self.view.setNeedsDisplay()
    }
    
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if loginTextField.text == GlobalVariables.LoginCredentioals.MSN {
            self.performSegue(withIdentifier: "toAccountInformationSegue", sender: self)
        } else {
            loginTextField.showError()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
 

}
