//
//  LoginClass.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import Foundation
import FirebaseAuth

class AppViewModel: ObservableObject {
    let auth = Auth.auth()

    @Published var signedIn = false

    var isSignedIn: Bool {
        return auth.currentUser != nil
    }

    func signIn(login: String, password: String){
        auth.signIn(withEmail: login, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }

            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
            
        }
    }

    func signUp(login: String, password: String) {
        auth.createUser(withEmail: login, password: password)  { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}
