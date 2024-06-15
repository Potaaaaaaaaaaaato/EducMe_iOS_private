//
//  MainView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct MainView: View {
    @State private var isRegistered: Bool = UserDefaults.standard.bool(forKey: "isRegistered")
    
    var body: some View {
        if isRegistered {
            TabView {
                InstitutionsListView()
                    .tabItem {
                        Image(systemName: "building.2")
                        Text("Institutions")
                    }
                HistoireListView()
                    .tabItem {
                        Image(systemName: "book")
                        Text("Histoire")
                    }
                PartiesListView()
                    .tabItem {
                        Image(systemName: "person.3")
                        Text("Partis")
                    }
                /*RechercheView()  // Ajout de la vue de recherche
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Recherche")
                    }*/
                
                FAQListView()
                    .tabItem {
                        Image(systemName: "questionmark.circle")
                        Text("FAQ")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Paramètres")
                    }
            }
        } else {
            RegistrationView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



