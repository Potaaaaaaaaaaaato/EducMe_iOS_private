//
//  PartiePolitique.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import Foundation

struct PartiePolitique: Identifiable {
    let id = UUID()
    let name: String
    let ideology: String
    let exemple: String
    let leader: String
    let imageName: String?
    let date: String
    let position: String
    let histoire1: String
    let histoire2: String
    let histoire3: String
    //let color: String
}

