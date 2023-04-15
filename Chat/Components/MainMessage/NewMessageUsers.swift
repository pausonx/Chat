//
//  NewMessageUsers.swift
//  Chat
//
//  Created by Paulina Wyskiel on 15/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewMessageUsers: View {
    
    @ObservedObject private var NMViewModel = NewMessageUsersModel()
    @Environment(\.presentationMode) var presentationMode
    
    let didSelectNewUser: (ChatUser) -> ()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(NMViewModel.errorMessage)
                
                ForEach(NMViewModel.users) { user in
                    Button {
                        presentationMode.wrappedValue.dismiss()
                        didSelectNewUser(user)
                    } label: {
                        HStack(spacing: 10) {
                            WebImage(url: URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(60)
                                .overlay(RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(.label), lineWidth: 1)
                                )
                            Text(user.email)
                                .foregroundColor(Color(.label))
                                .font(.system(size: 16))
                            Spacer()
                        }.padding(.horizontal)
                    }
                    Divider()
                    
                }
            }.navigationTitle("New Message")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Cancel")
                        }
                    }
                }
        }
    }
}

//struct NewMessageUsers_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMessageView()
//    }
//}
