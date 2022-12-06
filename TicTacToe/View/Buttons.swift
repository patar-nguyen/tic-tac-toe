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
    
    convenience init(color: UIColor, title: String) {
        self.init(frame: .zero)
        set(color: color, title: title)
    }

    private func configure() {
        configuration = .filled()
        configuration?.cornerStyle = .capsule
        translatesAutoresizingMaskIntoConstraints = false

    }

    func set(color: UIColor, title: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = .white
        configuration?.title = title
    }
}

