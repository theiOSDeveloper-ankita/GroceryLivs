//
//  LoginViewModel.swift
//  GroceryLivs
//
//  Created by Ankita Jaiswal on 09/07/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

@MainActor
class AuthUserViewModel: ObservableObject{
    @Published var usersession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var credential: AuthCredential?
    init(){
        self.usersession = Auth.auth().currentUser
        Task{
            await fetchUser()
        }
    }
    
    
    func sigIn(email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.usersession = result.user
            await fetchUser()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    
    func createUser(email: String, password: String, fullname: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.usersession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        }
        catch let error{
            print(error.localizedDescription)
        }
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
            self.usersession = nil
            self.currentUser = nil
        }
        catch let error{
            print(error.localizedDescription)
        }
        
    }
    
    func deleteUser() async throws {
        guard let user = Auth.auth().currentUser else{
            return
        }
        try await user.delete()
        try await Firestore.firestore().collection("users").document(user.uid).delete()
        self.usersession = nil
        self.currentUser = nil
    }
    
    func fetchUser() async{
        guard let uuid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uuid).getDocument() else {return}
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
    func changePassword(newPassword: String) async {
        do{
            guard let user = Auth.auth().currentUser else{
                return
            }
            
            try await user.updatePassword(to: newPassword)
            
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    
    func reauthenticate(newPassword: String, currentPassword: String) async {
        do{
            guard let user = Auth.auth().currentUser, let email = user.email else{
                return
            }
            var credential = EmailAuthProvider.credential(withEmail: email, password: currentPassword)
            try await user.reauthenticate(with: credential)
            try await user.updatePassword(to: newPassword)
            
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    
    func sendPasswordResetEmail(email: String) async {
        guard isValidEmail(email) else {
             return
        }
      do
      {
          try await Auth.auth().sendPasswordReset(withEmail: email)
      }
          catch let error as NSError{
              print(error.localizedDescription)
          }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}
