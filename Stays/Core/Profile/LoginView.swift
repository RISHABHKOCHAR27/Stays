//
//  LoginView.swift
//  Stays
//
//  Created by nuclei on 01/09/24.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var showLoginOverlay: Bool
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    showLoginOverlay = false // Dismiss the current view
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.gray)
                        .padding()
                        .background(Circle().fill(Color.white))
                }
                Spacer()
            }
            .padding(.leading)
            
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                handleLogin()
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color.pink)
                    .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func handleLogin() {
        // Simple validation
        if username.isEmpty || password.isEmpty {
            alertMessage = "Please fill in all fields."
            showAlert = true
        } else if username == "testuser" && password == "password123" {
            alertMessage = "Login successful!"
            showAlert = true
            // Perform actual login here
        } else {
            alertMessage = "Invalid credentials. Please try again."
            showAlert = true
        }
    }
}

