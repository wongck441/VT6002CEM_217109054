//
//  ViewController.swift
//  VT6002CEM_217109054
//
//  Created by User on 31/12/2021.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
        
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            setUpElements()
        }
        
    override func viewWillAppear(_ animated: Bool) {
            
            // Set up video in the background
            setUpVideo()
        }
    func setUpElements() {
           
           Utilities.styleFilledButton(SignUpButton)
           Utilities.styleHollowButton(LoginButton)
           
       }
       
       func setUpVideo() {
           
           // Get the path to the resource in the bundle
           let bundlePath = Bundle.main.path(forResource: "video", ofType: "mp4")
           
           guard bundlePath != nil else {
               return
           }
           
           // Create a URL from it
           let url = URL(fileURLWithPath: bundlePath!)
           
           // Create the video player item
           let item = AVPlayerItem(url: url)
           
           // Create the player
           videoPlayer = AVPlayer(playerItem: item)
           
           // Create the layer
           videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
           
           // Adjust the size and frame
           videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
           
           view.layer.insertSublayer(videoPlayerLayer!, at: 0)
           
           // Add it to the view and play it
           videoPlayer?.playImmediately(atRate: 1.0)
       }


   }
