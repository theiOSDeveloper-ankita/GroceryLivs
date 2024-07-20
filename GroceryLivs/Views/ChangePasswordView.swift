//
//  ChangePasswordView.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 10/07/24.
//

import SwiftUI

struct ChangePasswordView: View {
    @EnvironmentObject var authUserViewModel : AuthUserViewModel
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                SecureField("Current Password", text: $currentPassword)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.black.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.bottom)
                SecureField("New Password", text: $newPassword)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.black.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.bottom)
            }
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        Button("Cancel"){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Update"){
                            print("Update button tapped")
                            Task{
                                 await authUserViewModel.reauthenticate(newPassword: newPassword ,currentPassword:currentPassword)

                            }
                           dismiss()
                        }
                       
                    }
                }
        }
       
           

    }
}

#Preview {
    ChangePasswordView()
}
