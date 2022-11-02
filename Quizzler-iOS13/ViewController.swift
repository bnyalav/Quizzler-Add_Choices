//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

    ]
    var questionNumber = 0 //soru numarası
    var toplamsoru = 0 //toplam soru sayısı
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questioncome()
    }

    @IBAction func answerButtonPresed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle //kullanıcı cevabını butona eşitleme
        let actualAnswer = quiz[questionNumber].answer//seçilen soru numarasının answer: karşılığını getir
        toplamsoru = quiz.count //toplam soru quiz içindeki sayıya eşittir
       // progressBar.progress = 0.0 //progressbar sıfırla
        if userAnswer == actualAnswer{
            sender.backgroundColor = UIColor.green//cevap doğruysa arka plan yeşil olsun
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        if questionNumber + 1 < quiz.count {//quizin içindeki eleman sayısının 1 fazlası kadar soru getir
            questionNumber += 1
        }
        else {
            questionNumber = 0 //3. sorudan sonra başa al
        }
        //buton rengi değiştikten sonra yeni sorunun 0.2 saniye geç gelmesini sağlamak için timer ekle ve fonksiyona @objc ekini ekle
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(questioncome), userInfo: nil, repeats: false)
    }
    @objc func questioncome() {
        questionLabel.text = quiz[questionNumber].text//numarayı her arttırdığında textdeki veriyi getir
        falseButton.backgroundColor = UIColor.clear //her yeni soruda buton renklerini eski haline getirme
        trueButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber + 1) / Float(toplamsoru) //son soruyu göstermesi için +1 ekliyoruz
        print(Float(questionNumber) / Float(toplamsoru))
    }
    
    
}

