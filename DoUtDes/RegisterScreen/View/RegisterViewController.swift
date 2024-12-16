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
    
    let telephoneButton = UIButton.makeButtonWithLabel(title: TitleButton.Telephone.rawValue)
    let emailButton = UIButton.makeButtonWithLabel(title: TitleButton.Email.rawValue)
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
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

    // MARK: - PRIVATE METHODS
    
}

// MARK: - SETUP UI

private extension RegisterViewController {
    private func setViews() {
        /// Изменяю цвет фона экрана
        view.backgroundColor = .specialWhiteFour
        
        horizontalStackView = UIStackView(
            arrangedSubviews: [telephoneButton, emailButton],
            axis: .horizontal,
            spacing: 0
        )
        view.addSubview(horizontalStackView)
    }
    
    //MARK: - SET CONSTRAINTS
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

// MARK: - VIEWCONTROLLERPREVIEW

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        VCPreview {RegisterViewController()}
    }
}

