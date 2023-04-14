//
//  ContentView.swift
//  ChatApp
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.isSignedIn {
                VStack {
                    Text("You are signed in")
                    
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Sign out")
                            .foregroundColor(Color.mint)
                            .frame(width: 200, height: 50)
                            .background(Color.gray)
                    })
                
                }

            } else {
                LoginView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AppViewModel()
        ContentView()
            .environmentObject(viewModel)
    }
}
