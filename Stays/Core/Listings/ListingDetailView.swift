//
//  ListingDetailView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var cameraPosition: MapCameraPosition
    
    let listing: Listing
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(center: listing.city == "GK-1" ? .GK : .southDelhi,
                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color(.black))
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 332, height: 32)
                        }
                        .padding(.top, 45)
                        .padding(.leading, 45)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text (listing.title)
                    .font(.title)
                    .fontWeight (.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        Image (systemName:"star.fill")
                        Text("\(listing.formattedRating)")
                        Text(" - ")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            //Host info
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    Text("\(listing.numberOfguests) guests - \(listing.numberOfBedrooms) rooms - \(listing.numberOfBeds) beds - \(listing.numberOfBathrooms) baths")
                        .font(.caption)
                        .frame(width: 250, alignment: .leading)
                }
                Spacer()
                
                Image("\(listing.ownerImageUrl)")
                    .frame(width: 85, height: 75)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                         
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text(feature.subTitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you will sleep?")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                            VStack{
                                HStack {
                                    Image(systemName: "bed.double")
                                    Image(systemName: "bed.double")
                                }
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 130, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers:")
                    .fontWeight(.semibold)
                ForEach(listing.amenities) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        Text(amenity.title)
                            .font(.footnote)
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you will be!")
                    .font(.headline)
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
            .padding(.bottom)
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total with taxes")
                            .font(.footnote)
                        Text("Oct 3 - 7")
                            .underline()
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: PaymentMethodView( listing: listing)) {
                        Text("Reserve")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(Color(.white))
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[2])
}
