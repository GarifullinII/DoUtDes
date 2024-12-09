//
//  WelcomeViewController.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 09.12.2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - UI ELEMENTS
    
    lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialBlackOne
        button.setTitle("Создать аккаунт", for: .normal)
        button.titleLabel?.font = UIFont.robotoBold22()
        button.tintColor = .specialWhiteFour
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialWhiteOne
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.robotoBold22()
        button.tintColor = .specialBlue
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .specialWhiteOne
    }
    
    // MARK: - PRIVATE METHODS
    
    @objc
    private func registrationButtonTapped() {
//        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc
    private func logInButtonTapped() {
//        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}

