//
//  ColorTheme.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import Foundation
import UIKit

func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)

    if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
        if self.traitCollection.userInterfaceStyle == .dark {
            self.view.backgroundColor = UIColor(.secondary)
        } else {
            self.view.backgroundColor = UIColor(.secondary.opacity(0.1))
        }
    }
}
