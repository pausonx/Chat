//
//  MainMessageView.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI

struct MainMessageView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            UserNavBar()
            AllMessages()
        }
        .overlay(NewMessageButton(), alignment: .bottom)
    }
}

struct MainMessageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessageView()
        
        MainMessageView()
            .preferredColorScheme(.dark)
    }
}
