//
//  ChatMessageView.swift
//  Chat
//
//  Created by Paulina Wyskiel on 15/04/2023.
//

import SwiftUI

struct ChatMessageView: View {
    @Binding var shouldNavigateToChatLogView: Bool
    @State var chatUser: ChatUser?
    
    var body: some View {
        NavigationLink(
            destination: ChatLogView(CLViewModel: ChatLogViewModel(chatUser: chatUser)),
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
