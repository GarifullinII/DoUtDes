//
//  WelcomeRouter.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 11.12.2024.
//

import Foundation

protocol WelcomeRouterProtocol: AnyObject {
    func navigateToRegisterScreen()
    func navigateToLoginScreen()
}

class WelcomeRouter: WelcomeRouterProtocol {
    weak var presenter: WelcomePresenter!
    weak var view: WelcomeViewController!
    
    func navigateToRegisterScreen() {
        view?.show(RegisterViewController(), sender: nil)
    }
    
    func navigateToLoginScreen() {
        view?.show(LoginViewController(), sender: nil)
    }
}
