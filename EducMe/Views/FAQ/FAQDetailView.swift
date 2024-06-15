//
//  FAQDetailView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct FAQDetailView: View {
    var faq: FAQ

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(faq.question)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Réponse")
                            .fontWeight(.semibold)
                        Text(faq.answer)
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
        }
        .navigationTitle("Détails de la FAQ")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FAQDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FAQDetailView(faq: SampleData.faqs[0])
    }
}




