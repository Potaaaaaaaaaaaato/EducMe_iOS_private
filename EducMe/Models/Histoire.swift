//
//  Histoire.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import Foundation

struct Histoire: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let date: String
    let membres: String
}

