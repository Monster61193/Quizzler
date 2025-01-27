//
//  Untitled.swift
//  Quizzler-iOS13
//
//  Created by Adrian Dardon Flores on 24/01/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Answer
    let correctAnswer: String?
    
    
    init(q: String, a: String, correctAnswer: String? = nil) {
        self.text = q
        self.answer = .single(a)
        self.correctAnswer = correctAnswer
    }
    
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = .multiple(a)
        self.correctAnswer = correctAnswer
    }
}


enum Answer {
    case single(String)
    case multiple([String])
}
