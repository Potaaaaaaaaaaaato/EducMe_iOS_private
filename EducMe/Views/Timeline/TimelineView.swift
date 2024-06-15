//
//  TimelineView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 08/06/2024.
//

import SwiftUI

struct TimelineView: View {
    let histoires: [Histoire]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(histoires) { histoire in
                    VStack {
                        Text(histoire.date)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 10, height: 10)
                        Text(histoire.title)
                            .font(.caption)
                            .foregroundColor(.primary)
                            .frame(width: 100, alignment: .center) // Limiter la largeur pour éviter les chevauchements
                            .fixedSize(horizontal: false, vertical: true) // Permettre les textes sur plusieurs lignes
                    }
                }
            }
            .padding()
        }
    }
}

struct TimelineView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineView(histoires: SampleData.histoires)
    }
}



