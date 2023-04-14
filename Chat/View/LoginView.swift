//
//  LoginView.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI

struct LoginView: View {

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

    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: AppViewModel

    init() {
        setupNavigationBarAppearance(titleColor: UIColor.white, barColor: UIColor.systemIndigo)
    }


    var body: some View {
        VStack(spacing: 20) {

            Image(systemName: "person.crop.circle")
                .font(.system(size: 80, weight: .thin))
                .frame(height: 120, alignment: .bottom)

            Text("Enter login and password")
                .font(.system(size: 20, weight: .thin))

            //MARK: - Login
            VStack(alignment: .leading, spacing: 10) {
                TextFieldName(name: "Login")

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

                TextFieldHint(hint: passwordHint)
            }

            //MARK: - SignInButton
            Button {
                viewModel.signIn(login: login, password: password)
            } label: {
                Text("Sign in")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 40, alignment: .center)
            }
            .disabled((isValidLogin && isValidPassword) == false)
            .background(isValidLogin && isValidPassword ? Color.indigo : .secondary)
            .cornerRadius(5)

            Spacer()

            HStack{
                Text("No account yet?")
                NavigationLink("Sign up", destination: RegisterView())
                    .foregroundColor(Color.indigo)
            }

        }
        .padding()
        .navigationBarTitle("Chat", displayMode: .inline)
        .background(colorScheme == .dark ? Color(UIColor(.secondary.opacity(0.7))) : Color(UIColor(.secondary.opacity(0.1))))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
