//
//  userNavBar.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserNavBar: View {
    
    @State var shouldShowLogOutOptions = false
    
    @ObservedObject private var MMViewModel = MainMessagesViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        HStack(spacing: 16) {
                    
            WebImage(url: URL(string: MMViewModel.chatUser?.profileImageUrl ?? ""))
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(50)
                .overlay(RoundedRectangle(cornerRadius: 44)
                            .stroke(Color(.label), lineWidth: 1)
                )
                .shadow(radius: 5)
            
            VStack(alignment: .leading, spacing: 4) {
                let name = MMViewModel.chatUser?.name ?? ""
                
                Text(name)
                    .font(.system(size: 24, weight: .bold))
                
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("Online")
                        .font(.system(size: 12))
                        .foregroundColor(Color("Gray"))
                }
                
            }
            
            Spacer()
            Button {
                shouldShowLogOutOptions.toggle()
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color("AccentColor"))
            }
        }
        .padding()
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                .destructive(Text("Sign Out"), action: {
                    viewModel.signOut()
                }),
                    .cancel()
            ])
        }
        .background(colorScheme == .dark ? Color(UIColor(.secondary.opacity(0.5))) : Color(UIColor(.secondary.opacity(0.2))))
    }
}

struct UserNavBar_Previews: PreviewProvider {
    static var previews: some View {
        UserNavBar()
            
        
        UserNavBar()
            .preferredColorScheme(.dark)
    }
}
