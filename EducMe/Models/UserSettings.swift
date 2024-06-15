//
//  UserSettings.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 24/05/2024.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    @Published var birthDate: Date {
        didSet {
            UserDefaults.standard.set(birthDate, forKey: "birthDate")
        }
    }
    
    // Nouvelle propriété pour le tri des partis politiques
    @Published var sortPartiesAlphabetically: Bool {
        didSet {
            UserDefaults.standard.set(sortPartiesAlphabetically, forKey: "sortPartiesAlphabetically")
        }
    }
    
    init() {
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        self.username = UserDefaults.standard.string(forKey: "username") ?? ""
        self.birthDate = UserDefaults.standard.object(forKey: "birthDate") as? Date ?? Date()
        self.sortPartiesAlphabetically = UserDefaults.standard.bool(forKey: "sortPartiesAlphabetically")
    }
    
    func validateInputs() -> Bool {
        return !username.isEmpty && Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year! >= 18
    }
}



