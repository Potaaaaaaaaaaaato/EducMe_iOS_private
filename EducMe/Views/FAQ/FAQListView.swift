//
//  FAQListView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct FAQListView: View {
    @ObservedObject var userViewModel = UserViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text("Hey \(userViewModel.firstName) ! Bienvenue dans la section FAQ. Ici, vous pouvez trouver des réponses aux questions les plus fréquentes. Si vous ne trouvez pas ce que vous cherchez, n'hésitez pas à me contacter.")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical)
                }
                
                Section(header: Text("Foire aux questions")) {
                    List(SampleData.faqs) { faq in
                        NavigationLink(destination: FAQDetailView(faq: faq)) {
                            Text(faq.question)
                        }
                    }
                }
            }
            .navigationTitle("🙋🏼‍♂️ - FAQ")
        }
    }
}

struct FAQListView_Previews: PreviewProvider {
    static var previews: some View {
        FAQListView()
    }
}



