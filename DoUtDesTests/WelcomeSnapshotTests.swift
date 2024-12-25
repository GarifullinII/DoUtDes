//
//  WelcomeSnapshotTests.swift
//  DoUtDesTests
//
//  Created by Ildar Garifullin on 25.12.2024.
//

import XCTest
import SnapshotTesting
import FirebaseCore

@testable import DoUtDes

final class WelcomeSnapshotTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    func testExample() throws {
        let welcomeViewController = WelcomeViewController()
        
        assertSnapshots(of: welcomeViewController, as: [.image])
    }
    
    func test_Welcome_On_Iphone_SE() throws {
        let welcomeViewController = WelcomeViewController()
        
        assertSnapshots(of: welcomeViewController, as: [.image(traits: .iPhoneSe(.portrait))])
    }
}
