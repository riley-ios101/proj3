//
//  EndViewController.swift
//  Trivia
//
//  Created by riley dou on 2024/3/8.
//

import UIKit

class EndViewController: UIViewController {
    
    private var correctGuesses : Int
    
    @IBOutlet weak var correctGuessesLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        self.correctGuesses = TriviaViewController.Guesses.correct
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        correctGuessesLabel.text = "You got \(correctGuesses) right!"
    }
}
