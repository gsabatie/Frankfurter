//
//  FrankFurter.swift
//  Frankfurter
//
//  Created by guillaume sabatié on 08/07/2019.
//

import Foundation
import Alamofire

//Discussion  cache the currency converteer to reduce the calls to the API

public struct FrankFurter {
    
    public func latest(from currency: String?,
                       to currencies: [String]?,
                       completion: @escaping (_ converter: CurrencyConverter?, _ error: Error?)->()) {
        Alamofire.request(Router.latest(fromCurrency: nil, toCurrencies: nil))
            .responseJSON { (response: DataResponse<Any>) in
                switch response.result {
                case .success:
                    if let data = response.data {
                        do {
                            let converter = try JSONDecoder().decode(CurrencyConverter.self,
                                                                     from: data)
                            print(converter)
                        } catch let error {
                            completion(nil, error)
                        }
                    }
                case .failure(let error):
                    completion(nil, error)
                }
                
        }
       
    }
    
    func historical() {
         //TO Be implemented
    }
    
    func timeSeries() {
         //TO Be implemented
    }
    
    func currencies() {
        //TO Be implemented
    }
    
    /// Function convert the amount form the given base to a new currency
    ///
    /// - Parameters:
    ///   - amount: Float the amount to convert
    ///   - base: String the currency of the amount i.e EUR
    ///   - currency: String the new base to conver i.e USD
    ///   - completion: Completionblock
    public func convert(amount: Float,
                        base: String,
                        currency:String,
                        completion: @escaping (_ amount:Float?) ->()) {
        self.latest(from: base, to: [currency]) { (cConverter, error) in
            if error != nil {
                completion(nil)
                return
            }
            
            if let currencyConverter = cConverter,
                let usdRate = currencyConverter.rates["USD"] {
                completion(amount * usdRate)
            }
        }
    }
    
    public init() {}
}
