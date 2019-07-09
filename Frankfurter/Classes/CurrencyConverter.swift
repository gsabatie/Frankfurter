//
//  CurrencyConverter.swift
//  Frankfurter
//
//  Created by guillaume sabatié on 08/07/2019.
//

import Foundation

struct CurrencyConverter {
    /// Float base amount used to convert
    var amount: Float
    
    /// String currency used by the amount
    var base: String
    
    /// Date of the publication of the rate
    var date: Date
    
    /// Array of Rate value of the currencies based on the amout
    var rates: [String: Float]
}


extension CurrencyConverter: Decodable {
    enum keys: String, CodingKey {
        case amout = "amount"
        case base = "base"
        case date = "date"
        case rates = "rates"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        let amount = try container.decode(Float.self, forKey: .amout)
        let base = try container.decode(String.self, forKey: .base)
        let date = try container.decode(Date.self, forKey: .date)
        let rateAsDictionary = try container.decode([String: Float].self, forKey: keys.rates)
        
        self.init(amount: amount, base: base, date: date, rates: rateAsDictionary)
        
    }
    
}
