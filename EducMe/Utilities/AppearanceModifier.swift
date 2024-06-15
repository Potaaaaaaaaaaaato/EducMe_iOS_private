//
//  AppearanceModifier.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 24/05/2024.
//

import SwiftUI

struct BackgroundColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color(hex: "#F3D99A"))
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(hex: "#CE9CE9"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .shadow(color: Color(hex: "#CE9CE9").opacity(0.5), radius: 5, x: 0, y: 2)
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let red = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let green = Double((rgbValue & 0xff00) >> 8) / 255.0
        let blue = Double(rgbValue & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

