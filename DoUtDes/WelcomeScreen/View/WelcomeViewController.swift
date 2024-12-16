//
//  WelcomeViewController.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 09.12.2024.
//

import UIKit

protocol WelcomeViewControllerProtocol: AnyObject {}

class WelcomeViewController: UIViewController, WelcomeViewControllerProtocol {
    
    var presenter: WelcomePresenterProtocol!
    
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
        button.layer.cornerRadius = 12
        button.setTitle("Создать аккаунт", for: .normal)
        button.addTarget(self, action: #selector(registrationButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.robotoBold22()
        button.tintColor = .specialWhiteFour
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialWhiteFour
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        button.titleLabel?.font = UIFont.robotoBold22()
        button.tintColor = .specialBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var verticalStackView = UIStackView()
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setConstraints()
    }
}

// MARK: - TARGET ACTIONS

private extension WelcomeViewController {
    @objc func registrationButtonPressed() {
        presenter.didTapRegister()
    }
    
    @objc func logInButtonPressed() {
        presenter.didTapLogin()
    }
}

// MARK: - SETUP UI

private extension WelcomeViewController {
    private func setViews() {
        view.backgroundColor = .specialWhiteFour
        view.addSubview(appImageView)
        
        verticalStackView = UIStackView(
            arrangedSubviews: [
                registerButton,
                logInButton
            ],
            axis: .vertical,
            spacing: 4)
        view.addSubview(verticalStackView)
    }
    
    //MARK: - SET CONSTRAINTS
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            appImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 112),
            appImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            registerButton.widthAnchor.constraint(equalToConstant: 360),
            registerButton.heightAnchor.constraint(equalToConstant: 46),
            
            logInButton.widthAnchor.constraint(equalToConstant: 360),
            logInButton.heightAnchor.constraint(equalToConstant: 46),
        ])
    }
}

