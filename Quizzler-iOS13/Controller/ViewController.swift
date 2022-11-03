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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questioncome()//soru getir fonksiyonu
    }

    @IBAction func answerButtonPresed(_ sender: UIButton) { //3 seçeneğide butona bağla
        
        let userAnswer = sender.currentTitle //kullanıcı cevabını butona eşitleme
        let userGotItRight = quizBrain.checkAnsver(userAnswer: userAnswer!)
       
        if userGotItRight{
            sender.backgroundColor = UIColor.green//cevap doğruysa arka plan yeşil olsun
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        //buton rengi değiştikten sonra yeni sorunun 0.2 saniye geç gelmesini sağlamak için timer ekle ve fonksiyona @objc ekini ekle
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(questioncome), userInfo: nil, repeats: false)
    }
    @objc func questioncome() {
        questionLabel.text = quizBrain.getQuestionText() //numarayı her arttırdığında textdeki veriyi getir
        
        let answerChoices = quizBrain.getAnswers() //diğer seçenekleri getir
        choice1.setTitle(answerChoices[0], for: .normal) //seçenekleri butonlara ata
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress() //progress barı arttır
        scoreLabel.text = "Score: \(quizBrain.getScore())" //kaç doğrum var
        questionNumber.text = "Soru Numarası: \(quizBrain.getNumber())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
    
}

