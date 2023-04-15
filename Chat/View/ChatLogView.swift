//
//  ChatLogView.swift
//  Chat
//
//  Created by Paulina Wyskiel on 15/04/2023.
//

import SwiftUI

struct ChatLogView: View {
    
    let chatUser: ChatUser?
    
    init(chatUser: ChatUser?){
        self.chatUser = chatUser
        self.CLViewModel = .init(chatUser: chatUser)
    }
    
    @ObservedObject var CLViewModel: ChatLogViewModel
    
    var body: some View {
        ZStack {
            messagesView
            Text(CLViewModel.errorMessage)
        }
        .navigationTitle(chatUser?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    static let emptyScrollToString = "Empty"
    
    private var messagesView: some View {
        ScrollView {
            ScrollViewReader { scrollViewProxy in
                VStack {
                    ForEach(CLViewModel.chatMessages) { message in
                        MessageView(message: message)
                    }
                    
                    HStack{ Spacer() }
                        .id(ChatLogView.emptyScrollToString)
                }
                .onReceive(CLViewModel.$count) { _ in
                    withAnimation(.easeOut(duration: 0.5)) {
                        scrollViewProxy.scrollTo(ChatLogView.emptyScrollToString, anchor: .bottom)
                    }
                }
            }
        }
        .background(Color(UIColor(.secondary.opacity(0.1))))
        .safeAreaInset(edge: .bottom, content: {
            chatBottomBar
                .background(Color(.systemBackground))
        })
    }
    
    private var chatBottomBar: some View {
            HStack(spacing: 16) {
                Image(systemName: "photo.on.rectangle.angled")
                    .font(.system(size: 28))
                    .foregroundColor(Color(.darkGray))
                ZStack {
                    DescriptionPlaceholder()
                    TextEditor(text: $CLViewModel.chatText)
                        .opacity(CLViewModel.chatText.isEmpty ? 0.5 : 1)
                }
                .frame(height: 40)
                
                Button {
                    CLViewModel.handleSend(text: CLViewModel.chatText)
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.accentColor)
                .cornerRadius(25)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
}

private struct DescriptionPlaceholder: View {
    var body: some View {
        HStack {
            Text("Aa")
                .foregroundColor(Color(.gray))
                .font(.system(size: 20))
                .padding(.leading, 5)
                .padding(.top, -4)
            Spacer()
        }
    }
}

struct ChatLogView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChatLogView(chatUser: .init(data: ["email": "bogdan@gmail.com"]))
        }
    }
}
