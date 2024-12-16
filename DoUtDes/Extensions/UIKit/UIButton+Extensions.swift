//
//  UIButton+Extensions.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 16.12.2024.
//

import UIKit

extension UIButton {
    static func makeButtonWithLabel (title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.specialBlackOne, for: .normal)
        button.titleLabel?.font = .robotoMedium16()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
