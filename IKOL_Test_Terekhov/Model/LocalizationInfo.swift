//
//  LocalizationInfo.swift
//  IKOL_Test_Terekhov
//
//  Created by Vitalii Terekhov on 11/05/2020.
//  Copyright © 2020 Vitalii. All rights reserved.
//

import Foundation

class LocalizationInfo {
    
    var localizationDictionary: NSDictionary!
    
    init(latitude: Double, longitude: Double) {
        
        let url = URL(string: "https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=\(latitude)&lon=\(longitude)&accept-language=en")
        
        let group = DispatchGroup()
        group.enter()

        DispatchQueue.global().async {
            
            if let url = url {
                let request = URLRequest(url: url)
                let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    if let data = data {
                        var myData: NSDictionary!
                        
                        do{
                            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                            
                            myData = jsonResult
                            self.localizationDictionary = myData
                            group.leave()
                        } catch {
                            print(error)
                        }
                    }
                }
                task.resume()
            }
            
            
        }
        group.wait()
    }
    
    func getInfo() -> NSDictionary {
        return localizationDictionary
    }
    
}
