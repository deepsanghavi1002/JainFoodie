//
//  SignUpTitle.swift
//  FoodApp
//
//  Created by Deep Sanghavi on 7/21/23.
//

import SwiftUI

struct SignUpTitle: View {
    let title: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline,spacing: 0) {
            Text(title)
                .font(.body)
                .padding(.horizontal, 10)
        }
    }
}

struct SignUpTitle_Previews: PreviewProvider {
    static var previews: some View {
        SignUpTitle(title: "Get Started with:").previewLayout(.sizeThatFits).padding()
       
        
    }
}
