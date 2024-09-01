//
//  DeveloperPreview.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Rishabh Kochar",
            ownerImageUrl: "profile-pic",
            numberOfBeds: 4,
            numberOfBedrooms: 3,
            numberOfBathrooms: 4,
            numberOfguests: 4,
            pricePerNight: 5670,
            lattitude: 28.7850,
            longitude: 77.1936, 
            imageUrl: ["Listing-5", "Listing-1","Listing-3","Listing-2"],
            address: "124 Main Road",
            city: "GK-1",
            state: "Delhi",
            title: "Mannat Villa",
            rating: 4.90,
            features: [.selfCheckIn, .superHost],
            amenities: [.TV, .alarm, .laundry, .pool, .wifi],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Rohan",
            ownerImageUrl: "profile-pic",
            numberOfBeds: 3,
            numberOfBedrooms: 3,
            numberOfBathrooms: 4,
            numberOfguests: 4,
            pricePerNight: 4567,
            lattitude: 28.7850,
            longitude: 78.1936, 
            imageUrl: ["Listing-4", "Listing-1","Listing-3"],
            address: "190 Main St",
            city: "GK-2",
            state: "Delhi",
            title: "Heavan",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.TV, .laundry, .pool, .wifi],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Rakesh",
            ownerImageUrl: "profile-pic",
            numberOfBeds: 25,
            numberOfBedrooms: 13,
            numberOfBathrooms: 14,
            numberOfguests: 19,
            pricePerNight: 1547,
            lattitude: 25.7850,
            longitude: 78.1936, 
            imageUrl: ["Listing-1", "Listing-2","Listing-3","Listing-4"],
            address: "156 Main St",
            city: "Friend Colony",
            state: "Delhi",
            title: "Delhi wala ghar",
            rating: 4.8,
            features: [.selfCheckIn, .superHost],
            amenities: [.TV, .laundry, .pool, .wifi],
            type: .townHouse
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Chirag",
            ownerImageUrl: "profile-pic",
            numberOfBeds: 30,
            numberOfBedrooms: 20,
            numberOfBathrooms: 30,
            numberOfguests: 40,
            pricePerNight: 45670,
            lattitude: 28.7850,
            longitude: 78.1936, 
            imageUrl: ["Listing-5", "Listing-1"],
            address: "190 Main St",
            city: "Lajpat Nagar",
            state: "Delhi",
            title: "Antilla",
            rating: 4.94,
            features: [.selfCheckIn, .superHost],
            amenities: [.TV, .laundry, .pool, .wifi],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Rohan",
            ownerImageUrl: "profile-pic",
            numberOfBeds: 3,
            numberOfBedrooms: 3,
            numberOfBathrooms: 4,
            numberOfguests: 4,
            pricePerNight: 14567,
            lattitude: 28.7850,
            longitude: 78.1936, 
            imageUrl: ["Listing-2", "Listing-4","Listing-3","Listing-6", "Listing-1"],
            address: "190 Main St",
            city: "Lodi Garden",
            state: "Delhi",
            title: "Appartment 1",
            rating: 4.9,
            features: [.selfCheckIn, .superHost],
            amenities: [.TV, .laundry, .pool, .wifi],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Rohan",
            ownerImageUrl: "profile-pic",
            numberOfBeds: 3,
            numberOfBedrooms: 3,
            numberOfBathrooms: 4,
            numberOfguests: 4,
            pricePerNight: 6700,
            lattitude: 28.7850,
            longitude: 78.1936, 
            imageUrl: ["Listing-6", "Listing-1","Listing-3","Listing-2"],
            address: "190 Main St",
            city: "Link road",
            state: "Delhi",
            title: "Nice house",
            rating: 4.76,
            features: [.selfCheckIn, .superHost],
            amenities: [.TV, .laundry, .pool, .wifi],
            type: .apartment
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Rohan",
            ownerImageUrl: "profile-pic",
            numberOfBeds: 3,
            numberOfBedrooms: 3,
            numberOfBathrooms: 4,
            numberOfguests: 4,
            pricePerNight: 7200,
            lattitude: 28.7850,
            longitude: 78.1936, 
            imageUrl: ["Listing-4", "Listing-3","Listing-5","Listing-2"],
            address: "200 Main St",
            city: "GK-1",
            state: "Delhi",
            title: "Bada ghar",
            rating: 4.80,
            features: [.selfCheckIn, .superHost],
            amenities: [.TV,.alarm, .laundry, .pool, .wifi],
            type: .villa
        )
    ]
}

extension Listing {
    var formattedRating: String {
        return String(format: "%.2f", rating)
    }
}
