//
//  SearchAndFilterView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack (alignment: .leading) {
                Text(location.isEmpty ? "Where to?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("\(location.isEmpty ? "AnyWhere - " : "")AnyWeek - Add guest")
                    .font(.caption2)
                    .foregroundStyle(Color(.gray))
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    .foregroundStyle(Color(.black))
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color:.black, radius: 5)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: .constant("GK-1"))
}

