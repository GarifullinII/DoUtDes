//
//  WelcomeInteractor.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 11.12.2024.
//

import Foundation

protocol WelcomeInteractorProtocol {
}

class WelcomeInteractor: WelcomeInteractorProtocol {
    weak var presenter: WelcomePresenter!
}
