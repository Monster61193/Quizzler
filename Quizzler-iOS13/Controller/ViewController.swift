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
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    
    var quiz = QuizBrain()
     var numberOfQuestions: Int!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         numberOfQuestions = quiz.getNumberOfQuestions()
         updateUI()
     }
     
     @IBAction func answerBtnPressed(_ sender: UIButton) {
         if quiz.getQuestionNumber() < numberOfQuestions {
             let answer = sender.currentTitle!
             
             if quiz.checkUserAnswer(answer) {
                 sender.backgroundColor = .correctAnswer
             } else {
                 sender.backgroundColor = .wrongAnswer
             }
             
             quiz.nextQuestion()
             updateUI()
         } else {
             quiz.resetQuiz()
             updateUI()
         }
     }
     
     @objc func updateUI() {
         resetButtonBackgrounds()
         updateProgressBar()
         
         if quiz.getQuestionNumber() == numberOfQuestions {
             showFinalScore()
         } else {
             configureButtonsForCurrentQuestion()
         }
     }
     
     private func resetButtonBackgrounds() {
         answer1.backgroundColor = .clear
         answer2.backgroundColor = .clear
         answer3.backgroundColor = .clear
     }
     
     private func updateProgressBar() {
         progressBar.setProgress(quiz.getProgress(), animated: true)
     }
     
     private func showFinalScore() {
         questionText.text = "You have answered \(quiz.getScore()) out of \(numberOfQuestions!) questions correctly."
         answer1.setTitle("Try again", for: .normal)
         answer2.isHidden = true
         answer3.isHidden = true
     }
     
     private func configureButtonsForCurrentQuestion() {
         questionText.text = quiz.getQuestionText()
         
         if quiz.getTypeOfQuiz() == .single {
             configureSingleChoiceButtons()
         } else {
             configureMultipleChoiceButtons()
         }
     }
     
     private func configureSingleChoiceButtons() {
         answer1.setTitle("True", for: .normal)
         answer2.setTitle("False", for: .normal)
         answer2.isHidden = false
         answer3.isHidden = true
     }
     
     private func configureMultipleChoiceButtons() {
         if let answers = quiz.getAnswers() {
             answer1.setTitle(answers[0], for: .normal)
             answer2.setTitle(answers[1], for: .normal)
             answer3.setTitle(answers[2], for: .normal)
             answer2.isHidden = false
             answer3.isHidden = false
         }
     }
 }

 extension UIColor {
     static let correctAnswer = UIColor.green
     static let wrongAnswer = UIColor.red
 }
