//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Adrian Dardon Flores on 25/01/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//
import Foundation

struct QuizBrain {
    
    enum QuizType: String {
        case single = "Single"
        case multiple = "Multiple"
    }
    
    //    let quiz = [
    //        Question(q: "A slug's blood is green.", a: "True"),
    //        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
    //        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
    //        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
    //        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
    //        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
    //        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
    //        Question(q: "Google was originally called 'Backrub'.", a: "True"),
    //        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
    //        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
    //        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
    //        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    //
    //    ]
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    
    
    var questionNumber: Int = 0
    var score: Int = 0
    
    mutating func checkUserAnswer(_ userAnswer: String) -> Bool {
        let currentQuestion = quiz[questionNumber]
        let isCorrect: Bool
        
        switch currentQuestion.answer {
            
        case .single(let correctAnswer):
            isCorrect = (userAnswer == correctAnswer)
            
        case .multiple:
            isCorrect = (userAnswer == currentQuestion.correctAnswer)
        }
        
        if isCorrect {
            score += 1
        }
        
        return isCorrect
    }
    
    
    // Function to get the text of the current question
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // Function to get the current score
    func getScore() -> Int {
        return score
    }
    
    // Function to get the current question number
    func getQuestionNumber() -> Int {
        return questionNumber
    }
    
    // Function to get the quiz progress
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    // Function to get the total number of questions
    func getNumberOfQuestions() -> Int {
        return quiz.count
    }
    
    
    // Function to get the options for multiple-choice questions
    func getAnswers() -> [String]? {
        let currentQuestion = quiz[questionNumber]
        
        switch currentQuestion.answer {
        case .single:
            return nil
        case .multiple(let answers):
            return answers
        }
    }
    
    
    func getTypeOfQuiz() -> QuizType {
        let currentQuestion = quiz[questionNumber]
        
        switch currentQuestion.answer {
        case .single:
            return .single
        case .multiple:
            return .multiple
        }
    }
    
    // Function to move to the next question
    mutating func nextQuestion() {
        self.questionNumber += 1
        
    }
    
    // Function to restart the quiz
    mutating func resetQuiz() {
        self.questionNumber = 0
        self.score = 0
    }
    
}




