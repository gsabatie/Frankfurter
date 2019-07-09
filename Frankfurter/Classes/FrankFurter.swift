//
//  FrankFurter.swift
//  Frankfurter
//
//  Created by guillaume sabatié on 08/07/2019.
//

import Foundation
import Alamofire



public struct FrankFurter {
    
    public func latest(from currency: String?, to currencies: [String]?) {
       Alamofire.request("https://frankfurter.app/latest")
                .responseJSON { (response: DataResponse<Any>) in
                    switch response.result {
                    case .success:
                       print( response.result.value)

                    case .failure(let error):
                        print(error)
//
                    }

        }
       
    }
    
    func historical() {
        
    }
    
    func timeSeries() {
        
    }
    
    func currencies() {
        
    }
    
    func convert() {
        
    }
    public init() {
        
    }
}
