//
//  MessageView.swift
//  Chat
//
//  Created by Paulina Wyskiel on 15/04/2023.
//

import SwiftUI

struct MessageView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let message: ChatMessage
    
    var body: some View {
        VStack{
            if message.fromId == FirebaseManager.shared.auth.currentUser?.uid {
                HStack {
                    Spacer()
                    HStack {
                        Text(message.text)
                            .foregroundColor(.white)
                    }
                    .padding(10)
                    .background(Color("AccentColor"))
                    .cornerRadius(25)
                }
            } else {
                HStack {
                    HStack {
                        Text(message.text)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                    .padding(10)
                    .background(Color(UIColor(.secondary.opacity(0.2))))
                    .cornerRadius(25)
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
    }
}
