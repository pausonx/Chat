//
//  ChatMessageView.swift
//  Chat
//
//  Created by Paulina Wyskiel on 15/04/2023.
//

import SwiftUI

struct ChatMessageView: View {
    @Binding var shouldNavigateToChatLogView: Bool
    
    var body: some View {
        NavigationLink(
            destination: ChatLogView(chatUser: nil),
            isActive: $shouldNavigateToChatLogView,
            label: {
                Text("ChatMessageView")
            }
        )
        .navigationBarHidden(true)
    }
}

struct ChatMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(shouldNavigateToChatLogView: .constant(true))
    }
}
