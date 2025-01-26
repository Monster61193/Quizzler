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
    
    
    var quiz = QuizBrain()
    
    
    var countTimer = Timer()
    var numberOfQuestions: Int!
    
    
    override func viewDidLoad()   {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        numberOfQuestions = quiz.getNumerOfQuestions()
        
        updateUI ()
        
    }
    
    
    
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        if quiz.getQuestionNumber() < numberOfQuestions {
            
            if quiz.checkUserAnswer(sender.currentTitle!)  {
                quiz.updateScore()
                sender.backgroundColor = UIColor.green
                
            }else {
               sender.backgroundColor = UIColor.red
            }
            
            quiz.updateQuestionNumber()
            countTimer = Timer.scheduledTimer(timeInterval: 0.3 ,target:self, selector: #selector(updateUI),userInfo: nil, repeats: false)
            
            
        }
    }
    
    
    
    @objc func updateUI () {
        
        
        self.trueBtn.backgroundColor = UIColor.clear
        self.falseBtn.backgroundColor = UIColor.clear
        
        let progress = Float(quiz.getQuestionNumber()) / Float(numberOfQuestions)
        
        progressBar.setProgress(progress, animated: true)
        
        if quiz.getQuestionNumber() == numberOfQuestions {
            
            questionText.text = "You have answered \(quiz.getScore()) out of \(numberOfQuestions!) questions correctly."
            
        }else {
            questionText.text = quiz.getQuestionText()
        }
    }
    
    
}

