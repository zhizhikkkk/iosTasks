//
//  ViewController.swift
//  EggTimer
//
//  Created by Arman Sarvardin on 14.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeCounterLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let button: Button? = Button(with: sender.tag)
        guard let button else { return }
        if let timerTask {
            if !timerTask.isCancelled {
                return
            }
        }
        timerTask = Task {
            
            let stream = startTimer(timeInterval: button.time)
            
            for await remainingTime in stream {
                
                let minutesRemaining = Int(remainingTime) / 60
                let secondsRemaining = Int(remainingTime) % 60
                
                timeCounterLabel.text = "Time remaining: \(minutesRemaining):\(secondsRemaining)"
            }
        }
    }
    
    private var timerTask: Task<Void, Never>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startTimer(timeInterval: TimeInterval) -> AsyncStream<TimeInterval> {
        AsyncStream { continuation in
            let startTime = Date()
            
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                
                let elapsedTime = Date().timeIntervalSince(startTime)
                let remainingTime = timeInterval - elapsedTime
                
                if remainingTime <= 0 {
                    continuation.finish()
                } else {
                    continuation.yield(remainingTime)
                }
            }
            
            continuation.onTermination = {  _ in
                timer.invalidate()
            }
        }
    }
    
    
    enum Button {
        case softBoiled
        case mediumBoiled
        case hardBoiled
        
        init?(with tag: Int) {
            switch tag {
            case 0: self = .softBoiled
            case 1: self = .mediumBoiled
            case 2: self = .hardBoiled
            default: return nil
            }
        }
        
        var time: TimeInterval {
            switch self {
            case .softBoiled:
                return 5 * 60
            case .mediumBoiled:
                return 7 * 60
            case .hardBoiled:
                return 12 * 60
            }
        }
    }
    
}

