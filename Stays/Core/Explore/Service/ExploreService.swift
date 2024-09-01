//
//  ExploreService.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import Foundation

class ExploreService {
    func fetchListing() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
