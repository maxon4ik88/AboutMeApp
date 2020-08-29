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
        metallicaButton.layer.cornerRadius = 15
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
    @IBAction func metallicaButtonDidTouch() {
        metallicaButton.alpha = 0.5
    }
    
    @IBAction func metallicaButtonOutTouch() {
        metallicaButton.alpha = 1.0
    }
    
    @IBAction func metallicaButtonTapped() {
        if let path = Bundle.main.path(forResource: "NothingElseMatters", ofType: "mov") {
            print("OK!")
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true) {
                video.play()
            }
        } else {
            print("NO!")
        }
        metallicaButton.alpha = 1.0
    }
    
    @IBAction func ariaButtonDidTouch() {
        ariaButton.alpha = 0.5
    }
    
    @IBAction func ariaButtonOutTouch() {
        ariaButton.alpha = 1.0
    }
    
    @IBAction func ariaButtonTapped() {
        if let path = Bundle.main.path(forResource: "HeroOfAsphalt", ofType: "mov") {
            print("OK!")
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true) {
                video.play()
            }
        } else {
            print("NO!")
        }
        ariaButton.alpha = 1.0
    }
    
    @IBAction func jacksonButtonDidTouch() {
        jacksonButton.alpha = 0.5
    }
    
    @IBAction func jacksonButtonOutTouch() {
        jacksonButton.alpha = 1.0
    }
    
    @IBAction func jacksonButtonPressed() {
        if let path = Bundle.main.path(forResource: "BillieJean", ofType: "MP4") {
            print("OK!")
            let video = AVPlayer(url: URL(fileURLWithPath: path))
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            
            present(videoPlayer, animated: true) {
                video.play()
            }
        } else {
            print("NO!")
        }
        jacksonButton.alpha = 1.0
    }
}
