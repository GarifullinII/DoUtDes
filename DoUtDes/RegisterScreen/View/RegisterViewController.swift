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
    
    var buttonStackView = UIStackView()
    var buttonWithLabelStackView = UIStackView()
    
    lazy var phoneButton: UIButton = UIButton.makeButtonWithLabel(title: TitleButton.Telephone.rawValue)
    lazy var emailButton: UIButton = UIButton.makeButtonWithLabel(title: TitleButton.Email.rawValue)
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.specialWhiteFour, for: .normal)
        button.titleLabel?.font = .robotoBold22()
        button.backgroundColor = .specialBlackFive
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Номер телефона"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .specialBlackFive
        textField.keyboardType = .phonePad
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Электронный адрес"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .specialBlackFive
        textField.keyboardType = .emailAddress
        textField.isHidden = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
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
    
    var underlineCenterXConstraint: NSLayoutConstraint?
    var underlineWidthConstraint: NSLayoutConstraint?
    
    lazy var policyOfConfidentialityLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажимая «Далее»: вы принимаете Условия использования и Политику конфиденциальности"
        label.textColor = .specialBlackFour
        label.font = .robotoBold16()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialWhiteFour
        
        setupTextFieldDelegate()
        setupNavigationBar()
        setupButtonWithLabelStackView()
        setupButtons()
        setupUnderline()
        setupDivider()
        setupTextFields()
    }
    
    // TextField delegate
    func setupTextFieldDelegate() {
        phoneTextField.delegate = self
        emailTextField.delegate = self
    }
    
    // Панель навигации
    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .specialBlackOne
        
        guard let titleFont = UIFont.robotoBold22() else {
            return
        }
        navigationController?.navigationBar.titleTextAttributes = [.font: titleFont]
        title = "Введите телефон или email"
    }
    
    // MARK: - PRIVATE METHODS
    
    // Кнопки - телефон, email
    private func setupButtons() {
        buttonStackView = UIStackView(
            arrangedSubviews: [
                phoneButton,
                emailButton
            ],
            axis: .horizontal,
            spacing: 100,
            distribution: .fillEqually)
        
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
        ])
        
        phoneButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    // Кнопка "Далее" с политикой конфиденциальности
    private func setupButtonWithLabelStackView() {
        buttonWithLabelStackView = UIStackView(
            arrangedSubviews: [
                nextButton,
                policyOfConfidentialityLabel
            ],
            axis: .vertical,
            spacing: 16,
            distribution: .fillEqually
        )
        
        view.addSubview(buttonWithLabelStackView)
        
        NSLayoutConstraint.activate([
            buttonWithLabelStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonWithLabelStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonWithLabelStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonWithLabelStackView.heightAnchor.constraint(equalToConstant: 102)
        ])
    }
    
    // Подчеркивание под выбранной кнопкой
    private func setupUnderline() {
        view.addSubview(underlineView)
        
        underlineCenterXConstraint = underlineView.centerXAnchor.constraint(equalTo: phoneButton.centerXAnchor)
        underlineWidthConstraint = underlineView.widthAnchor.constraint(equalTo: phoneButton.widthAnchor)
        
        NSLayoutConstraint.activate([
            underlineCenterXConstraint!,
            underlineWidthConstraint!,
            underlineView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 8),
            underlineView.heightAnchor.constraint(equalToConstant: 2),
        ])
        
        updateButtonSelection(selectedButton: phoneButton)
        toggleTextFields(selectedButton: phoneButton)
    }
    
    // Поля ввода на экране
    private func setupTextFields() {
        view.addSubview(phoneTextField)
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            phoneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            phoneTextField.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 24),
            phoneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            phoneTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneTextField.heightAnchor.constraint(equalToConstant: 38),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 38),
        ])
    }
    
    // Divider
    private func setupDivider() {
        view.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.centerYAnchor.constraint(equalTo: underlineView.centerYAnchor),
            dividerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    private func updateButtonSelection(selectedButton: UIButton) {
        phoneButton.setTitleColor(.specialBlackFour, for: .normal)
        emailButton.setTitleColor(.specialBlackFour, for: .normal)
        
        selectedButton.setTitleColor(.specialBlackOne, for: .normal)
    }
    
    private func toggleTextFields(selectedButton: UIButton) {
        phoneTextField.isHidden = selectedButton != phoneButton
        emailTextField.isHidden = selectedButton != emailButton
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        underlineCenterXConstraint?.isActive = false
        underlineWidthConstraint?.isActive = false
        
        underlineCenterXConstraint = underlineView.centerXAnchor.constraint(equalTo: sender.centerXAnchor)
        underlineWidthConstraint = underlineView.widthAnchor.constraint(equalTo: sender.widthAnchor)
        
        updateButtonSelection(selectedButton: sender)
        toggleTextFields(selectedButton: sender)
        
        UIView.animate(withDuration: 0.3) {
            self.underlineCenterXConstraint?.isActive = true
            self.underlineWidthConstraint?.isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func nextButtonTapped() {
        guard let phoneNumber = phoneTextField.text,
              let email = emailTextField.text else { return }
        
        // Сохранение данных в CoreData или FirebaseCore
    }
}

// MARK: - UITEXTFIELDDELEGATE

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let isPhoneNumberEntered = !(phoneTextField.text ?? "").isEmpty
        let isEmailEntered = !(emailTextField.text ?? "").isEmpty
        
        nextButton.isEnabled = isPhoneNumberEntered || isEmailEntered
        nextButton.backgroundColor = nextButton.isEnabled ? .specialBlackOne : .specialWhiteFour
    }
}

// MARK: - VIEWCONTROLLERPREVIEW

//struct ViewControllerPreview: PreviewProvider {
//    static var previews: some View {
//        VCPreview {RegisterViewController()}
//    }
//}

