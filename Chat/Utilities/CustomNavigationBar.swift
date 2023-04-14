//
//  CustomNavigationBar.swift
//  InstagramClone
//
//  Created by Paulina Wyskiel on 05/04/2023.
//

import SwiftUI

extension View {
    func setupNavigationBarAppearance(titleColor: UIColor, barColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = barColor
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
