//
//  Buttons.swift
//  TicTacToe
//
//  Created by Patrick Nguyen on 2022-12-03.
//

import UIKit

class Buttons: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(color: UIColor) {
        self.init(frame: .zero)
        set(color: color)
    }

    private func configure() {
        configuration = .filled()
        configuration?.cornerStyle = .capsule
        translatesAutoresizingMaskIntoConstraints = false

    }

    func set(color: UIColor) {
        configuration?.baseBackgroundColor = color
    }
}

