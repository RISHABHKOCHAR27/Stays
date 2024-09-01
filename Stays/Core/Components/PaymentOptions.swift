//
//  PaymentOptions.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct PaymentOptions: View {
    var iconName: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.headline)
                .foregroundColor(.pink)
                .frame(width: 30, height: 30)
            Text(title)
                .font(.headline)
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        .padding(.horizontal)
    }
}

#Preview {
    PaymentOptions(iconName: "qrcode", title: "UPI")
}

