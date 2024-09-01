//
//  TabView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass") }
            WishlistView()
                .tabItem { Label("Wishlist", systemImage: "heart") }

            ProfileView()
                .tabItem { Label("Profile", systemImage: "person") }
        }
        .accentColor(.pink)
    }
}

#Preview {
    MainTabView()
}
