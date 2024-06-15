//
//  SettingsView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 22/05/2024.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    @ObservedObject var userSettings = UserSettings()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading) {
                        Text("Hey tout le monde !")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("Un grand merci à chacun d'entre vous de participer à la bêta de mon application ! Votre soutien et vos retours sont super précieux pour moi. Grâce à vous, je vais pouvoir améliorer l'appli et la rendre encore plus géniale.")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("N'hésitez pas à explorer toutes les fonctionnalités et à me faire part de vos impressions, idées ou même des bugs que vous pourriez rencontrer (vous pouvez m'envoyer un mail via le bouton plus bas). Votre aide est vraiment appréciée !")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("Merci encore et amusez-vous bien avec l'appli !")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("")
                            .font(.body)
                            .foregroundColor(.primary)
                        Text("À bientôt, Tristan ❤️")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding(.vertical)
                }

                Section(header: Text("Langue")) {
                    Picker("Langue", selection: $viewModel.selectedLanguage) {
                        ForEach(viewModel.languages, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section(header: Text("Notifications")) {
                    Toggle("Activer les notifications", isOn: $viewModel.notificationsEnabled)
                }
                
                Section(header: Text("Ordre d'affichage des partis politiques")) {
                    Toggle("Trier par ordre alphabétique", isOn: $userSettings.sortPartiesAlphabetically)
                }

                 Section(header: Text("Faire un don")) {
                    Button(action: {
                        if let url = URL(string: "https://donate.stripe.com/3cs014cQNfsG6ju28a") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Faire un don via Stripe")
                    }
                }

                Section(header: Text("Signaler un bug")) {
                    Button(action: {
                        let subject = "EducMe v1.1 - Déclaration d'incident"
                        let body = ""
                        let email = "contact@educme.fr"
                        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        let urlString = "mailto:\(email)?subject=\(encodedSubject)&body=\(encodedBody)"
                        if let url = URL(string: urlString) {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            } else {
                                print("Impossible d'ouvrir l'URL : \(urlString)")
                            }
                        }
                    }) {
                        Text("Signaler un bug par mail")
                    }
                    Button(action: {
                        let subject = "EducMe v1.1 - Suggestion d'idée"
                        let body = ""
                        let email = "contact@educme.fr"
                        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        let urlString = "mailto:\(email)?subject=\(encodedSubject)&body=\(encodedBody)"
                        if let url = URL(string: urlString) {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            } else {
                                print("Impossible d'ouvrir l'URL : \(urlString)")
                            }
                        }
                    }) {
                        Text("Suggérer une idée par mail")
                    }
                }
                
                Section(header: Text("Neutralité politique")) {
                    Button(action: {
                        let subject = "EducMe v1.0 - Déclaration d'incident (neutralité politique non respectée)"
                        let body = ""
                        let email = "contact@educme.fr"
                        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        let encodedBody = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                        let urlString = "mailto:\(email)?subject=\(encodedSubject)&body=\(encodedBody)"
                        if let url = URL(string: urlString) {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            } else {
                                print("Impossible d'ouvrir l'URL : \(urlString)")
                            }
                        }
                    }) {
                        Text("Signaler un problème de neutralité")
                    }
                }
                

                Section(header: Text("Réseaux sociaux")) {
                    Button(action: {
                        if let url = URL(string: "https://x.com/App_EducMe") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Suivez EducMe sur X")
                    }
                    Button(action: {
                        if let url = URL(string: "https://x.com/LepenKenov") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Text("Suivez son créateur sur X (compte pro)")
                    }
                }
                
                Section(header: Text("Remerciements spéciaux")) {
                                    Text("Idée du design général des pages : Iban")
                                    Button(action: {
                                        if let url = URL(string: "https://x.com/Ibatech1") {
                                            UIApplication.shared.open(url)
                                        }
                                    }) {
                                        Text("Suivez Iban sur X")
                                    }
                                }

                Section(header: Text("Déconnexion")) {
                    Button(action: {
                        viewModel.logout()
                    }) {
                        Text("Me déconnecter d'EducMe")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("⚙️ - Paramètres")
            .navigationBarItems(trailing: Text("EducMe v1.1 (bêta)").font(.footnote).foregroundColor(.gray))
        }
        .fullScreenCover(isPresented: $viewModel.isLoggedOut) {
            RegistrationView()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}




