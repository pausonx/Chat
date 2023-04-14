//
//  NewMessageButton.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI

struct NewMessageButton: View {
    var body: some View {
        Button {
                    
        } label: {
            HStack {
                Spacer()
                Text("New message")
                    .font(.system(size: 16, weight: .bold))
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.vertical)
            .background(Color("AccentColor"))
            .cornerRadius(32)
            .padding(.horizontal)
            .shadow(radius: 15)
        }
    }
}

struct NewMessageButton_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageButton()
    }
}
