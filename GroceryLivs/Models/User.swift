//
//  User.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 09/07/24.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    var fullname: String
    var email: String
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}
