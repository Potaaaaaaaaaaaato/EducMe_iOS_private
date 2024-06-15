//
//  RegistrationView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 23/05/2024.
//

import SwiftUI
import UserNotifications
import CoreLocation

struct RegistrationView: View {
    @State private var firstName: String = ""
    @State private var birthDate = Date()
    @State private var isRegistered = false
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("logo_inscription")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, 50)

                Text("Bienvenue sur EducMe !")
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.largeTitle)
                    .padding(.top, 10)

                VStack(alignment: .leading) {
                    Text("Cette application a pour but de vous aider à mieux comprendre et interagir avec la politique.")
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding()
                    Text("Inscrivez-vous pour personnaliser votre expérience et accéder à toutes les fonctionnalités disponibles.")
                        .font(.body)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal)
                .padding(.top, 30)

                TextField("Prénom", text: $firstName)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top, 20)

                Button(action: {
                    UserDefaults.standard.set(true, forKey: "isRegistered")
                    UserDefaults.standard.set(firstName, forKey: "firstName")
                    UserDefaults.standard.set(birthDate, forKey: "birthDate")

                    // Demander l'autorisation des notifications
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                        if granted {
                            print("Notification permission granted.")
                            // Demander l'autorisation de localisation après la réponse pour les notifications
                            DispatchQueue.main.async {
                                locationManager.requestLocationAuthorization()
                            }
                        } else {
                            print("Notification permission denied.")
                        }
                    }

                    isRegistered = true
                }) {
                    Text("S'inscrire")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red) // Blue = grand public / red = betas
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.red.opacity(0.5), radius: 10, x: 0, y: 5) // Color.blue.opacity = grand public / Color.red.opacity = betas
                }
                .padding(.horizontal)
                .padding(.top, 30)

                Spacer()

                Text("EducMe v1.1 (bêta)")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)
            }
            .padding()
            .onAppear {
                isRegistered = UserDefaults.standard.bool(forKey: "isRegistered")
            }
            .fullScreenCover(isPresented: $isRegistered) {
                MainView()
            }
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        self.locationManager.delegate = self
    }

    func requestLocationAuthorization() {
        // Demander l'autorisation de localisation quand l'application est en cours d'utilisation
        self.locationManager.requestWhenInUseAuthorization()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            self.locationManager.startUpdatingLocation()
        } else {
            print("Location permission denied.")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Handle location updates if needed
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}







