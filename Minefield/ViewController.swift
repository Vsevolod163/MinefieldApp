//
//  ViewController.swift
//  Minefield
//
//  Created by Vsevolod Lashin on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultOfGameLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var firstSqureButton: UIButton!
    @IBOutlet var secondSquareButton: UIButton!
    @IBOutlet var thirdSquareButton: UIButton!
    @IBOutlet var fourthSquareButton: UIButton!
    @IBOutlet var fifthSquareButton: UIButton!
    @IBOutlet var sixthSquareButton: UIButton!
    @IBOutlet var seventhSquareButton: UIButton!
    @IBOutlet var eighthSquareButton: UIButton!
    @IBOutlet var ninthSquareButton: UIButton!
    @IBOutlet var tenthSquareButton: UIButton!
    @IBOutlet var eleventhSquareButton: UIButton!
    @IBOutlet var twelfthSquareButton: UIButton!
    @IBOutlet var thirteenthSquareButton: UIButton!
    @IBOutlet var fourteenthSquareButton: UIButton!
    @IBOutlet var fifteenthSquareButton: UIButton!
    @IBOutlet var sixteenthSquareButton: UIButton!
    @IBOutlet var seventeenthSquareButton: UIButton!
    @IBOutlet var eighteenthSquareButton: UIButton!
    @IBOutlet var nineteenthSquareButton: UIButton!
    @IBOutlet var twentiethSquareButton: UIButton!
    @IBOutlet var twentyFirstSquareButton: UIButton!
    @IBOutlet var twentySecondSquareButton: UIButton!
    @IBOutlet var twentyThirdSquareButton: UIButton!
    @IBOutlet var twentyFourthSquareButton: UIButton!
    @IBOutlet var twentyFifthSquareButton: UIButton!
    @IBOutlet var newGameButton: UIButton!
    
    private var resultScore = 0
    private var isGameOver = false
    private var squares: [UIButton] = []
    private let scoreForWin = 8

    override func viewDidLoad() {
        super.viewDidLoad()
        
        squares = [
            firstSqureButton,
            secondSquareButton,
            thirdSquareButton,
            fourthSquareButton,
            fifthSquareButton,
            sixthSquareButton,
            seventhSquareButton,
            eighthSquareButton,
            ninthSquareButton,
            tenthSquareButton,
            eleventhSquareButton,
            twelfthSquareButton,
            thirteenthSquareButton,
            fourteenthSquareButton,
            fifteenthSquareButton,
            sixteenthSquareButton,
            seventeenthSquareButton,
            eighteenthSquareButton,
            nineteenthSquareButton,
            twentiethSquareButton,
            twentyFirstSquareButton,
            twentySecondSquareButton,
            twentyThirdSquareButton,
            twentyFourthSquareButton,
            twentyFifthSquareButton
        ]
        
        setTitlesIn(buttons: squares)
        setMinesIn(buttons: squares)
        
        newGameButton.layer.cornerRadius = 10
        resultOfGameLabel.text = "Score \(scoreForWin) points to win!"
        scoreLabel.text = "Score: 0"
    }
    
    @IBAction func tapSquareButton(_ sender: UIButton) {
        guard !isGameOver else { return }
        guard sender.alpha != 0 else { return }
        
        if sender.currentTitle == "💥" {
            isGameOver = true
            resultOfGameLabel.text = "Game over!"
            showSquaresWithMinesIn(buttons: squares)
        } else {
            sender.alpha = 0
            resultScore += 1
            scoreLabel.text = "Score: \(resultScore)"
            squares.removeAll { $0 == sender }
        }
        
        if resultScore == 8 {
            isGameOver = true
            resultOfGameLabel.text = "You won!"
            showSquaresWithMinesIn(buttons: squares)
        }
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        resultScore = 0
        isGameOver = false
        scoreLabel.text = "Score: 0"
        resultOfGameLabel.text = ""
        resultOfGameLabel.text = "Score \(scoreForWin) points to win!"
        squares = [
            firstSqureButton,
            secondSquareButton,
            thirdSquareButton,
            fourthSquareButton,
            fifthSquareButton,
            sixthSquareButton,
            seventhSquareButton,
            eighthSquareButton,
            ninthSquareButton,
            tenthSquareButton,
            eleventhSquareButton,
            twelfthSquareButton,
            thirteenthSquareButton,
            fourteenthSquareButton,
            fifteenthSquareButton,
            sixteenthSquareButton,
            seventeenthSquareButton,
            eighteenthSquareButton,
            nineteenthSquareButton,
            twentiethSquareButton,
            twentyFirstSquareButton,
            twentySecondSquareButton,
            twentyThirdSquareButton,
            twentyFourthSquareButton,
            twentyFifthSquareButton
        ]
        
        setTitlesIn(buttons: squares)
        setMinesIn(buttons: squares)
    }

    private func setTitlesIn(buttons: [UIButton]) {
        for button in buttons {
            button.setTitle("", for: .normal)
            button.layer.cornerRadius = 10
            button.alpha = 1
        }
    }
    
    private func setMinesIn(buttons: [UIButton]) {
        for _ in 1...5 {
            let randomElement = buttons.randomElement()
            randomElement?.titleLabel?.alpha = 0
            randomElement?.setTitle("💥", for: .normal)
        }
    }
    
    private func showSquaresWithMinesIn(buttons: [UIButton]) {
        for button in buttons {
            button.titleLabel?.alpha = 1
        }
    }
}

