//
//  InstitutionsDetailView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct InstitutionDetailView: View {
    let institution: Institution

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(institution.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(nil) // Permet au texte de s'afficher sur plusieurs lignes
                    .multilineTextAlignment(.leading) // Aligne le texte à gauche

                HStack {
                    VStack(alignment: .leading) {
                        Text("Description")
                            .fontWeight(.semibold)
                        Text(institution.description)
                            .padding(.top, 2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

                HStack {
                    VStack(alignment: .leading) {
                        Text("Adresse")
                            .fontWeight(.semibold)
                        Text("Cette institution se situe à l'adresse suivante : \(institution.address)")
                            .padding(.top, 2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)

                HStack {
                    VStack(alignment: .leading) {
                        Text("Localisation sur Apple Plans")
                            .fontWeight(.semibold)
                        Text("Où se situe cette institution sur une carte ? Voyons ça ensemble 🧐")
                            .padding(.top, 2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                InstitutionMapView(institution: institution)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InstitutionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        InstitutionDetailView(institution: SampleData.institutions[0])
    }
}






