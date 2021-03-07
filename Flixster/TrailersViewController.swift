//
//  TrailersViewController.swift
//  Flixster
//
//  Created by Derya Kilic on 2/28/21.
//

import UIKit

import AVKit
import AVFoundation

class TrailersViewController: UIViewController, AVPlayerViewControllerDelegate {
    
    var movie: [String:Any]!
    
    var player: AVPlayer!
    var playerViewController: AVPlayerViewController!

    /*
     let player = AVPlayer(url: videoURL)
     let vc = AVPlayerViewController()
     vc.player = player

     present(vc, animated: true) {
         vc.player?.play()
     }
     */
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
