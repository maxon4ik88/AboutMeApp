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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped() {
        (nameTextField.text == nil || nameTextField.text == "") ? alertCall(message: "Please, enter your name!") : print("YES")
//        if nameTextField.text == nil || nameTextField.text == "" {
//            alertCall(title: "Error!", message: "Please, enter your login!")
//            return
//        }
        
        if passwordTextField.text == nil || passwordTextField.text == "" {
            alertCall(message: "Please, enter your password!")
            return
        }
        
        if let password = passwd[nameTextField.text!] {
            if password == passwordTextField.text! {
                performSegue(withIdentifier: "welcomeUserSegue", sender: nil)
            } else {
                alertCall(message: "Login or password is incorrect!")
            }
        } else {
            alertCall(message: "Login or password is incorrect!")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let welcomeDestinationVC = segue.destination as? WelcomeUserViewController else { return }
         
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func alertCall(message: String) -> Void {
        alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured")
        }))
        present(alertController, animated: true, completion: nil)
        
        return
    }
}

