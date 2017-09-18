//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Stephen Casazza on 9/18/17.
//  Copyright © 2017 Casazza. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var imageToPunch: UIImageView!
    var audioPlayer = AVAudioPlayer()
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkValue = CGFloat(60)
        // shrink our image to punch by 60 pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds = bounds }, completion: nil)
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) { if let sound = NSDataAsset(name: soundName) {
        // check if sound.data is a soundfile
        do {try audioPlayer = AVAudioPlayer(data: sound.data)
            audioPlayer.play()
        }
        catch { //if sound.data is not a valid audio file
            print("Error: data in \(soundName) couldnt be played as a sound") }
    } else {
        //if reading the NSDataAsset didn't work, tell the user/ report error
        print("Error file \(soundName) didn't load") }
    }

    
    //MARK: Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
    animateImage()
        playSound(soundName: "punchSound" , audioPlayer: &audioPlayer)

}
}

