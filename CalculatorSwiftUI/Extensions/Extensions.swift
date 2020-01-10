//
//  Extensions.swift
//  CalculatorSwiftUI
//
//  Created by De La Cruz, Eduardo on 10/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

extension Double {
    var toString: String {
        return floor(self) == self ? "\(Int(self))" : "\(self)".replacingOccurrences(of: ".", with: ",")
    }
}
