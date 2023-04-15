//
//  RegisterView.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI
import FirebaseFirestore

struct RegisterView: View {
    @State var shouldShowImagePicker = false
    @State var image: UIImage?

    @State private var isValidImage: Bool = false
    @State private var isValidLogin: Bool = false
    @State private var isValidPassword: Bool = false
    
    @State private var loginHint: String = ""
    @State private var passwordHint: String = ""
    

    @State private var login: String = "" {
        didSet {
            isValidLogin = login.isValid(regexes: [Regex.login, Regex.email].compactMap { "\($0.rawValue)" })
            loginHint = isValidLogin ? "" : Hint.login.rawValue
        }
    }

    @State private var password: String = "" {
        didSet {
            isValidPassword = password.isValid(regexes: [Regex.password].compactMap { "\($0.rawValue)" })
            passwordHint = isValidPassword ? "" : Hint.password.rawValue
        }
    }
    
    @State private var name: String = ""

    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: AppViewModel

    
    @ObservedObject private var NMViewModel = NewMessageUsersModel()
    
    init() {
        setupNavigationBarAppearance(titleColor: UIColor.white, barColor: UIColor.systemIndigo)
    }

    func isImage() -> Bool {
        if image != nil{
            return true
        }
        else{
            return false
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            //MARK: - ProfileImageButton
            TextFieldName(name: "Profile Image")
                .frame(height: 50, alignment: .bottom)
                
            Button {
                shouldShowImagePicker.toggle()
            } label: {
                VStack {
                    if let image = self.image {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .scaledToFit()
                            .cornerRadius(150)
                            .overlay(RoundedRectangle(cornerRadius: 150).stroke(Color.black, lineWidth: 2))
                    } else {
                        Image(systemName: "person.circle")
                            .font(.system(size: 150, weight: .thin))
                        
                        TextFieldHint(hint: "You must select a profile image.")
                    }
                }
                
            }

            //MARK: - Name
            VStack(alignment: .leading, spacing: 10) {
                TextFieldName(name: "Name")

                TextField("", text: $name)
                    .onChange(of: name, perform: { newValue in
                        self.name = newValue
                    })
                    .font(.system(size: 20, weight: .thin))
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 45)
                    .cornerRadius(5)
                    .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 0.1)
                    )
                    .background(Color.white)
                    .foregroundColor(.black.opacity(0.8))

                TextFieldHint(hint: loginHint)
            }

            //MARK: - Email
            VStack(alignment: .leading, spacing: 10) {
                TextFieldName(name: "Email")

                TextField("", text: $login)
                    .onChange(of: login, perform: { newValue in
                        self.login = newValue
                    })
                    .font(.system(size: 20, weight: .thin))
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 45)
                    .cornerRadius(5)
                    .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 0.1)
                    )
                    .background(Color.white)
                    .foregroundColor(.black.opacity(0.8))
                
                TextFieldHint(hint: loginHint)
                
            }


            //MARK: - Password
            VStack(alignment: .leading, spacing: 11) {
                TextFieldName(name: "Password")

                SecureField("", text: $password)
                    .onChange(of: password, perform: { newValue in
                        self.password = newValue
                    })
                    .font(.system(size: 20, weight: .thin))
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(height: 45)
                    .cornerRadius(5)
                    .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(lineWidth: 0.1)
                    )
                    .background(Color.white)
                    .foregroundColor(.black.opacity(0.8))
            }
            
            //MARK: - LoginButton
            Button {
                viewModel.signUp(login: login, password: password, image: image, name: name)
            } label: {
                Text("Sign up")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40, alignment: .center)
            }
            .disabled((isValidLogin && isValidPassword && isImage() && (name != "")) == false)
            .background(isValidLogin && isValidPassword ? Color.indigo : .secondary)
            .cornerRadius(5)

            Spacer()

            HStack{
                Text("Already have an account?")
                NavigationLink("Sign in", destination: LoginView())
                    .foregroundColor(Color.indigo)
            }
            
        }
        .padding()
        .navigationBarTitle("Chat", displayMode: .inline)
        .background(colorScheme == .dark ? Color(UIColor(.secondary.opacity(0.7))) : Color(UIColor(.secondary.opacity(0.1))))
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
