//
//  SignupItemsGroupView.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/24/23.
//

import SwiftUI

struct SignupItemsGroupView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        HStack(alignment: .center, spacing: 20){
            Button {
                viewModel.signUpWithGoogle()
            } label: {
                SignUpItem(backgroundColor: "googleColor", image: "google-logo")
            }
        }
    }
}

struct SignupItemsGroupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupItemsGroupView()
    }
}
