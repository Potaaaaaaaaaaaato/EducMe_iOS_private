//
//  InstitutionsListView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

class userViewModel: ObservableObject {
    @Published var firstName: String = ""

    init() {
        loadUserFirstName()
    }

    func loadUserFirstName() {
        if let savedFirstName = UserDefaults.standard.string(forKey: "firstName") {
            self.firstName = savedFirstName
        } else {
            self.firstName = "Utilisateur"
        }
    }
}

struct InstitutionsListView: View {
    @ObservedObject var userViewModel = UserViewModel()
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text("Hey \(userViewModel.firstName) ! Sur cette page vous trouverez énormement d'informations sur les institutions, et si vous vous posez encore des questions vous pouvez visiter la page FAQ. Cette application est la votre, profitez 😄")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical)
                }
                
                Section(header: Text("Institutions")) {
                    List(SampleData.institutions) { institution in
                        NavigationLink(destination: InstitutionDetailView(institution: institution)) {
                            Text(institution.name)
                        }
                    }
                }
            }
            .navigationTitle("🏛️ - Institutions")
        }
    }
}

struct InstitutionsListView_Previews: PreviewProvider {
    static var previews: some View {
        InstitutionsListView()
    }
}








