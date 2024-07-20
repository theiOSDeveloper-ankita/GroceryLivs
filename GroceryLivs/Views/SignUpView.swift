//
//  SignUpView.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 18/06/24.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var fullname: String = ""
    @State private var email: String = ""
    @State private var passwrd: String = ""
    @State private var emptiedName = 0
    @EnvironmentObject var authUserViewModel : AuthUserViewModel
    
    var body: some View {
        VStack{
            Text("Please sign up to continue")
                .font(.title)
                    .bold()
                    .foregroundStyle(.green)
                    .padding()
    
            TextField("Fullname", text: $fullname)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(.black.opacity(0.05))
                    .cornerRadius(12)
                    .border(.red, width: CGFloat(emptiedName))
            
            TextField("Email", text: $email)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(.black.opacity(0.05))
                    .cornerRadius(12)
                    
            
            SecureField("Password", text: $passwrd)
                .padding()
                .frame(width: 350, height: 50)
                .background(.black.opacity(0.05))
                .cornerRadius(12)
                .padding(.bottom)
            
            Button("Sign Up"){
                // Sign up Authentication
                Task{
                  try await authUserViewModel.createUser(email:email,
                                                    password:passwrd,
                                                    fullname:fullname)
                }
               
            }
            .padding()
            .frame(width: 250, height: 50)
            .background(.green)
            .cornerRadius(15)
            .foregroundColor(.white)
            .font(.title)
            .padding()
            
            Text("Already having an account?")
            NavigationLink("Click here to login", destination: LoginView().navigationBarBackButtonHidden(true))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                
        }
    }
    
//    func registerUser() {
//        if fullname.isEmpty == false{
//            Auth.auth().createUser(withEmail: email, password: passwrd){ successResponse, error in
//                if error != nil{
//                    print(error?.localizedDescription)
//                }
//            
//            }
//
//        }
//        else{
//          emptiedName = 2
//        }
//       
//    }
}

#Preview {
    SignUpView()
}
