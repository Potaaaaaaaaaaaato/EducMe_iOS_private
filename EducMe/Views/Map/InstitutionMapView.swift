//
//  InstitutionMapView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 25/05/2024.
//

import SwiftUI
import MapKit

struct InstitutionMapView: View {
    var institution: Institution

    @State private var region: MKCoordinateRegion

    init(institution: Institution) {
        self.institution = institution
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: institution.latitude, longitude: institution.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        ))
    }

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [institution]) { institution in
            MapMarker(coordinate: CLLocationCoordinate2D(latitude: institution.latitude, longitude: institution.longitude), tint: .red)
        }
        .frame(height: 300)
        .cornerRadius(10)
        .padding()
    }
}

struct InstitutionMapView_Previews: PreviewProvider {
    static var previews: some View {
        InstitutionMapView(institution: SampleData.institutions[0])
    }
}


