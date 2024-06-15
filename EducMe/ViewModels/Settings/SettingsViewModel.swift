//
//  SettingsViewModel.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 23/05/2024.
//
/*
import SwiftUI
import Combine

class SettingsViewModel: ObservableObject {
    @Published var selectedLanguage: String = "Français"
    @Published var notificationsEnabled: Bool = true

    let languages = ["Français", "Anglais", "Espagnol"]

    // Ajouter des fonctions pour sauvegarder les paramètres, récupérer les données, etc.
}
 */

import SwiftUI
import UserNotifications

class SettingsViewModel: ObservableObject {
    @Published var selectedLanguage: String = "Français"
    @Published var notificationsEnabled: Bool = false {
        didSet {
            if notificationsEnabled {
                enableNotifications()
            } else {
                disableNotifications()
            }
        }
    }

    @Published var isLoggedOut = false

    let languages = ["Français"]

    init() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.notificationsEnabled = settings.authorizationStatus == .authorized
            }
        }
    }

    func enableNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
                DispatchQueue.main.async {
                    self.notificationsEnabled = false
                }
            }
        }
    }

    func disableNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }

    func logout() {
        // Supprimer les données de l'utilisateur
        UserDefaults.standard.removeObject(forKey: "firstName")
        UserDefaults.standard.removeObject(forKey: "birthDate")
        UserDefaults.standard.set(false, forKey: "isRegistered")
        
        // Mettre à jour l'état de déconnexion
        DispatchQueue.main.async {
            self.isLoggedOut = true
        }
    }
}

