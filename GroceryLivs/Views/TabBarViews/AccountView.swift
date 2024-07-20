//
//  Settings.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 20/06/24.
//

import SwiftUI

struct AccountView: View {
    @State private var pickerItems = ["My Profile","Settings"]
    @State private var defaultPickerItem = "My Profile"
    @EnvironmentObject var authUserViewModel : AuthUserViewModel
    @State private var isChangepasswordSheet: Bool = false
    @State private var showDeleteAlert: Bool = false
    @AppStorage("appTheme") private var isDarkModeOn = false
    
    var body: some View {
            List{
            Section{
                HStack{
                    Text(authUserViewModel.currentUser?.initials ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.gray)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(authUserViewModel.currentUser?.fullname ?? "")
                            .font(.headline)
                        Text(authUserViewModel.currentUser?.email ?? "")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                
            }
                        Section("General"){
                            HStack(spacing: 10){
                                Image(systemName: "gear")
                                    .frame(alignment: .leading)
                                Text("Version")
                                Spacer()
                                Text("1.0.0")
                                    .frame(alignment: .trailing)
                                    .foregroundStyle(.gray)
                            }
                        }
            
                        Section("Settings"){
                            VStack(alignment: .leading){
                                HStack(spacing: 10) {
                                    Image(systemName: "lightbulb.circle.fill")
//                                    Text("Dark Mode")
//                                    Spacer()
                                    Toggle("Dark Mode", isOn: $isDarkModeOn)
                                }
                                Divider()
                                HStack(spacing: 8){
                                Image(systemName: "lock.fill")
                                Button("Reset Password"){
                                    isChangepasswordSheet.toggle()
                                }.foregroundStyle(.blue)
                                    .sheet(isPresented:$isChangepasswordSheet ){
                                        ChangePasswordView()
                                            .presentationDetents([.height(200)])
                                    }}
                           Divider()
                            HStack(spacing: 10){
                                Image(systemName: "arrowshape.left.circle.fill")
                                Text("Log Out")
                                   // .foregroundStyle(.black)
                                    .onTapGesture {
                                        authUserViewModel.logOut()
                                    }
                            }}}
            
                        Section{
                            HStack{
                                Spacer()
                                Image(systemName: "trash.fill")
                                    .foregroundStyle(.red)
                                Button("Delete account", role: .destructive){
                                    showDeleteAlert.toggle()
            
                                }
                               // .foregroundStyle(.black)
                                .alert("Delete Account", isPresented: $showDeleteAlert){
                                    Button("Delete", role: .destructive){
                                        Task{
                                            try await authUserViewModel.deleteUser()
            
                                        }
                                    }
                                    Button("Cancel", role: .cancel){}
                                }message: {
                                    Text("Do you really want to delete the account?")
                                }
                                Spacer()
                            }
                        }
            
        }
          
    }
}

#Preview {
    AccountView()
}


