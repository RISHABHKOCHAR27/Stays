//
//  ListingImageCaresalView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    //var images = ["Listing-1", "Listing-2", "Listing-3", "Listing-4"]
    let listing: Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageUrl, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
            .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
