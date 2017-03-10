//
//  CalculatorModel.swift
//  tipCalculator
//
//  Created by etudiant-06 on 06/03/2017.
//  Copyright © 2017 mehdi. All rights reserved.
//

import Foundation

struct CalculatorModel {
    
    //MARK: - VARIABLES & CONSTANTES

    var checkAmount = 0.0
    var serviceLevel = 1
    let tipRates = [0.1, 0.15, 0.2]
    let tipLabel = ["Fair", "Good", "Excellent"]
    var conversionRate = 1.05867
    
    var computedTip: Double {
        return checkAmount * tipRates[serviceLevel]
    }
    var serviceLabelText: String {
        return tipLabel[serviceLevel]
    }
}
