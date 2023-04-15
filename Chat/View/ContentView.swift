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
                MainMessageView()
                    .navigationBarHidden(true)
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
