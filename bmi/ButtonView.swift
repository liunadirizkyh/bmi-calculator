//
//  ButtonView.swift
//  bmi
//
//  Created by Liu on 19/04/24.
//

import SwiftUI

struct ButtonView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .frame(width: 150, height: 50)
            .foregroundColor(.white)
            .background(Color("purpledark"))
            .cornerRadius(10)
            .bold()
    }
}

#Preview {
    ButtonView(title: "example")
}
