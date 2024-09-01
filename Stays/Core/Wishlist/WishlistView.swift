//
//  WishlistView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStackLayout(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Login to view your wishlist.")
                        .font(.headline)
                    Text("You can create, view or edit wishlist once you've logged in.")
                        .font(.footnote)
                }
                Button{
                    print("Log in")
                } label: {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 370, height: 50)
                        .background(Color.pink)
                        .cornerRadius(5)
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishlistView()
}
