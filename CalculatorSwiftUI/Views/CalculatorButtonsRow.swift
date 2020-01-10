//
//  CalculatorButtonsRow.swift
//  CalculatorSwiftUI
//
//  Created by De La Cruz, Eduardo on 08/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

struct CalculatorButtonsRow: View {
    
    let screenWidth: CGFloat
    let spacing: CGFloat
    let buttons: [CalculatorButton]
    let pressedOperator: String
    
    var didTapButton: (CalculatorButton) -> ()
    
    var body: some View {
        HStack(spacing: self.spacing) {
            ForEach(self.buttons) { button in
                Button(action: {
                    self.didTapButton(button)
                }) {
                    Text(button.title)
                        .font(.system(size: 28))
                        .foregroundColor(button.title == self.pressedOperator ? button.color : .white)
                        .frame(width: button.width(self.screenWidth, self.spacing), height: button.height(self.screenWidth, self.spacing))
                        .background(button.title == self.pressedOperator ? .white : button.color)
                        .cornerRadius(button.width(self.screenWidth, self.spacing))
                }
            }
        }
    }
}
