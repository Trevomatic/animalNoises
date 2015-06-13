//
//  JungleAnimalsViewController.swift
//  animalNoises
//
//  Created by Trevor Hall on 6/13/15.
//  Copyright (c) 2015 Trevor Hall. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation


class JungleAnimalsViewController: UIViewController, AVAudioPlayerDelegate {
    
    var currentAnimal = 0
    let animalFileNames = ["Monkey", "Lion", "Elephant", "Gorilla"]
    var correct = false
    var audioPlayer:AVAudioPlayer!
    
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var volumeControl: UISlider!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButtonPressed(sender: AnyObject) {
        messageLabel.hidden = true
        nextButton.hidden = true
        playButton.hidden = false
        if currentAnimal < animalFileNames.count - 1{
            currentAnimal += 1
        }
        initializeAudioPlayer()
    }
    
    @IBAction func jungleAnimalPressed(sender: AnyObject) {
        
        if sender.tag == self.currentAnimal{
            messageLabel.text = "Great Job! \(animalFileNames[currentAnimal]) is correct!"
            messageLabel.textColor = UIColor.greenColor()
            playButton.hidden = true
            if currentAnimal < animalFileNames.count{
                if currentAnimal == animalFileNames.count-1{
                    nextButton.hidden = true
                    println("last animal")
                } else {
                    nextButton.hidden = false
                }
                messageLabel.hidden  = false
            }

        } else {
            messageLabel.text = "Try Again!"
            messageLabel.textColor = UIColor.blackColor()
            messageLabel.hidden = false
        }
        println(currentAnimal)
    }
    
    @IBAction func playAudio(sender: AnyObject) {
        messageLabel.hidden = true
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
    
    func initializeAudioPlayer() {
        let url = NSURL.fileURLWithPath(
            NSBundle.mainBundle().pathForResource(animalFileNames[currentAnimal],
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeAudioPlayer()
        nextButton.hidden = true
        messageLabel.hidden = true
        volumeControl.value = 1

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
