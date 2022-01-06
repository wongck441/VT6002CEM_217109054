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
    
    var videoLooperPlayer: AVPlayerLooper?
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            setUpElements()
        setUpVideo()
        }
        
    override func viewWillAppear(_ animated: Bool) {
            
            // Set up video in the background
          //  setUpVideo()
        self.videoPlayer?.play()
        }
    override func viewWillDisappear(_ animated: Bool) {
        
        // Stop video in the background
        StopVideo()
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
           self.videoPlayer = AVQueuePlayer(playerItem: item)
           // Create the layer
           self.videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
           
           self.videoLooperPlayer = AVPlayerLooper(player: self.videoPlayer as! AVQueuePlayer, templateItem: item)
           
           // Adjust the size and frame
           self.videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
           
           self.view.layer.insertSublayer(videoPlayerLayer!, at: 0)
           
           // Add it to the view and play it
           self.videoPlayer?.playImmediately(atRate: 1.0)
       }
    func StopVideo(){
        self.videoPlayer?.pause()
    }
   }
