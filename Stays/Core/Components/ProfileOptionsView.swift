//
//  ProfileOptionsView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct ProfileOptionsView: View {
    
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                Text(title)
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "chevron.right")
            }
            Divider()
                .font(.title2)
            .fontWeight(.semibold)
        }
    }
}

#Preview {
    ProfileOptionsView(imageName: "gear" ,title: "Setting")
}
