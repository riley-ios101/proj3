//
//  TriviaViewController.swift
//  Trivia
//
//  Created by riley dou on 2024/3/6.

import UIKit

class TriviaViewController: UIViewController {
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var firstAnswer: UIButton!
    @IBOutlet weak var secondAnswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    
    var idx : Int = 0;
    
    let questions = [
        "Who created C++?",
        "What does the acronym \"HTTPS\" stand for?",
        "What year did the Berlin Wall fall?"
    ]
    
    let answers = [
        0 : ["Bjarne Stroustrup", "Guido van Rossum", "Dennis Ritchie", "James Gosling"],
        1 : ["Hungry Toucans Taste-test Pineapples Savagely", "Harmonizing Tigers Tickle the Piano Strings", "Hypertext Transfer Protocol Secure", "Hypertxet Transfer Protocol Secure"],
        2 : [1987, 1988, 1989, 1990]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // generate question
        generateTrivia()
        
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func firstAnswer(_ sender: Any) {
        generateTrivia()
    }
    
    func generateTrivia() {
        
        if (idx >= questions.count) {
            idx = 0
        }
        
        question.text = questions[idx]
        generateAnswers(i: idx)
        idx += 1
    }
    
    func generateAnswers(i: Int) {
        if let ans = answers[i]?[0] as? String{
            firstAnswer.setTitle(ans, for: .normal)
        }
        
        if let ans = answers[i]?[1] as? String{
            secondAnswer.setTitle(ans, for: .normal)
        }
        
        if let ans = answers[i]?[2] as? String{
            thirdAnswer.setTitle(ans, for: .normal)
        }
        
        if let ans = answers[i]?[3] as? String{
            fourthAnswer.setTitle(ans, for: .normal)
        }
    }

}
