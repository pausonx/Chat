//
//  CheckValid.swift
//  InstagramClone
//
//  Created by Paulina Wyskiel on 05/04/2023.
//

import Foundation

extension String {
    func isValid(regexes: [String]) -> Bool {
        for regex in regexes {
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
            if predicate.evaluate(with: self) == true {
                return true
            }
        }
        return false
    }
}
