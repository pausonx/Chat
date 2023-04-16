//
//  AllMessages.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct AllMessages: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject private var MMViewModel = MainMessagesViewModel()
    @State var chatUser: ChatUser?
    @State var shouldNavigateToChatLogView = false
    
    private var chatLogViewModel = ChatLogViewModel(chatUser: nil)
    
    var body: some View {
        ScrollView {
            Text("")
            ForEach(MMViewModel.recentMessages) { recent in
                VStack {
                    NavigationLink(destination: ChatLogView(CLViewModel: self.chatLogViewModel), isActive: self.$shouldNavigateToChatLogView){
                    }
                    Button {
                        let uid = FirebaseManager.shared.auth.currentUser?.uid == recent.fromId ? recent.toId : recent.fromId
                        self.chatUser = .init(data: [FirebaseConstants.name: recent.name, FirebaseConstants.profileImageUrl: recent.profileImageUrl, FirebaseConstants.uid: uid])
                        self.chatLogViewModel.chatUser = self.chatUser
                        self.chatLogViewModel.fetchMessages()
                        self.shouldNavigateToChatLogView.toggle()
                    } label: {
                        Spacer()
                        HStack(spacing: 16) {
                            WebImage(url: URL(string: recent.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .cornerRadius(64)
                                .overlay(RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color(.label), lineWidth: 1)
                                )
                                .shadow(radius: 2)
                            
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(recent.name)
                                    .font(.system(size: 16, weight: .bold))
                                Text(recent.text)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("Gray"))
                                    .multilineTextAlignment(.leading)
                                    
                            }
                            Spacer()
                            
                            VStack {
                                Text(recent.timeAgo)
                                    .font(.system(size: 14, weight: .medium))
                                Spacer()
                            }
                        }
                    }
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    
                    
                    Divider()
                        .padding(.vertical, 10)
                }.padding(.horizontal, 5)
            }
        }
        .background(colorScheme == .dark ? Color(UIColor(.secondary.opacity(0.5))) : Color(UIColor(.secondary.opacity(0.1))))
        .padding(.top, -7)
    }
}

struct AllMessages_Previews: PreviewProvider {
    static var previews: some View {
        AllMessages()
        
        AllMessages()
            .preferredColorScheme(.dark)
    }
}
