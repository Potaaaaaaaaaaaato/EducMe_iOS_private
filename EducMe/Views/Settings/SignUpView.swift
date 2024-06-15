//
//  SignUpView.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 24/05/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var dateOfBirth = Date()
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var showError = false
    @State private var errorMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Prénom", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Nom", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                DatePicker("Date de naissance", selection: $dateOfBirth, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Mot de passe", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Confirmez le mot de passe", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if showError {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: signUp) {
                    Text("S'inscrire")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: .blue, radius: 5)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Inscription")
        }
    }
    
    func signUp() {
        guard !firstName.isEmpty else {
            errorMessage = "Le prénom est requis."
            showError = true
            return
        }
        
        guard !lastName.isEmpty else {
            errorMessage = "Le nom est requis."
            showError = true
            return
        }
        
        guard isValidEmail(email) else {
            errorMessage = "L'adresse email n'est pas valide."
            showError = true
            return
        }
        
        guard password == confirmPassword else {
            errorMessage = "Les mots de passe ne correspondent pas."
            showError = true
            return
        }
        
        guard password.count >= 6 else {
            errorMessage = "Le mot de passe doit contenir au moins 6 caractères."
            showError = true
            return
        }
        
        // Save user data and navigate to the main view
        UserDefaults.standard.set(firstName, forKey: "firstName")
        UserDefaults.standard.set(lastName, forKey: "lastName")
        UserDefaults.standard.set(dateOfBirth, forKey: "dateOfBirth")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        
        showError = false
        // Add navigation to main view if necessary
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

