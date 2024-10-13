//
//  ViewController.swift
//  Xylophone
//
//  Created by Arman Sarvardin on 12.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let sound = Sound(with: sender.tag) {
            do {
                try SoundPlayer.shared.play(sound: sound)
            } catch {
                print("Sound not found with error: \(error)")
            }
        } else {
            print("Wrond button pressed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

