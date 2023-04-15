//
//  AllMessages.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI

struct AllMessages: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                VStack {
                    NavigationLink {
                        Text("Destination")
                    } label: {
                        Spacer()
                        HStack(spacing: 16) {
                            Image(systemName: "person.fill")
                                .font(.system(size: 35))
                                .padding(8)
                                .overlay(RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(.label), lineWidth: 1)
                                )
                            
                            
                            VStack(alignment: .leading) {
                                Text("Username")
                                    .font(.system(size: 16, weight: .bold))
                                Text("Message sent to user")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("Gray"))
                            }
                            Spacer()
                            
                            VStack {
                                Text("22d")
                                    .font(.system(size: 14, weight: .medium))
                                Spacer()
                            }
                        }
                    }
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    
                    
                    Divider()
                        .padding(.vertical, 10)
                }.padding(.horizontal)
            }
        }
        .background(colorScheme == .dark ? Color(UIColor(.secondary.opacity(0.5))) : Color(UIColor(.secondary.opacity(0.1))))
        .padding(.top, -8)
    }
}

struct AllMessages_Previews: PreviewProvider {
    static var previews: some View {
        AllMessages()
        
        AllMessages()
            .preferredColorScheme(.dark)
    }
}
