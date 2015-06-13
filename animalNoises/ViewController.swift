//
//  ViewController.swift
//  animalNoises
//
//  Created by Trevor Hall on 6/13/15.
//  Copyright (c) 2015 Trevor Hall. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    @IBOutlet weak var volumeControl: UISlider!
    @IBAction func playAudio(sender: AnyObject) {
        if let player = audioPlayer {
            player.play()
        }
    }
    
    @IBAction func stopAudio(sender: AnyObject) {
        if let player = audioPlayer {
            player.stop()
        }
    }
    
    @IBAction func adjustVolume(sender: AnyObject) {
        if audioPlayer != nil {
            audioPlayer?.volume = volumeControl.value
        }
    }
    
    
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL.fileURLWithPath(
            NSBundle.mainBundle().pathForResource("On_The_Farm",
                ofType: "mp3")!)
        
        var error: NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: url, error: &error)
        
        if let err = error {
            println("audioPlayer error \(err.localizedDescription)")
        } else {
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully
        flag: Bool) {
    }
    
    func audioPlayerDecodeErrorDidOccur(player: AVAudioPlayer!,
        error: NSError!) {
    }
    
    func audioPlayerBeginInterruption(player: AVAudioPlayer!) {
    }
    
    func audioPlayerEndInterruption(player: AVAudioPlayer!) {
    }

    


}

