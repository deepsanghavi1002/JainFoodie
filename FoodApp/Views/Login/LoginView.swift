//
//  LoginView.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/25/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel = AuthViewModel()
    var body: some View {
        NavigationView{
            
            VStack(alignment: .leading, spacing: 10){
                
                VStack(spacing: 24) {
                    InputItem(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    InputItem(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button{
                    print("log user in..")
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width-32, height:42)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top, 24)
                
                Spacer()
                
                
                NavigationLink() {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Dont have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
                
                SignUpTitle(title: "Get Started with")
                    .padding(.vertical)
                
                SignupItemsGroupView()
                
                Spacer().frame(height:30)
                
                
                Spacer()
                
            }.frame(width: 325)
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
