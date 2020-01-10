//
//  HostingController.swift
//  CalculatorSwiftUI
//
//  Created by De La Cruz, Eduardo on 10/01/2020.
//  Copyright © 2020 De La Cruz, Eduardo. All rights reserved.
//

import SwiftUI

class HostingController: UIHostingController<CalculatorView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
