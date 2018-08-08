//
//  LoginViewController.swift
//  CarGuard
//
//  Created by Kamil Kwiatkowski on 25/07/2018.
//  Copyright © 2018 Dignital. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    @IBOutlet weak var usernameTextField: AuthTextField!
    @IBOutlet weak var passwordTextField: AuthTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if verifyLoginAndPassword() {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    
    func verifyLoginAndPassword() -> Bool {
        guard let _ = self.usernameTextField.text, self.usernameTextField.text?.isEmpty == false else {
            return false
        }
        guard let _ = self.passwordTextField.text, self.passwordTextField.text?.isEmpty == false else {
            return false
        }
        return true
    }
}
