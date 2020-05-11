//
//  CalculationLocalizationViewModel.swift
//  IKOL_Test_Terekhov
//
//  Created by Vitalii Terekhov on 11/05/2020.
//  Copyright © 2020 Vitalii. All rights reserved.
//

import Foundation

class CalculationLocalizationViewModel {
    
    var localizationDictionary: NSDictionary!
    
    init(latitude: Double, longitude: Double) {
        localizationDictionary = LocalizationInfo(latitude: latitude, longitude: longitude).getInfo()
    }
    
    func getDisplayName () -> String! {
        return localizationDictionary["display_name"] as? String ?? "No localization"
    }
}
