//
//  WelcomeUserViewController.swift
//  HW2.4
//
//  Created by Maxon on 28.08.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class WelcomeUserViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logoutButton: UIButton!
    
    var nameFromLogin: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.layer.cornerRadius = 15
        guard let login = nameFromLogin else { return }
        welcomeLabel.text = "Welcome, \(login)!"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
