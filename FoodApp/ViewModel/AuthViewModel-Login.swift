//
//  AuthViewModel-Login.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/26/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestoreSwift
import Firebase
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn

class AuthViewModel: ObservableObject {
    @Published var isLogin: Bool = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to login with error")
        }
    }
    func signUpWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
                
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtility.rootViewController) { authentication, error in
                if let error = error {
                    print("There is an error signing the user in ==> \(error)")
                    return
                }
                guard let user = authentication?.user, let idToken = user.idToken?.tokenString else { return }
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
                
                Auth.auth().signIn(with: credential) { authResult, error in
                    if let err = error{
                        print(err.localizedDescription)
                        return
                    } else {
                        
                        guard let email = authResult?.user.email else {return}
                        print(email)
                        self.isLogin.toggle()
                    }
                }
            }
    }
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            
            let result = try await Auth.auth().createUser (withEmail: email, password: password)
            self.userSession = result.user
            let user = User (id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("debug: failed to creare user with error\(error.localizedDescription)")
        }
    }
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.userSession = nil
        } catch {
            print("debug: failed to sign out with error\(error.localizedDescription)")
        }
    }
    func deleteAccount() {
        
    }
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
    }
    
}
