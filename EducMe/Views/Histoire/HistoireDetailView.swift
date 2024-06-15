//
//  HistoireDetailView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct HistoireDetailView: View {
    let histoire: Histoire

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(histoire.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Description")
                            .fontWeight(.semibold)
                        Text(histoire.description)
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
                        Text("Date")
                            .fontWeight(.semibold)
                        Text(histoire.date)
                            .padding(.top, 2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HistoireDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoireDetailView(histoire: SampleData.histoires[0])
    }
}




