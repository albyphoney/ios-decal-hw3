//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet var hangmanPicture: UIImageView!
    @IBOutlet var newGame: UIButton!
    @IBOutlet var guess: UIButton!
    @IBOutlet var guessUser: UITextField!
    @IBOutlet var previousGuesses: UILabel!
    @IBOutlet var knownString: UILabel!
    var hangman: Hangman!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guess.addTarget(self, action: "guess:", forControlEvents: UIControlEvents.TouchUpInside)
        newGame.addTarget(self, action: "newGame:", forControlEvents: UIControlEvents.TouchUpInside)
        hangman = Hangman()
        initializeGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeGame() {
        hangman.start()
        self.knownString.text = hangman.knownString
        self.previousGuesses.text = ""
    }
    
    func newGame(sender:UIButton) {
        hangman.start()
        self.knownString.text = hangman.knownString
        self.previousGuesses.text = ""
        self.knownString.text = ""
    }
    
    func guess(sender:UIButton) -> Bool{
        let possible = hangman.guessLetter(guessUser.text!)
        if (!possible) {
            var retval = ""
            let guessedLetters = hangman.guessedLetters
            for guess in guessedLetters! {
                retval += guess as! String
            }
            return false
        }
        else {
            if hangman.knownString == hangman.answer {
                self.previousGuesses.text = hangman.knownString
                return true
            }
            var retval = ""
            let guessedLetters = hangman.guessedLetters
            for guess in guessedLetters! {
                retval += guess as! String
            }
            self.previousGuesses.text = retval
            self.knownString.text = hangman.knownString
            return true
        }
    }
    
    
    
}

