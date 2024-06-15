//
//  User.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let name: String
    let email: String
}

