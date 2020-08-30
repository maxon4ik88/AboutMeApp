//
//  SecondUserAboutViewController.swift
//  HW2.4
//
//  Created by Maxon on 30.08.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit

class SecondUserAboutViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.layer.cornerRadius = 30
        
    }

}
