//
//  AccountViewModel.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 09/07/24.
//

import Foundation

class AccountViewModel: ObservableObject{
    @Published var profileDetails:[ProfileDetail] = []
    func getUserDetails(){
        
    }
}

struct ProfileDetail {
    let username: String
}
