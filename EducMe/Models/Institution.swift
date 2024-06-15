//
//  Institution.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import Foundation
import CoreLocation

struct Institution: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let address: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}

