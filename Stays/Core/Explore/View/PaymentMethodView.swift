//
//  PaymentMethodView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct PaymentMethodView: View {
    
   // @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

    let listing: Listing
    let radiusValue: CGFloat = 5
    let cornerRadiusValue: CGFloat = 10
    
    var body: some View {
         
            VStack {
                ZStack(alignment: .topLeading) {
                    ListingImageCarouselView(listing: listing)
                        .frame(height: 190)
                        .ignoresSafeArea()
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color(.black))
                            .background {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 32, height: 32)
                            }
                            .padding(.top, 5)
                            .padding(.leading, 45)
                    }
                }
                
                // Payment Options Section
                VStack(alignment: .leading, spacing: 16) {
                    Spacer()
                    Text("Payment Options")
                        .font(.headline)
                        .padding(.leading)
                    
                    PaymentOptions(iconName: "qrcode", title: "UPI")
                    PaymentOptions(iconName: "creditcard.fill", title: "Cards")
                    PaymentOptions(iconName: "building.columns.fill", title: "Netbanking")
                    PaymentOptions(iconName: "calendar", title: "EMI")
                    PaymentOptions(iconName: "wallet.pass.fill", title: "Wallet")
                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(cornerRadiusValue)
                .shadow(radius: radiusValue)
                .padding()
                Spacer()
                // Bottom Section: Price and Continue Button
                
                VStack(spacing: 0) {
                    Divider()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(listing.pricePerNight)")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text("Including taxes     ")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Handle Continue button action
                        }) {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color.pink)
                                .cornerRadius(radiusValue)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(cornerRadiusValue)
                    .shadow(radius: radiusValue)
                    .padding()
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .background(Color(UIColor.systemGroupedBackground))
            .ignoresSafeArea(edges: .bottom)
        
        .navigationBarBackButtonHidden(true)

    }
}

#Preview {
    PaymentMethodView(listing: DeveloperPreview.shared.listings[0])
}
