//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    
    
    let quiz = [
        Question(text: "Four + Two is equal to Six.", answer: "True"),
        Question(text: "Five - Three is greater than One", answer: "True"),
        Question(text: "Three + Eigth is less than Ten", answer: "False"),
    ]
    
    
    var countTimer = Timer()
    var questionNumber: Int = 0
    var score: Int = 0
    var actualProgress: Float = 0
    var isActive:Bool = true
    
    
    override func viewDidLoad()   {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
               
        updateUI ()
        
    }

    
    
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        if questionNumber < quiz.count  {
            
            if sender.currentTitle ==  quiz[questionNumber].answer {
                score += 1
                sender.backgroundColor = UIColor.green
            }else {
                sender.backgroundColor = UIColor.red
            }
            
            questionNumber += 1
            
            countTimer = Timer.scheduledTimer(timeInterval: 1.0,target:self, selector: #selector(updateUI),userInfo: nil, repeats: true)
            
            
        }
    }
    
    
    
    @objc func updateUI () {
        
        self.countTimer.invalidate()
        self.trueBtn.backgroundColor = UIColor.clear
        self.falseBtn.backgroundColor = UIColor.clear
        
        let progress = Float(1.0) / Float(quiz.count)
        if  questionNumber != 0 {
            actualProgress += progress
        }
        
        progressBar.setProgress(actualProgress, animated: true)
        if questionNumber == quiz.count {
            questionText.text = "You have answered \(score) out of \(quiz.count) questions correctly."
        }else {
            questionText.text = quiz[questionNumber].text
        }
    }
    

}

