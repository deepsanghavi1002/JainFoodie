//
//  LoginViewModel.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/24/23.
//

import SwiftUI
import Firebase
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    
    @Published var isLogin: Bool = false
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
}
