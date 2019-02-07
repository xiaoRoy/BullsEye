//
//  ViewController.swift
//  BullsEye
//
//  Created by Jerry Li on 2019/2/2.
//  Copyright © 2019 Jerry Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    
    var targetValue = 0
    
    var score = 0
    
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let currentScore = calculateScore()
        score += currentScore
        let title: String
        if currentScore == 100 {
            title = "Perfect!"
        } else if currentScore >= 95 {
            title = "You almost had it!"
        } else if currentScore >= 90 {
            title = "Pretty Good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(currentScore)"
        let alert = UIAlertController(
            title: title, message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func generateRandomTargetValue() -> Int {
        return Int.random(in: 1...100)
    }
    
    func startNewRound() {
        targetValue = generateRandomTargetValue()
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = "\(round)"
    }
    
    func calculateScore() -> Int {
        return 100 - abs(currentValue - targetValue)
    }
}

