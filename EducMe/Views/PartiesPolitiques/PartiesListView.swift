//
//  PartiesListView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct PartiesListView: View {
    @ObservedObject var userViewModel = UserViewModel()
    @ObservedObject var userSettings = UserSettings() // Observer les paramètres de l'utilisateur
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text("Hey \(userViewModel.firstName) ! Bienvenue dans la section partis politiques. Ici, vous pouvez découvrir les différents partis politiques, leurs idéologies et leurs leaders.")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("Il est également important de noter que cette liste n'est pas exhaustive et qu'il existe de nombreux autres petits partis politiques en France. EducMe se veut le plus neutre politiquement possible, toute idéologie référencée dans cette partie de l'application est le fruit de nombreuses recherches et croisement de sources. Prenez le temps d'explorer et de mieux comprendre la diversité politique.")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical)
                }

                Section(header: Text("Partis politiques")) {
                    List(sortedParties) { partie in
                        NavigationLink(destination: PartiesDetailView(partie: partie)) {
                            Text(partie.name)
                        }
                    }
                }
            }
            .navigationTitle("🗣️ - Partis politiques")
        }
    }
    
    // Fonction de tri des partis politiques
    var sortedParties: [PartiePolitique] {
        if userSettings.sortPartiesAlphabetically {
            return SampleData.partiesPolitiques.sorted(by: { $0.name < $1.name })
        } else {
            return SampleData.partiesPolitiques
        }
    }
}

struct PartiesListView_Previews: PreviewProvider {
    static var previews: some View {
        PartiesListView()
    }
}








