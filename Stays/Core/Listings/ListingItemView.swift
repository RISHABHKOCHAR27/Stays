//
//  ListingItemView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    Text("630 km away")
                        .foregroundStyle(.gray)
                    Text("Sept 1-7")
                        .foregroundStyle(.gray)
                    HStack (spacing: 2) {
                       Text("₹\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("/night")
                    }
                    .padding(.bottom)
                    .foregroundStyle(.black)
                }
                
                Spacer()
                
                HStack (spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("\(listing.formattedRating)")
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}

