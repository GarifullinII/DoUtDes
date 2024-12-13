//
//  WelcomeAssembly.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 13.12.2024.
//

import Foundation
import UIKit

class WelcomeAssembly {
    
    static func buildWelcomeScreen() -> UIViewController {
        let view = WelcomeViewController()
        let presenter = WelcomePresenter()
        let interactor = WelcomeInteractor()
        let router = WelcomeRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
    
    private init() {}
}
