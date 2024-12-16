//
//  RegisterViewController.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 13.12.2024.
//

import UIKit
import SwiftUI

protocol RegisterViewControllerProtocol: AnyObject {}

class RegisterViewController: UIViewController, RegisterViewControllerProtocol {
    
    // MARK: - UI ELEMENTS
    
    var horizontalStackView = UIStackView()
    var buttons: [UIButton] = []
    
    /// Текущие constraints для подчеркивания
    var underlineCenterXConstraint: NSLayoutConstraint?
    var underlineWidthConstraint: NSLayoutConstraint?
    
    lazy var underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBlackFour
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBlackFive
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        setButton()
        setViews()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /// Убираю title в backButtonTitle
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
    
    // MARK: - TARGET ACTIONS
    
    // MARK: - METHODS
    
    /// Настраиваю панель навигации
    func setNavigationBar() {
        /// Устанавливаю цвет в navigationBar
        navigationController?.navigationBar.tintColor = .black
        
        /// Устанавливаю шрифт title в navigationBar и изменяю title
        guard let titleFont = UIFont.robotoBold22() else {
            return
        }
        navigationController?.navigationBar.titleTextAttributes = [.font: titleFont]
        title = "Введите телефон или email"
    }
    
    /// Создаю кнопку
    func setButton() {
        for titleButton in TitleButton.allCases {
            let button = UIButton.makeButtonWithLabel(title: titleButton.rawValue)
            
            if titleButton == TitleButton.Telephone {
                underlineCenterXConstraint = underlineView.centerXAnchor.constraint(equalTo: button.centerXAnchor)
                underlineWidthConstraint = underlineView.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 0.9)
            }
            
            /// Вычисляю ширину кнопки как процент от ширины экрана. Задаю как половину экрана
            let screenWidth = UIScreen.main.bounds.width
            let buttonWidth = screenWidth * 0.45
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: buttonWidth),
                button.heightAnchor.constraint(equalToConstant: 28)
            ])
            
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            buttons.append(button)
        }
    }
    
    // MARK: - PRIVATE METHODS
    
    @objc private func buttonTapped(_ sender: UIButton) {
        /// Удаляю старые ограничения
        underlineCenterXConstraint?.isActive = false
        underlineWidthConstraint?.isActive = false
        
        /// Устанавливаю новые ограничения для выбранной кнопки
        underlineCenterXConstraint = underlineView.centerXAnchor.constraint(equalTo: sender.centerXAnchor)
        underlineWidthConstraint = underlineView.widthAnchor.constraint(equalTo: sender.widthAnchor, multiplier: 0.9)
        
        /// Активирую новые ограничения с анимацией
        UIView.animate(withDuration: 0.3) {
            self.underlineCenterXConstraint?.isActive = true
            self.underlineWidthConstraint?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
}

// MARK: - SETUP UI

private extension RegisterViewController {
    private func setViews() {
        /// Изменяю цвет фона экрана
        view.backgroundColor = .specialWhiteFour
        
        horizontalStackView = UIStackView(
            arrangedSubviews: buttons,
            axis: .horizontal,
            spacing: 0
        )
        view.addSubview(horizontalStackView)
        
        view.addSubview(underlineView)
        
        view.addSubview(dividerView)
    }
    
    //MARK: - SET CONSTRAINTS
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            underlineCenterXConstraint!,
            underlineWidthConstraint!,
            underlineView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 8),
            underlineView.heightAnchor.constraint(equalToConstant: 2),
            
            dividerView.centerYAnchor.constraint(equalTo: underlineView.centerYAnchor),
            dividerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
}

// MARK: - VIEWCONTROLLERPREVIEW

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        VCPreview {RegisterViewController()}
    }
}

