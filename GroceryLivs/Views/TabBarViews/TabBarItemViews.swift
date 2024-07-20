//
//  TabBarViews.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 20/06/24.
//

import SwiftUI

struct TabBarItemViews: View {
    @StateObject private  var cartManager = CartManager()
    @EnvironmentObject var authUserViewModel : AuthUserViewModel
    
    var body: some View {
     //   if let user = authUserViewModel.currentUser{
            TabView {
                HomeScreenView()
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house")
                    }
                
                CartView()
                    .tabItem {
                        Text("Cart")
                        Image(systemName: "cart")
                    }
                
                
                HelpView()
                    .tabItem {
                        Text("Help")
                        Image(systemName: "questionmark")
                    }
                
                AccountView()
                    .tabItem {
                        Text("Account")
                        Image(systemName: "person.fill")
                    }
            }
            .environmentObject(cartManager)
        }
  //  }
}

#Preview {
    TabBarItemViews()
        .environmentObject(CartManager())
}
