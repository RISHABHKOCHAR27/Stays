//
//  Listing.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import Foundation

struct Listing: Codable, Identifiable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBeds: Int
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfguests: Int
    var pricePerNight: Int
    let lattitude: Double
    let longitude: Double
    let imageUrl: [String]
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var features: [ListingFeature]
    var amenities: [ListingAmenities]
    let type: ListingType
}

enum ListingFeature: Int, Codable, Identifiable, Hashable {
    var id: Int { return self.rawValue }
    case selfCheckIn
    case superHost
    
    var title: String {
        switch self {
            case .selfCheckIn: return "Self check-in"
            case .superHost: return "Superhost"
        }
    }
    
    var subTitle: String {
        switch self {
            case .selfCheckIn: return "Check your self in with your phone."
            case .superHost: return "Superhost are experienced, high rated host who provides great experience to guests."
        }
    }
    
    var imageName: String {
        switch self {
            case .selfCheckIn: return "door.left.hand.open"
            case .superHost: return "medal"
        }
    }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    var id: Int { return self.rawValue }
    case pool
    case wifi
    case laundry
    case TV
    case alarm
    
    var title: String {
        switch self {
            case .pool: return "Pool"
            case .wifi: return "Wifi"
            case .laundry: return "Laundry"
            case .TV: return "TV"
            case .alarm: return "Alarm System"
        }
    }
    
    var imageName: String {
        switch self {
            case .pool: return "figure.pool.swim"
            case .wifi: return "wifi"
            case .laundry: return "washer"
            case .TV: return "tv"
            case .alarm: return "checkerboard.shield"
        }
    }
    
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    var id: Int { return self.rawValue }
    case apartment
    case villa
    case townHouse
    
    var description: String {
        switch self {
            case .apartment: return "Apartment"
            case .villa: return "Villa"
            case .townHouse: return "Town house"
        }
    }
}
