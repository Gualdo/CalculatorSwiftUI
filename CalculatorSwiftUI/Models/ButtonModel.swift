//
//  ButtonModel.swift
//  CalculatorSwiftUI
//
//  Created by De La Cruz, Eduardo on 10/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

struct CalculatorButton: Identifiable, Hashable {
    let id = UUID()
    let title: String
    var color: Color = Color(.darkGray)
    var foregroundColor: Color = .white
    
    func width(_ screenWidth: CGFloat, _ spacing: CGFloat) -> CGFloat {
        if self.title == "0" {
            return (screenWidth - (spacing * 4)) / 2
        }
        return (screenWidth - (spacing * 5)) / 4
    }
    
    func height(_ screenWidth: CGFloat, _ spacing: CGFloat) -> CGFloat {
        return (screenWidth - (spacing * 5)) / 4
    }
}
