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
    static let shared = FirebaseManager()
    
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
    
    func signUp(login: String, password: String, image: UIImage?, name: String) {
        auth.createUser(withEmail: login, password: password)  { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            self?.persisitImageToStorage(email: login, image: image, name: name)
            
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
        }
    }
    
    func persisitImageToStorage(email: String, image: UIImage?, name: String) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                print("Failed to push image to Storage: \(err)")
                return
            }

            ref.downloadURL { url, err in
                if let err = err {
                    print("Failed to retrieve downloadURL: \(err)")
                    return
                }

                print("Successfully stored image with url: \(url?.absoluteString ?? "")")
                
                guard let url = url else {return}
                self.storeUserInformation(email: email, imageProfileUrl: url, name: name)
            }
        }
    }
    
    private func storeUserInformation(email: String, imageProfileUrl: URL, name: String){
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            return
        }
        let userData = ["email": email, "uid": uid, "profileImageUrl": imageProfileUrl.absoluteString, "name" : name]
        FirebaseManager.shared.firestore.collection("users")
                .document(uid).setData(userData) { err in
                    if let err = err {
                        print(err)
                        print("\(err)")
                        return
                    }
                    
                    print("Success")
                }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}
