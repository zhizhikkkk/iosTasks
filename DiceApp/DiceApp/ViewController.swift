//
//  ViewController.swift
//  DiceApp
//
//  Created by Arman Sarvardin on 12.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let dices: [Int] = [1, 2, 3, 4, 5, 6]
    
    var firstDice: Int?
    var secondDice: Int?
    
    // MARK: - Subviews
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBAction func didPressButton(_ sender: Any) {
        shuffleDices()
    }
    
    
    //MARK: - UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func motionEnded(
        _ motion: UIEvent.EventSubtype,
        with event: UIEvent?
    ) {
        if motion == .motionShake {
            shuffleDices()
        }
    }
    
    /// This method shuffles two dices. It is implemented via selecting random element in the array. Array contains integers from 1 to 6
    private func shuffleDices() {
        
        firstDice = nil
        secondDice = nil
        
        firstDice = dices.randomElement()
        secondDice = dices.randomElement()
        
        Task {
            
            await MainActor.run {
                firstImage.image = UIImage(named: "dice\(firstDice!)")
                secondImage.image = UIImage(named: "dice\(secondDice!)")
            }
        }
    }

}

