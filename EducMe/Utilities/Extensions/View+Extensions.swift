//
//  View+Extensions.swift
//  EducMe
//
//  Created by Tristan (créateur et seul propriétaire de cette application) on 23/05/2024.
//

import SwiftUI

extension View {
    func multilineNavigationTitle(_ title: String) -> some View {
        self
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                }
            }
    }
}

