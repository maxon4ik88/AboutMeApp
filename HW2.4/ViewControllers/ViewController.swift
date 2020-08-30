//
//  ViewController.swift
//  HW2.4
//
//  Created by Maxon on 28.08.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var forgotNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let welcomeDestinationVC = tabBarController.viewControllers?.first as? WelcomeUserViewController else { return }
        welcomeDestinationVC.nameFromLogin = users[nameTextField.text!]?.name

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    // MARK: ButtonActions
    
    // MARK: ForgotPasswordButton
    @IBAction func forgotPasswordTapped() {
        switch nameTextField.text! {
        case "":
            helpPasswordCall(login: "")
        case _ where users[nameTextField.text!] != nil: helpPasswordCall(login: nameTextField.text!)
        default: alertCall(message: AlertMessages.nonExist.rawValue, textField: nil)
        }
    }
    
    // MARK: ForgotNameButton
    @IBAction func forgotNameTapped() {
        if let randomUser = users.randomElement()?.key {
            helpNameCall(login: randomUser)
        }
    }
    
    // MARK: LoginButton
    @IBAction func loginButtonTapped() {
        if nameTextField.text == nil || nameTextField.text == "" {
            alertCall(message: AlertMessages.enterName.rawValue, textField: nameTextField)
            return
        }
        
        if passwordTextField.text == nil || passwordTextField.text == "" {
            alertCall(message: AlertMessages.enterPassword.rawValue, textField: passwordTextField)
            return
        }
        
        if let user = users[nameTextField.text!] {
            if user.password == passwordTextField.text! {
                performSegue(withIdentifier: "welcomeUserSegue", sender: nil)
            } else {
                alertCall(message: AlertMessages.badLogin.rawValue, textField: nil)
            }
        } else {
            alertCall(message: AlertMessages.badLogin.rawValue, textField: nil)
        }

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            passwordTextField.becomeFirstResponder()
            return true
        case passwordTextField:
            loginButtonTapped()
            return true
        default:
            return false
        }
    }
    
    // MARK: Allerts
    
    // MARK: ALERT_CALL: AlertMessage
    private func alertCall(message: String, textField: UITextField?) {
        if let textField = textField {
            alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                textField.becomeFirstResponder()
            }))
            present(alertController, animated: true, completion: nil)
        } else {
            alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            }))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: ALERT_CALL: HelpName
    private func helpNameCall(login: String) {
        alertController = UIAlertController(title: "Try this login:", message: login, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: ALERT_CALL: HelpPassword
    private func helpPasswordCall(login: String) {
        if login != "" {
            alertController = UIAlertController(title: "Your password is:", message: users[login]?.password, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            }))
            present(alertController, animated: true, completion: nil)
        } else {
            alertController = UIAlertController(title: "Enter your name", message: nil, preferredStyle: .alert)
            alertController.addTextField { (textField) in
                
            }
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                let text = self.alertController.textFields?.first
                self.nameTextField.text = text?.text
                if users[(text?.text)!] != nil {
                    self.alertController = UIAlertController(title: "Your password is:", message: users[(text!.text)!]?.password, preferredStyle: .alert)
                    self.alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    }))
                    self.present(self.alertController, animated: true, completion: nil)
                } else {
                    self.alertCall(message: AlertMessages.nonExist.rawValue, textField: nil)
                }
            }))
            present(alertController, animated: true, completion: nil)
        }
    }
    
}
