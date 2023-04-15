//
//  ChatUser.swift
//  Chat
//
//  Created by Paulina Wyskiel on 15/04/2023.
//

import Foundation

struct ChatUser: Identifiable {
    var id: String { uid }
    let uid, email, profileImageUrl, name: String
    
    init(data: [String: Any]){
        self.uid = data["uid"] as? String ?? ""
        self.email = data["email"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
    }
}
