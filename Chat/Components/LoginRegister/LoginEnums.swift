//
//  LoginEnums.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import Foundation

enum Hint: String {
    case login = "Use your email or alphanumeric characters in a range from 3 to 50. First character must be a letter."
    case password = "Use alphanumeric characters in a range from 8 to 12. First character must be a letter."
}

enum Regex: String {
    case login = "^[a-zA-Z][a-zA-Z0-9]{2,49}$"
    case email = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,49}$"
    case password = "^[a-zA-Z][a-zA-Z0-9]{7,11}$"
}
