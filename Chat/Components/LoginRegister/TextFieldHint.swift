//
//  TextFieldHint.swift
//  InstagramClone
//
//  Created by Paulina Wyskiel on 05/04/2023.
//

import SwiftUI

struct TextFieldHint: View {
    let hint: String
        var body: some View {
            return Text(hint)
                .font(.system(size: 12, weight: .light))
                .foregroundColor(.secondary)
                .frame(height: hint.isEmpty ? 0 : 30)
                .multilineTextAlignment(.leading)
        }
}

struct TextFieldHint_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldHint(hint: "Test")
    }
}
