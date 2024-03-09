//
//  TriviaViewController.swift
//  Trivia
//
//  Created by riley dou on 2024/3/6.

import UIKit

class TriviaViewController: UIViewController {
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var count: UILabel!
    
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    
    
    var isFirstAnswer : Bool = false
    var isSecondAnswer : Bool = false
    var isThirdAnswer : Bool = false
    var isFourthAnswer : Bool = false
    
    var idx : Int = 0
    var counter : Int = 1
    var correct : Int = 0
    
    let questions = [
        "Who created C++?",
        "What does the acronym \"HTTPS\" stand for?",
        "What year did the Berlin Wall fall?"
    ]
    
    let answers : [Int: [String]] = [
        0 : ["Bjarne Stroustrup", "Guido van Rossum", "Dennis Ritchie", "James Gosling"],
        1 : ["Hypertext Transfer Protocol Secure","Hungry Toucans Taste-test Pineapples Savagely", "Harmonizing Tigers Tickle the Piano Strings", "Hypertxet Transfer Protocol Secure"],
        2 : ["1989", "1987", "1988", "1990"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        idx = 0
        counter = 1
        correct = 0
        // generate question
        generateTrivia()
        
        // Do any additional setup after loading the view.
    }
    
    func generateTrivia() {
        isFirstAnswer = false
        isSecondAnswer = false
        isThirdAnswer = false
        isFourthAnswer = false
        
        if (counter == 3) {
            // change storyboard
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "EndView") as! EndViewController
            self.navigationController?.pushViewController(storyboard, animated: true)
            return
        }
        
        count.text = "\(counter)/3"
        question.text = questions[idx]
        generateAnswers(i: idx)
        idx += 1
        counter += 1
    }
    
    func setCorrectAnswer(i: Int, order: Int, given: String) {
        let correctAnswer = answers[i]?[0]
        
        if (correctAnswer != given) { return }
        
        if (order == 0) {
            isFirstAnswer = true
            print(0)
        } else if (order == 1) {
            isSecondAnswer = true
            print(1)
        } else if (order == 2) {
            isThirdAnswer = true
            print(2)
        } else {
            isFourthAnswer = true
            print(3)
        }
    }
    
    func generateAnswers(i: Int) {
        
        if let length = answers[i]?.count {
            let start = Int(arc4random_uniform(UInt32(length)))
            
            var randomOrder : [String] = []
            var ptr : Int = start+1
            
            while (ptr != start) {
                if (ptr >= length) {
                    ptr = 0
                }
                
                if let ans = answers[i]?[ptr] {
                    randomOrder.append(ans)
                }
                
                ptr += 1
            }
            
            if let ans = answers[i]?[start] {
                randomOrder.append(ans)
            }
            
            for j in 0..<4 {
                if let answer = answers[i]?[j] {
                    switch j {
                    case 0:
                        firstAnswer.setTitle(answer, for: .normal)
                    case 1:
                        secondAnswer.setTitle(answer, for: .normal)
                    case 2:
                        thirdAnswer.setTitle(answer, for: .normal)
                    case 3:
                        fourthAnswer.setTitle(answer, for: .normal)
                    default:
                        break
                    }
                    setCorrectAnswer(i: i, order: j, given: answer)
                }
            }
        }
    }
    
    
    @IBAction func didClickFirst(_ sender: Any) {
        if (isFirstAnswer) {
            correct += 1
        }
        
        print("clicked")
        generateTrivia()
    }
    
    
    @IBAction func didClickSecond(_ sender: Any) {
        if (isSecondAnswer) {
            correct += 1
        }
        
        print("clicked")
        generateTrivia()
    }
    
    
    @IBAction func didClickThird(_ sender: Any) {
        if (isThirdAnswer) {
            correct += 1
        }
        
        print("clicked")
        generateTrivia()
    }
    
    @IBAction func didClickFourth(_ sender: Any) {
        if (isFourthAnswer) {
            correct += 1
        }
        
        print("clicked")
        generateTrivia()
    }
}
