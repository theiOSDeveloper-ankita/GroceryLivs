//
//  GroceryLivsApp.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 18/06/24.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct GroceryLivsApp: App {
    @StateObject var authUserViewModel = AuthUserViewModel()
    @AppStorage("appTheme") private var isDarkModeOn = false
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authUserViewModel)
                .preferredColorScheme(isDarkModeOn ? .dark : .light)
                
        }
    }
}
