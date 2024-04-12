//
//  RegistrationView.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/25/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            
            VStack(spacing: 24) {
                InputItem(text: $email,
                          title: "Email Address",
                          placeholder: "name@example.com")
                .autocapitalization(.none)
                InputItem(text: $fullname,
                          title: "Full Name",
                          placeholder: "Enter your password")
                InputItem(text: $password,
                          title: "Password",
                          placeholder: "Enter your password",
                          isSecureField: true)
                InputItem(text: $confirmPassword,
                          title: "Confirm Password",
                          placeholder: "Confirm your password",
                          isSecureField: true)
                
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button{
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                        password:password,
                                                        fullname:fullname)
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width-32, height:48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top, 24)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
