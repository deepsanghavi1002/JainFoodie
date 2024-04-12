//
//  SwitchToLoginView.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/24/23.
//

import SwiftUI

struct SwitchToLoginView: View {
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 3) {
            Text("Already Signed Up?").font(.body)
            Button {
                
            }label: {
                Text("Login")
                    .font(.body).foregroundColor(Color("hyperLink"))
            }
        }
    }
}

struct SwitchToLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchToLoginView()
    }
}
