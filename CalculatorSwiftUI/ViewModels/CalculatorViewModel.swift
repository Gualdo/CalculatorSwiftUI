//
//  CalculatorViewModel.swift
//  CalculatorSwiftUI
//
//  Created by De La Cruz, Eduardo on 10/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    
    @Published var display = CalculatorViewModel.defaultDisplay
    @Published var pressedOperator = ""
    
    static let defaultDisplay = "0"    
    
    var firstExpression = ""
    var secondExpression = ""
    
    func receiveButtonPress(button: CalculatorButton) {
        if button.title == "AC" {
            display = CalculatorViewModel.defaultDisplay
            firstExpression = ""
            secondExpression = ""
            pressedOperator = ""
            return
        }
        
        if button.title == "±" {
            let first = Int(display) ?? 0
            display = "\(first * -1)"
            return
        }
        
        if button.title == "%" {
            let first = Double(display) ?? 0
            let result = first / 100
            display = result.toString
            return
        }
        
        if button.title == "+" || button.title == "x" || button.title == "-" || button.title == "÷" {
            pressedOperator = button.title
            return
        }
        
        if button.title == "=" {
            let first = Double(firstExpression) ?? 0
            let second = Double(display) ?? 0
            
            if pressedOperator == "+" {
                display = (first + second).toString
            } else if pressedOperator == "-" {
                display = (first - second).toString
            } else if pressedOperator == "x" {
                display = (first * second).toString
            } else if pressedOperator == "÷" {
                display = (first / second).toString
            }
            
            firstExpression = display
            secondExpression = ""
            pressedOperator = ""
            return
        }
        
        if pressedOperator.isEmpty {
            if display == CalculatorViewModel.defaultDisplay {
                display = button.title
            } else {
                display += button.title
            }
            firstExpression = display
        } else {
            if secondExpression.isEmpty {
                display = button.title
            } else {
                display += button.title
            }
            secondExpression = display
        }
    }
}
