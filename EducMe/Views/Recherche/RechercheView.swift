//
//  RechercheView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct RechercheView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [SearchResult] = []

    var body: some View {
        NavigationView {
            VStack {
                TextField("Rechercher", text: $searchText, onCommit: {
                    search()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

                List(searchResults) { result in
                    NavigationLink(destination: result.destinationView) {
                        Text(result.title)
                    }
                }
            }
            .navigationTitle("Recherche")
        }
    }

    private func search() {
        let keyword = searchText.lowercased()
        searchResults = SampleData.institutions
            .filter { $0.name.lowercased().contains(keyword) || $0.description.lowercased().contains(keyword) }
            .map { institution in
                SearchResult(
                    title: institution.name,
                    destinationView: AnyView(InstitutionDetailView(institution: institution))
                )
            }
    }
}

struct SearchResult: Identifiable {
    let id = UUID()
    let title: String
    let destinationView: AnyView
}
