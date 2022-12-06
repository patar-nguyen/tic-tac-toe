//
//  UIView + Ext.swift
//  TicTacToe
//
//  Created by Patrick Nguyen on 2022-12-05.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

