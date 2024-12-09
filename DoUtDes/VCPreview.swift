//
//  VCPreview.swift
//  DoUtDes
//
//  Created by Ildar Garifullin on 09.12.2024.
//

import SwiftUI

struct VCPreview<T: UIViewController>: UIViewControllerRepresentable {
    let viewController: T
    
    init(_ viewControllerBuilder: @escaping () -> T) {
        viewController = viewControllerBuilder()
    }
    
    func makeUIViewController(context: Context) -> T {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: T, context: Context) {}
}
