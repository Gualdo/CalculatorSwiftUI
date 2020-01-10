//
//  CalculatorButtonsRow.swift
//  CalculatorSwiftUI
//
//  Created by De La Cruz, Eduardo on 08/01/2020.
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

struct CalculatorView: View {
    let buttons: [[CalculatorButton]] = [
        [
            .init(title: "AC", color: Color(.lightGray), foregroundColor: .black),
            .init(title: "±", color: Color(.lightGray), foregroundColor: .black),
            .init(title: "%", color: Color(.lightGray), foregroundColor: .black),
            .init(title: "÷", color: Color.orange)
        ],
        [
            .init(title: "7"),
            .init(title: "8"),
            .init(title: "9"),
            .init(title: "x", color: Color.orange)
        ],
        [
            .init(title: "4"),
            .init(title: "5"),
            .init(title: "6"),
            .init(title: "-", color: Color.orange)
        ],
        [
            .init(title: "1"),
            .init(title: "2"),
            .init(title: "3"),
            .init(title: "+", color: Color.orange)
        ],
        [
            .init(title: "0"),
            .init(title: ","),
            .init(title: "=", color: Color.orange)
        ]
    ]
    let spacing: CGFloat = 12
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(spacing: self.spacing) {
                    Spacer()
                    ForEach(self.buttons, id: \.self) { row in
                        CalculatorButtonsRow(screenWidth: geometry.size.width, spacing: self.spacing, buttons: row)
                    }
                }
            }
        }
    }
}

struct CalculatorButtonsRow: View {
    
    let screenWidth: CGFloat
    let spacing: CGFloat
    let buttons: [CalculatorButton]
    
    var body: some View {
        HStack(spacing: self.spacing) {
            ForEach(self.buttons) { button in
                Button(action: {
                    print(button.title)
                }) {
                    Text(button.title)
                        .font(.system(size: 28))
                        .foregroundColor(button.foregroundColor)
                        .frame(width: button.width(self.screenWidth, self.spacing), height: button.height(self.screenWidth, self.spacing))
                        .background(button.color)
                        .cornerRadius(button.width(self.screenWidth, self.spacing))
                }
            }
        }
    }
}

struct CalculatorButtonsRow_Previews: PreviewProvider {
    static var previews: some View {        
        CalculatorButtonsRow(screenWidth: UIScreen.main.bounds.width, spacing: 12, buttons: [
            .init(title: "AC", color: Color(.lightGray)),
            .init(title: "±", color: Color(.lightGray)),
            .init(title: "%", color: Color(.lightGray)),
            .init(title: "÷", color: Color.orange)
        ])
    }
}
