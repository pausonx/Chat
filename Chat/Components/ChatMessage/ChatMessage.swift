//
//  ChatMessage.swift
//  Chat
//
//  Created by Paulina Wyskiel on 15/04/2023.
//

import Foundation
import FirebaseFirestoreSwift

struct ChatMessage: Codable, Identifiable {
    
    @DocumentID var id: String?
    let fromId, toId, text: String
    let timestamp: Date
}
