//
//  WelcomePresenter.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 11.12.2024.
//

import Foundation
import UIKit

protocol WelcomePresenterProtocol: AnyObject {
    func didTapRegister()
    func didTapLogin()
}

class WelcomePresenter: WelcomePresenterProtocol {
    weak var view: WelcomeViewControllerProtocol?
    var interactor: WelcomeInteractorProtocol!
    var router: WelcomeRouterProtocol!
    
    func didTapRegister() {
        router.navigateToRegisterScreen()
    }
    
    func didTapLogin() {
        router.navigateToLoginScreen()
    }
}
