//
//  OnboardingView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 24/05/2024.
//
/*
import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var username: String = ""
    @State private var birthDate: Date = Date()
    @State private var showError: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Bienvenue sur EducMe")
                    .font(.largeTitle)
                    .padding()
                
                TextField("Prénom", text: $username)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                
                DatePicker("Date de naissance", selection: $birthDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                if showError {
                    Text("Veuillez entrer un prénom et être majeur pour continuer.")
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {
                    if username.isEmpty || Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year! < 18 {
                        showError = true
                    } else {
                        userSettings.username = username
                        userSettings.birthDate = birthDate
                        userSettings.isLoggedIn = true
                    }
                }) {
                    Text("Commencer")
                        .modifier(ButtonStyle())
                }
                .padding()
            }
            .modifier(BackgroundColor())
        }
    }
}
*/
