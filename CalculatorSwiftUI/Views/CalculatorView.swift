//
//  CalculatorView.swift
//  CalculatorSwiftUI
//
//  Created by De La Cruz, Eduardo on 10/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

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
    
    @ObservedObject var calculatorVM = CalculatorViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(spacing: self.spacing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(self.calculatorVM.display)
                            .foregroundColor(.white)
                            .font(.system(size: 72))
                    }.padding(.horizontal, self.spacing)
                    ForEach(self.buttons, id: \.self) { row in
                        CalculatorButtonsRow(screenWidth: geometry.size.width, spacing: self.spacing, buttons: row, pressedOperator: self.calculatorVM.pressedOperator, didTapButton: { calcButton in
                            self.calculatorVM.receiveButtonPress(button: calcButton)
                        })
                    }
                }
            }
        }
    }
}
