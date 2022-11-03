//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Bayram nuri Yalav on 2.11.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
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
    var questionNumber = 0 //soru numarası
    var score = 0 //başlangıçta skor sıfıra eşit
    
    mutating func checkAnsver (userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        }
        else {
            return false
        }
    }
    func getScore() -> Int{ //score getirme
        return score
    }
    func getAnswers() -> [String] { //soru seçeneklerini getirme
        return quiz[questionNumber].answer
    }
    func getNumber() -> Int{ //soru numarasını getirme
        return questionNumber
    }
    func getQuestionText() -> String { //soruları getirme
        return quiz[questionNumber].text
    }
    func getProgress() -> Float{//progress barı arttırma
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress
    }
    mutating func nextQuestion() { //yeni soru getirme (mutating metodumuzu değiştirilebilir olarak işaretler)
        if questionNumber + 1 < quiz.count {//quizin içindeki eleman sayısının 1 fazlası kadar soru getir
            questionNumber += 1
        }
        else {
            questionNumber = 0 //12. sorudan sonra başa al
            score = 0
        }
    }
    
}
