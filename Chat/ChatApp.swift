//
//  ChatApp.swift
//  Chat
//
//  Created by Paulina Wyskiel on 14/04/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      return true
    }
    
    override init() {
        FirebaseApp.configure()
    }
}

@main
struct ChatApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
    WindowGroup {
        let viewModel = AppViewModel()
        ContentView()
            .environmentObject(viewModel)
    }
  }
}
