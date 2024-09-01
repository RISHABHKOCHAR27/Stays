//
//  ExploreViewModel.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListing() }
    }
    
    func fetchListing() async {
        do{
            self.listings = try await service.fetchListing()
            self.listingsCopy = listings

        } catch {
            print("Failed to fetch the data")
        }
    }
    
    func updateListingForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
