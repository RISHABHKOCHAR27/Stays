//
//  ProfileView.swift
//  Stays
//
//  Created by nuclei on 31/08/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showLoginOverlay = false
    
    var body: some View {
        ZStack {
            VStack {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("Log in to book your ") + Text("Stays.").fontWeight(.semibold)
                    }
                    
                    Button{
                        showLoginOverlay = true
                    } label: {
                        Text("Log in")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 370, height: 50)
                            .background(Color.pink)
                            .cornerRadius(5)
                    }
                    
                    
                    HStack {
                        Text("Don't have an account? ")
                        Text("Sign up")
                            .fontWeight(.semibold)
                            .underline()
                    }
                    .font(.caption)
                    
                }
                
                
                VStack(alignment: .leading, spacing: 24) {
                    ProfileOptionsView(imageName: "gear", title: "Settings")
                    ProfileOptionsView(imageName: "gear", title: "Accessibility")
                    ProfileOptionsView(imageName: "questionmark.circle", title: "Visit the help center")
                }
                .padding()
            }
            
            if showLoginOverlay {
                Color.black.opacity(0.5) // Background dimming effect
                    .edgesIgnoringSafeArea(.all)
                
                LoginView(showLoginOverlay: $showLoginOverlay)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .trailing))
                    .animation(.snappy)
            }
        }
    }
}

#Preview {
    ProfileView()
}
