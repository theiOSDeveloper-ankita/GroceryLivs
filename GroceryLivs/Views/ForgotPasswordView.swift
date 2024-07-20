//
//  ForgotPasswordView.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 19/07/24.
//

import SwiftUI
import Firebase

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var message: String?
    @State private var isLoading: Bool = false
    @EnvironmentObject var authUserViewModel : AuthUserViewModel
    @State private var showpassswordSentEmailAlert: Bool = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            Button(action: {
                    Task{
                         await authUserViewModel.sendPasswordResetEmail(email: email)
                       
                    }
                showpassswordSentEmailAlert.toggle()
              
                }) {
                    Text("Send Password Reset Email")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .alert(isPresented: $showpassswordSentEmailAlert) {
                            Alert(
                                title: Text("Alert"),
                                message: Text("Email has been sent to your mentioned email id. Please check."),
                                dismissButton: .default(Text("OK"))
                            )
                        }

        }
        .padding()
    }


  
}


#Preview {
    ForgotPasswordView()
}
