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
        setupSlider()
        startNewGame()
    }
    
    @IBAction func showAlert() {
        let difference = calculateDifference()
        var currentScore = (100 - difference)
        let title: String
        if difference == 0 {
            title = "Perfect!"
            currentScore += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                currentScore += 50
            }
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close..."
        }
        score += currentScore
        
        let message = "You scored \(currentScore)"
        let alert = UIAlertController(
            title: title, message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "OK", style: .default, handler: { _ in self.startNewRound()})
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
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
    
    func calculateDifference() -> Int {
        return abs(currentValue - targetValue)
    }
    
    func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    @IBAction func startOver() {
        startNewGame()
        
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
            name:CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    func setupSlider() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRighResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        slider.setMaximumTrackImage(trackRighResizable, for: .normal)
    }
}

