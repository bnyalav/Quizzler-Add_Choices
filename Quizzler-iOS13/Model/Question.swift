//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Bayram nuri Yalav on 2.11.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let rightAnswer: String
    init(q: String, a: [String], correctAnswer: String) {//text ve answerı daha az metinlere eşitledik
        text = q
        answer = a
        rightAnswer = correctAnswer
    }
}
