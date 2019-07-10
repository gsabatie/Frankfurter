//
//  CurrencyConverter.swift
//  Frankfurter
//
//  Created by guillaume sabatié on 08/07/2019.
//

import Foundation

public struct CurrencyConverter {
    /// Float base amount used to convert
   public var amount: Float
    
    /// String currency used by the amount
    public var base: String
    
    /// Date of the publication of the rate
    public var date: Date
    
    /// Array of Rate value of the currencies based on the amout
    public var rates: [String: Float]
}


extension CurrencyConverter: Decodable {
    enum keys: String, CodingKey {
        case amout = "amount"
        case base = "base"
        case date = "date"
        case rates = "rates"
    }
    
   public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: keys.self)
        let amount = try container.decode(Float.self, forKey: .amout)
        let base = try container.decode(String.self, forKey: .base)
        let displayableDate = try container.decode(String.self, forKey: .date)
    
        let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"
        let date = dateFormater.date(from: displayableDate)!
    
        let rateAsDictionary = try container.decode([String: Float].self, forKey: keys.rates)
        
        self.init(amount: amount, base: base, date: date, rates: rateAsDictionary)
        
    }
    
}
