//
//  WelcomeViewController.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 09.12.2024.
//

import UIKit
import SwiftUI

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
        button.layer.cornerRadius = 12
        button.setTitle("Создать аккаунт", for: .normal)
        button.titleLabel?.font = UIFont.robotoBold22()
        button.tintColor = .specialWhiteFour
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialWhiteFour
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.robotoBold22()
        button.tintColor = .specialBlue
        button.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var verticalStackView = UIStackView()
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupViews() {
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
    
    @objc
    private func registrationButtonTapped() {
        //        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc
    private func logInButtonTapped() {
        //        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}

//MARK: - SET CONSTRAINTS

extension WelcomeViewController {
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

// MARK: - VIEWCONTROLLERPREVIEW

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        VCPreview {WelcomeViewController()}
    }
}

