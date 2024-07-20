//
//  RootView.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 10/07/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var authUserViewModel : AuthUserViewModel
    
    var body: some View {
        Group{
            if authUserViewModel.usersession != nil{
                TabBarItemViews()
            }
            else{
                LoginView()
            }}
    }
}

#Preview {
    RootView()
}
