//
//  ViewController.swift
//  TryNumber
//
//  Created by fred fu on 2021/1/3.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var guessWrongCountLabel: UILabel!
    var answer = Int.random(in: 1...100)
    var guessWrongCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()        // Do any additional setup after loading the view.
    }

    @IBAction func guess(_ sender: Any) {
        let numberText = numberTextField.text!
        let number = Int(numberText)
        if number != nil{
            let guessNumber = number!
            if guessWrongCount == 6 {
                answer = Int.random(in: 1...100)
                guessWrongCount = 0
            }else if guessNumber == answer {
                resultLabel.text = ("準 猜到了")
                answer = Int.random(in: 1...100)
                guessWrongCount = 0
                guessWrongCountLabel.text = String(0)
            } else if guessNumber < answer  {
                resultLabel.text = ("太小了")
                numberTextField.text! = ""
                guessWrongCount += 1
                guessWrongCountLabel.text = String(guessWrongCount)
            } else {
                resultLabel.text = ("太大了")
                numberTextField.text! = ""
                guessWrongCount += 1
                guessWrongCountLabel.text = String(guessWrongCount)
            }
        }
    }
    @IBAction func replay(_ sender: Any) {
        answer = Int.random(in: 1...100)
        guessWrongCount = 0
        guessWrongCountLabel.text = String(0)
    }
}

