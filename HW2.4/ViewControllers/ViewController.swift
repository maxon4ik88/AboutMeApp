//
//  ViewController.swift
//  HW2.4
//
//  Created by Maxon on 28.08.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var forgotNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var alertController: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: ButtonActions
    
    // MARK: ForgotPasswordButton
    @IBAction func forgotPasswordTapped() {
        switch nameTextField.text! {
        case "":
            helpPasswordCall(login: "")
            print("Please, enter your name")
        case _ where users[nameTextField.text!] != nil: helpPasswordCall(login: nameTextField.text!)
        default: alertCall(message: AlertMessages.nonExist.rawValue)
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
            alertCall(message: AlertMessages.enterName.rawValue)
            return
        }
        
        if passwordTextField.text == nil || passwordTextField.text == "" {
            alertCall(message: AlertMessages.enterPassword.rawValue)
            return
        }
        
        if let user = users[nameTextField.text!] {
            if user.password == passwordTextField.text! {
                performSegue(withIdentifier: "welcomeUserSegue", sender: nil)
            } else {
                alertCall(message: AlertMessages.badLogin.rawValue)
            }
        } else {
            alertCall(message: AlertMessages.badLogin.rawValue)
        }
    }
    
    // MARK: SystemFunctions
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        guard let welcomeDestinationVC = segue.destination as? WelcomeUserViewController else { return }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Allerts
    
    // MARK: ALERT_CALL: AlertMessage
    private func alertCall(message: String) {
        alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured")
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: ALERT_CALL: HelpName
    private func helpNameCall(login: String) {
        alertController = UIAlertController(title: "Try this login:", message: login, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            NSLog("The \"HELP_NAME!\" alert occured")
        }))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: ALERT_CALL: HelpPassword
    private func helpPasswordCall(login: String) {
        if login != "" {
            alertController = UIAlertController(title: "Your password is:", message: users[login]?.password, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                NSLog("The \"HELP_PASSWORD!\" alert occured")
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
                        NSLog("The \"HELP_PASSWORD!\" alert occured")
                    }))
                    self.present(self.alertController, animated: true, completion: nil)
                } else {
                    self.alertCall(message: AlertMessages.nonExist.rawValue)
                }
            }))
            present(alertController, animated: true, completion: nil)
        }
    }
}

