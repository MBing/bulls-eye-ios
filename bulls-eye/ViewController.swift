//
//  ViewController.swift
//  bulls-eye
//
//  Created by Martin Demiddel on 09.12.17.
//  Copyright © 2017 Martin Demiddel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var sliderValue = 50 // slider starts at 50 so this should reflect that state
    var bullValue = 0
    var gameScore = 0
    var roundNumberValue = 0
    @IBOutlet weak var roundNumber: UILabel!
    @IBOutlet weak var scoreNumber: UILabel!
    @IBOutlet weak var bullNumber: UILabel!
    @IBOutlet weak var sliderViewValue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetGameValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func generateBullNumber() {
        bullValue = Int(arc4random_uniform(100))
        bullNumber.text = String(bullValue)
    }

    func addToTotalScore(score: Int) {
        gameScore += score
        scoreNumber.text = String(gameScore)
    }
    
    func addRound() {
        roundNumberValue += 1
        roundNumber.text = String(roundNumberValue)
    }
    
    func calculateScore() {
        let difference = abs(bullValue - sliderValue)
        var roundScore = 100 - difference
        if difference == 0 {
            roundScore += 100
        }
        
        addToTotalScore(score: roundScore)
    }
    
    func resetSlider() {
        sliderValue = 50
        sliderViewValue.value = Float(sliderValue)
    }
    
    func resetRoundNumber() {
        roundNumberValue = 0
        addRound()
    }
    
    func resetScore() {
        gameScore = 0
        scoreNumber.text = String(gameScore)
    }
    
    func resetGameValues() {
        resetScore()
        resetRoundNumber()
        resetSlider()
        generateBullNumber()
    }
    
    @IBAction func hitMePressed(_ sender: UIButton) {
        let alert : UIAlertController

        if bullValue == sliderValue {
            alert = UIAlertController(title: "Score!!", message: "You have succesfully guessed the number!", preferredStyle: .alert)
        } else {
            alert = UIAlertController(title: "Oh No", message: "The value of the slider is \(sliderValue)", preferredStyle: .alert)
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.calculateScore()
                self.addRound()
                self.resetSlider()
                self.generateBullNumber()
            }))
        
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
//            print("Clicked Cancel")
//        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        sliderValue = Int(sender.value)
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        resetGameValues()
    }
    
}

