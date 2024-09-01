//
//  CollapsedPickerView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct CollapsedPickerView: View {
    
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .shadow(radius: 5)
//        .padding()
    }
}

#Preview {
    CollapsedPickerView(title: "When", description: "Add dates")
}
