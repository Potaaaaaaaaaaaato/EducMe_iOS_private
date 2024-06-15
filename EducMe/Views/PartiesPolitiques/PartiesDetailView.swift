//
//  PartiesDetailView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct PartiesDetailView: View {
    let partie: PartiePolitique

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(partie.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                HStack {
                    VStack(alignment: .leading) {
                        Text("Leader")
                            .fontWeight(.semibold)
                        Text(partie.leader)
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
                        Text("Date de création")
                            .fontWeight(.semibold)
                        Text(partie.date)
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
                        Text("Position")
                            .fontWeight(.semibold)
                        Text(partie.position)
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
                        Text("Idéologies")
                            .fontWeight(.semibold)
                        Text(partie.ideology)
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
                        Text("Exemples")
                            .fontWeight(.semibold)
                        Text(partie.exemple)
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
                        Text("Histoire du parti")
                            .fontWeight(.semibold)
                        Text("")
                        Text(partie.histoire1)
                        Text("")
                        Text(partie.histoire2)
                        Text("")
                        Text(partie.histoire3)
                            .padding(.top, 2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PartiesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PartiesDetailView(partie: SampleData.partiesPolitiques[0])
    }
}







