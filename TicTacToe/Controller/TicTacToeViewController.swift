//
//  TicTacToeViewController.swift
//  TicTacToe
//
//  Created by Patrick Nguyen on 2022-12-03.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    enum Turn {
        case X
        case O
    }

    var firstTurn = Turn.X
    var currentTurn = Turn.X
    
    var xmark = "X"
    var circle = "O"
    
    var board: [UIButton] = []
    
    let a1 = Buttons(color: .systemPink, title: "")
    let a2 = Buttons(color: .systemPink, title: "")
    let a3 = Buttons(color: .systemPink, title: "")
    
    let b1 = Buttons(color: .systemPink, title: "")
    let b2 = Buttons(color: .systemPink, title: "")
    let b3 = Buttons(color: .systemPink, title: "")
   
    let c1 = Buttons(color: .systemPink, title: "")
    let c2 = Buttons(color: .systemPink, title: "")
    let c3 = Buttons(color: .systemPink, title: "")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        initBoard()
    }
    
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        
        board.append(b1)
        board.append(b2)
        board.append(b3)
        
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    @objc func addToBoard(_ sender: UIButton) {
       addBoard(sender)
        
        if checkForWin(symbol: xmark) {
            resultAlert(title: "X wins")
        }
        
        if checkForWin(symbol: circle) {
            resultAlert(title: "O wins")
        }
        
        if (isBoardFull()) {
            resultAlert(title: "Draw")
        }
    }
    
    func addBoard(_ sender: UIButton) {
        if (sender.title(for: .normal) == "") {
            if (currentTurn == Turn.O) {
                sender.setTitle(circle, for: .normal)
                currentTurn = Turn.X
            } else if (currentTurn == Turn.X) {
                sender.setTitle(xmark, for: .normal)
                currentTurn = Turn.O
            }
        }
    }
    
    func checkForWin(symbol: String) -> Bool {
        //horizontal
        if matchButtonAndSymbol(button: a1, symbol: symbol) && matchButtonAndSymbol(button: a2, symbol: symbol) && matchButtonAndSymbol(button: a3, symbol: symbol) {
            return true
        }
        
        if matchButtonAndSymbol(button: b1, symbol: symbol) && matchButtonAndSymbol(button: b2, symbol: symbol) && matchButtonAndSymbol(button: b3, symbol: symbol) {
            return true
        }
        
        if matchButtonAndSymbol(button: c1, symbol: symbol) && matchButtonAndSymbol(button: c2, symbol: symbol) && matchButtonAndSymbol(button: c3, symbol: symbol) {
            return true
        }
        
        //vertical
        if matchButtonAndSymbol(button: a1, symbol: symbol) && matchButtonAndSymbol(button: b1, symbol: symbol) && matchButtonAndSymbol(button: c1, symbol: symbol) {
            return true
        }
        
        if matchButtonAndSymbol(button: a2, symbol: symbol) && matchButtonAndSymbol(button: b2, symbol: symbol) && matchButtonAndSymbol(button: c2, symbol: symbol) {
            return true
        }
        
        if matchButtonAndSymbol(button: a3, symbol: symbol) && matchButtonAndSymbol(button: b3, symbol: symbol) && matchButtonAndSymbol(button: c3, symbol: symbol) {
            return true
        }
        
        //diagonal
        if matchButtonAndSymbol(button: a1, symbol: symbol) && matchButtonAndSymbol(button: b2, symbol: symbol) && matchButtonAndSymbol(button: c3, symbol: symbol) {
            return true
        }
        
        if matchButtonAndSymbol(button: a3, symbol: symbol) && matchButtonAndSymbol(button: b2, symbol: symbol) && matchButtonAndSymbol(button: c1, symbol: symbol) {
            return true
        }
        
        return false
    }
    
    func matchButtonAndSymbol(button: UIButton, symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { action in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard() {
        for button in board {
            button.setTitle("", for: .normal)
        }
    }
    
    func isBoardFull() -> Bool {
        for button in board {
            if (button.title(for: .normal) == "") {
                return false
            }
        }
        return true
    }
    



    func configureUI() {
        view.addSubviews(a1, a2, a3, b1, b2, b3, c1, c2, c3)
        
        a1.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)
        a2.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)
        a3.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)

        b1.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)
        b2.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)
        b3.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)

        c1.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)
        c2.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)
        c3.addTarget(self, action: #selector(addToBoard), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            a1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            a1.trailingAnchor.constraint(equalTo: a2.leadingAnchor, constant: -10),
            a1.heightAnchor.constraint(equalToConstant: 75),
            a1.widthAnchor.constraint(equalToConstant: 75),
            
            a2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            a2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            a2.heightAnchor.constraint(equalToConstant: 75),
            a2.widthAnchor.constraint(equalToConstant: 75),
            
            a3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            a3.leadingAnchor.constraint(equalTo: a2.trailingAnchor, constant: 10),
            a3.heightAnchor.constraint(equalToConstant: 75),
            a3.widthAnchor.constraint(equalToConstant: 75),
            
            b1.topAnchor.constraint(equalTo: a1.bottomAnchor, constant: 10),
            b1.trailingAnchor.constraint(equalTo: a2.leadingAnchor, constant: -10),
            b1.heightAnchor.constraint(equalToConstant: 75),
            b1.widthAnchor.constraint(equalToConstant: 75),
            
            b2.topAnchor.constraint(equalTo: a2.bottomAnchor, constant: 10),
            b2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            b2.heightAnchor.constraint(equalToConstant: 75),
            b2.widthAnchor.constraint(equalToConstant: 75),
            
            b3.topAnchor.constraint(equalTo: a3.bottomAnchor, constant: 10),
            b3.leadingAnchor.constraint(equalTo: a2.trailingAnchor, constant: 10),
            b3.heightAnchor.constraint(equalToConstant: 75),
            b3.widthAnchor.constraint(equalToConstant: 75),
            
            c1.topAnchor.constraint(equalTo: b1.bottomAnchor, constant: 10),
            c1.trailingAnchor.constraint(equalTo: a2.leadingAnchor, constant: -10),
            c1.heightAnchor.constraint(equalToConstant: 75),
            c1.widthAnchor.constraint(equalToConstant: 75),
            
            c2.topAnchor.constraint(equalTo: b2.bottomAnchor, constant: 10),
            c2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            c2.heightAnchor.constraint(equalToConstant: 75),
            c2.widthAnchor.constraint(equalToConstant: 75),
            
            c3.topAnchor.constraint(equalTo: b3.bottomAnchor, constant: 10),
            c3.leadingAnchor.constraint(equalTo: a2.trailingAnchor, constant: 10),
            c3.heightAnchor.constraint(equalToConstant: 75),
            c3.widthAnchor.constraint(equalToConstant: 75),
            
        ])
    }
}

