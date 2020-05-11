//
//  ViewController.swift
//  IKOL_Test_Terekhov
//
//  Created by Vitalii Terekhov on 07/05/2020.
//  Copyright © 2020 Vitalii. All rights reserved.
//

import UIKit
import  CoreLocation
class CalculationViewController: UIViewController {
    
    @IBOutlet weak var firstLongitudeTextField: UITextField!
    @IBOutlet weak var firstLatitudeTextField: UITextField!
    @IBOutlet weak var firstLocalizationLabel: UILabel!
    
    @IBOutlet weak var secondLongitudeTextField: UITextField!
    @IBOutlet weak var secondLatitudeTextField: UITextField!
    @IBOutlet weak var secondLocalizationLabel: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var distanceKmLabel: UILabel!
    @IBOutlet weak var distanceMLabel: UILabel!

    @IBOutlet weak var dataStackView: UIStackView!
    override func viewDidLoad() {
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        calculateButton.layer.cornerRadius = calculateButton.frame.height * 0.5
    }
    
    
    
    @IBAction func calculateDistance (_ sender: UIButton) {
        
        if firstLatitudeTextField.hasText && firstLongitudeTextField.hasText && secondLatitudeTextField.hasText && secondLongitudeTextField.hasText {
            

            let formatter = NumberFormatter()
            formatter.decimalSeparator = ","
            
            let firstLatitude = formatter.number(from:firstLatitudeTextField.text!)?.doubleValue ?? Double(firstLatitudeTextField.text!)
            let firstLongitude = formatter.number(from:firstLongitudeTextField.text!)?.doubleValue ?? Double(firstLongitudeTextField.text!)
            let secondLatitude = formatter.number(from:secondLatitudeTextField.text!)?.doubleValue ?? Double(secondLatitudeTextField.text!)
            let secondLongitude = formatter.number(from:secondLongitudeTextField.text!)?.doubleValue ?? Double(secondLongitudeTextField.text!)
            
            if let firstLatitude = firstLatitude, let firstLongitude = firstLongitude, let secondLatitude = secondLatitude, let secondLongitude = secondLongitude {
            
                
                let firstPoint = CLLocation(latitude: firstLatitude, longitude: firstLongitude)
                let secondPoint = CLLocation(latitude: secondLatitude, longitude: secondLongitude)
                
                let distance = secondPoint.distance(from: firstPoint)
                
                distanceKmLabel.text = "\(Double(round(10000*distance)/10000))"
                distanceMLabel.text = "\((Double(round(10000*distance)/10000)) * 1000)"

                var firstInfo = ""
                var secondInfo = ""
                
                firstInfo = CalculationLocalizationViewModel(latitude: firstLatitude, longitude: firstLongitude).getDisplayName()
                
                secondInfo = CalculationLocalizationViewModel(latitude: secondLatitude, longitude: secondLongitude).getDisplayName()

                firstLocalizationLabel.text = firstInfo
                secondLocalizationLabel.text = secondInfo

                dataStackView.alpha = 1.0
            } else {
                showMessage(title: "Error", message: "Please check if the data is correct")
            }
            
        } else {
            showMessage(title: "Error", message: "Please fill all the fields")
        }
    }
    
    func showMessage(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        
        show(alertController, sender: nil)
    }
}

