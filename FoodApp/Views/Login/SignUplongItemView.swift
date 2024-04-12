//
//  SignUplongItemView.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/24/23.
//

import SwiftUI

struct SignUplongItemView: View {
    let objectText: String
    let backgroundColor: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Text(objectText)
                .font(.body).foregroundColor(.white)
        }
        .frame(height: 60).frame(maxWidth: .infinity).background(Color(backgroundColor)).cornerRadius(5)
    }
}

struct SignUplongItemView_Previews: PreviewProvider {
    static var previews: some View {
        SignUplongItemView(objectText: "Email", backgroundColor: "loginButtonBackground").previewLayout(.sizeThatFits).padding()
    }
}
