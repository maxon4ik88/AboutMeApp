//
//  UserAboutViewController.swift
//  HW2.4
//
//  Created by Maxon on 29.08.2020.
//  Copyright © 2020 Maxim Shvanov. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation
import AVKit

class UserAboutViewController: UIViewController {
 
    @IBOutlet var metallicaButton: UIButton!
    @IBOutlet var ariaButton: UIButton!
    @IBOutlet var jacksonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonDidTouch(_ sender: UIButton) {
        sender.alpha = 0.5
    }
    
    @IBAction func buttonsOutTouch(_ sender: UIButton) {
        sender.alpha = 1.0
    }
    
    @IBAction func buttonsPressed(_ sender: UIButton) {
        
        switch sender {
        case ariaButton: playVideo(videName: "HeroOfAsphalt", type: "mov", sender: sender)
        case metallicaButton: playVideo(videName: "NothingElseMatters", type: "mov", sender: sender)
        case jacksonButton: playVideo(videName: "BillieJean", type: "MP4", sender: sender)
        default: break
            
        }
        
    }
    
    private func playVideo(videName: String, type: String, sender: UIButton) {
        if let path = Bundle.main.path(forResource: videName, ofType: type) {
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true) {
                video.play()
            }
        }
        sender.alpha = 1.0
    }
}
