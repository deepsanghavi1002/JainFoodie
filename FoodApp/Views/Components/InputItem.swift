//
//  LoginItem.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/25/23.
//

import SwiftUI

struct InputItem: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
                
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                
            }else {
                TextField(placeholder, text: $text)
                    .font(.system(size:14))
            }
            Divider()
        }
    }
}

struct InputItem_Previews: PreviewProvider {
    static var previews: some View {
        InputItem(text: .constant(""), title: "Email address", placeholder: "name@example.com")
    }
}
