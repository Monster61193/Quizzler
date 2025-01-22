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
        [ "Four + Two is equal to Six.", "True"],
        ["Five - Three is greater than One", "True"],
        ["Three + Eight is less than Ten", "False"]
    ]
    
    var questionNumber: Int = 0
    var score: Int = 0
    var actualProgress: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI ()
        
        
    }

    
    
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        if questionNumber < quiz.count  {
            
            if sender.currentTitle ==  quiz[questionNumber][1]{
                score += 1
            }
            
            questionNumber += 1
            updateUI()
            
        }
    }
    
    
    
    func updateUI () {
        
        let progress = Float(1.0) / Float(quiz.count)
        if  questionNumber != 0 {
            actualProgress += progress
        }
        
        progressBar.setProgress(actualProgress, animated: true)
        if questionNumber == quiz.count {
            questionText.text = "You have answered \(score) out of \(quiz.count) questions correctly."
        }else {
            questionText.text = quiz[questionNumber][0]
        }
    }
    

}

