//
//  ViewController.swift
//  Minefield
//
//  Created by Vsevolod Lashin on 22.03.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var resultOfGameLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var squareButtons: [UIButton]!
    @IBOutlet var newGameButton: UIButton!
    
    private var resultScore = 0
    private var isGameOver = false
    private var squares: [UIButton] = []
    private let scoreForWin = 8

    override func viewDidLoad() {
        super.viewDidLoad()
        setCornerRadiusIn(buttons: squareButtons)
        setMinesIn(buttons: squareButtons)
        
        newGameButton.layer.cornerRadius = 10
        resultOfGameLabel.text = "Score \(scoreForWin) points to win!"
        scoreLabel.text = "0"
    }
    
    @IBAction func tapSquareButton(_ sender: UIButton) {
        guard !isGameOver else { return }
        guard sender.alpha != 0 else { return }
        
        if sender.currentTitle == "💥" {
            isGameOver = true
            resultOfGameLabel.text = "Game over!"
            showSquaresWithMinesIn(buttons: squareButtons)
        } else {
            sender.alpha = 0
            resultScore += 1
            scoreLabel.text = "\(resultScore)"
            squares.removeAll { $0 == sender }
        }
        
        if resultScore == 8 {
            isGameOver = true
            resultOfGameLabel.text = "You won!"
            showSquaresWithMinesIn(buttons: squareButtons)
        }
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        resultScore = 0
        isGameOver = false
        scoreLabel.text = "0"
        resultOfGameLabel.text = ""
        resultOfGameLabel.text = "Score \(scoreForWin) points to win!"
        
        setTitlesIn(buttons: squareButtons)
        setAlphaIn(buttons: squareButtons)
        setMinesIn(buttons: squareButtons)
    }

    private func setCornerRadiusIn(buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = 10
        }
    }
    
    private func setTitlesIn(buttons: [UIButton]) {
        for button in buttons {
            if button.currentTitle == "💥" {
                button.setTitle("", for: .normal)
            }
        }
    }
    
    private func setAlphaIn(buttons: [UIButton]) {
        for button in buttons {
            if button.alpha == 0 {
                button.alpha = 1
            }
        }
    }
    
    private func setMinesIn(buttons: [UIButton]) {
        var buttons: [UIButton] = buttons
        
        for _ in 1...5 {
            let randomElement = buttons.randomElement()
            buttons.removeAll { $0 == randomElement }
            randomElement?.titleLabel?.alpha = 0
            randomElement?.setTitle("💥", for: .normal)
        }
    }
    
    private func showSquaresWithMinesIn(buttons: [UIButton]) {
        for button in buttons {
            if button.titleLabel?.alpha == 0 {
                button.titleLabel?.alpha = 1
            }
        }
    }
}

