//
//  SignUpItem.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/21/23.
//

import SwiftUI

struct SignUpItem: View {
    let backgroundColor: String
    let image: String
    
    var body: some View {
        ZStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 25, alignment: .center)
        }
        .frame(width: 85, height: 60, alignment: .center)
        .background(Color(backgroundColor)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 1)
        )
    }
}

struct SignUpItem_Previews: PreviewProvider {
    static var previews: some View {
        SignUpItem(backgroundColor: "googleColor",image: "google-logo")
    }
}
