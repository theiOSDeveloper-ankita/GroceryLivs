//
//  ContentView.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 18/06/24.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var emailID: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authUserViewModel : AuthUserViewModel
    @State private var isForgotPasswordSheet: Bool = false
    var body: some View {
            NavigationView{
                ZStack {
                    Color(.green)
                        .ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                        .foregroundColor(.white.opacity(0.25))
                    Circle()
                        .scale(1.35)
                        .foregroundColor(.white)
                    VStack{
                        Text("Welcome to Grocery Livs")
                            .font(.largeTitle)
                            .italic()
                            .bold()
                            .foregroundStyle(.green)
                            .padding()
                        
                        TextField("Email ID", text: $emailID)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(.black.opacity(0.05))
                            .cornerRadius(12)
                        
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 350, height: 50)
                            .background(.black.opacity(0.05))
                            .cornerRadius(12)
                            .padding(.bottom)
                        HStack{
                            Spacer()
                            Button("Forgot Password?"){
                                isForgotPasswordSheet.toggle()
                            }.foregroundStyle(.blue)
                                .padding(.trailing)
                                .sheet(isPresented:$isForgotPasswordSheet ){
                                    ForgotPasswordView()
                                        .presentationDetents([.height(200)])
                                }
                        }
                   
//                            NavigationLink("Forgot password?", destination: ForgotPasswordView().navigationBarBackButtonHidden(true))
//                            .padding(.trailing)
//          
                        Button("Login"){
                            // Authenticate user
                            Task{
                                try await authUserViewModel.sigIn(email:emailID,
                                                                  password:password)
                              }
                      }
                        .padding()
                        .frame(width: 250, height: 50)
                        .background(.green)
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .font(.title)
                 
                        Text("Not having an account?")
                        NavigationLink("Sign up to create an account", destination: SignUpView().navigationBarBackButtonHidden(true))
                        
                        
                    }
                    
                }
                
            }
            
        }
    
       
 
    }


#Preview {
    LoginView()
}
