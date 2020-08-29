//
//  AlertController.swift
//  HW2.4
//
//  Created by Maxon on 29.08.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {

// MARK: Allerts

    // MARK: ALERT_CALL: AlertMessage
    private(set) func alertCall(message: String, textField: UITextField?) {
        if let textField = textField {
            alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured")
                textField.becomeFirstResponder()
            }))
            present(alertController, animated: true, completion: nil)
        } else {
            alertController = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured")
            }))
            present(alertController, animated: true, completion: nil)
        }
    }
    
    var alertCall 

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
                    self.alertCall(message: AlertMessages.nonExist.rawValue, textField: nil)
                }
            }))
            present(alertController, animated: true, completion: nil)
        }
    }
}
