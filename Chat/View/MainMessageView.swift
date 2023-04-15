//
//  MainMessageView.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI

struct MainMessageView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var shouldNavigateToChatLogView = false
    @State var chatUser: ChatUser?
    @State var shouldShowNewMessageScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                UserNavBar()
                AllMessages()
                    
            }
            .navigationBarTitle("Chat")
            .navigationBarHidden(true)
            .overlay(NewMessageButton, alignment: .bottom)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .background(colorScheme == .light ? Color.white : Color.black)
        .sheet(isPresented: $shouldShowNewMessageScreen) {
            NewMessageUsers(didSelectNewUser: { user in
                self.chatUser = user
                self.shouldNavigateToChatLogView = true
            })
        }
        .background(
            NavigationLink(
                destination: ChatLogView(chatUser: chatUser),
                isActive: $shouldNavigateToChatLogView
            ) {
                EmptyView()
            }
            .hidden()
        )
    }
    
    private var NewMessageButton: some View {
        Button {
            shouldShowNewMessageScreen.toggle()
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


struct ChatLogView: View {
    
    let chatUser: ChatUser?
    
    var body: some View {
        ScrollView {
            ForEach(0..<10) { num in
                Text("FAKE MESSAGE FOR NOW")
            }
        }.navigationTitle(chatUser?.name ?? "")
            .navigationBarTitleDisplayMode(.inline)
    }
}
struct MainMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessageView()
        
        MainMessageView()
            .preferredColorScheme(.dark)
    }
}
