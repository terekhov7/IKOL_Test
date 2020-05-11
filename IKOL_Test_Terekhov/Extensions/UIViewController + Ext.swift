//
//  UIViewController + Ext.swift
//  IKOL_Test_Terekhov
//
//  Created by Vitalii Terekhov on 11/05/2020.
//  Copyright © 2020 Vitalii. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
