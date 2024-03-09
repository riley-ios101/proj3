//
//  TriviaViewController.swift
//  Trivia
//
//  Created by riley dou on 2024/3/6.

import UIKit

class TriviaViewController: UIViewController {
    
    private let TriviaView : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    private var isFirstAnswer : Bool
    private var isSecondAnswer : Bool
    private var isThirdAnswer : Bool
    private var isFourthAnswer : Bool
    
    private var idx : Int
    private var counter : Int
    
    struct Guesses {
        static var correct : Int = 0
    }
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var count: UILabel!
    
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    
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
    
    required init?(coder aDecoder: NSCoder) {
        self.idx = 0
        self.counter = 0
        self.isFirstAnswer = false
        self.isSecondAnswer = false
        self.isThirdAnswer = false
        self.isFourthAnswer = false
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            let endView = TriviaView.instantiateViewController(withIdentifier: "EndView") as! EndViewController
            self.present(endView, animated: true, completion: nil)
            return
        }
        
        count.text = "\(counter+1)/3"
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
                ptr %= length
                if let ans = answers[i]?[ptr] {
                    randomOrder.append(ans)
                }
                
                ptr += 1
            }
            
            if let ans = answers[i]?[start] {
                randomOrder.append(ans)
            }
            
            for j in 0..<4 {
                let answer = randomOrder[j]
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
    
    
    @IBAction func didClickFirst(_ sender: Any) {
        if (isFirstAnswer) {
            Guesses.correct += 1
        }
        
        generateTrivia()
    }
    
    
    @IBAction func didClickSecond(_ sender: Any) {
        if (isSecondAnswer) {
            Guesses.correct += 1
        }
        
        generateTrivia()
    }
    
    
    @IBAction func didClickThird(_ sender: Any) {
        if (isThirdAnswer) {
            Guesses.correct += 1
        }
        
        generateTrivia()
    }
    
    @IBAction func didClickFourth(_ sender: Any) {
        if (isFourthAnswer) {
            Guesses.correct += 1
        }
        
        generateTrivia()
    }
}
