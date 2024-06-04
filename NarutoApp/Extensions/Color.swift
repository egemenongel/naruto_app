//
//  Color.swift
//  NarutoApp
//
//  Created by Egemen Öngel on 24.05.2024.
//

import Foundation
import SwiftUI

extension Color {
   static var theme = AppTheme()
}

struct AppTheme{
    let backgroundColor = Color("BackgroundColor")
    let accentColor = Color("AccentColor")
    let textColor = Color("TextColor")
    let secondaryTextColor = Color("SecondaryTextColor")
}
