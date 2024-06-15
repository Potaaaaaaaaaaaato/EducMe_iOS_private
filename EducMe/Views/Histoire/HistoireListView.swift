//
//  HistoireListView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var firstName: String = ""

    init() {
        loadUserFirstName()
    }

    func loadUserFirstName() {
        // Simuler la récupération du prénom à partir de UserDefaults
        if let savedFirstName = UserDefaults.standard.string(forKey: "firstName") {
            self.firstName = savedFirstName
        } else {
            self.firstName = "Utilisateur" // Valeur par défaut si pas de nom enregistré
        }
    }
}

struct HistoireListView: View {
    @ObservedObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text("Hey \(userViewModel.firstName) ! Bienvenue dans la section Histoire. Ici, vous pouvez explorer divers récits historiques pour mieux comprendre notre passé. Profitez de cette plongée dans l'histoire !")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical)
                }
                
                Section(header: Text("Frise chronologique (test - pas terminé)")) {
                    TimelineView(histoires: SampleData.histoires)
                        .frame(height: 150) // Ajuster la hauteur pour la frise
                }

                Section(header: Text("Évènements historiques")) {
                    List(SampleData.histoires) { histoire in
                        NavigationLink(destination: HistoireDetailView(histoire: histoire)) {
                            Text(histoire.title)
                        }
                    }
                }
            }
            .navigationTitle("👑 - Histoire")
        }
    }
}

struct HistoireListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoireListView()
    }
}





