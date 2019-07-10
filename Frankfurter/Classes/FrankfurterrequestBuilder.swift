//
//  FrankfurterrequestBuilder.swift
//  Frankfurter
//
//  Created by guillaume sabatié on 08/07/2019.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "https://frankfurter.app"
    
    case latest(fromCurrency:String?, toCurrencies:[String]?)
    //    case historical(date:Date)
    //    case timeSeries(beginDate:Date, endDate:Date?, curency:String?)
    
    func asURLRequest() throws -> URLRequest {
        let result: (path: String, parameters: Parameters) = {
            switch self {
            case let .latest(fromCurrency, toCurrencies):
                var latestRouteParameter = Parameters()
                if let fromCurrency = fromCurrency {
                    latestRouteParameter["from"] =  fromCurrency
                }
                if let toCurrencies = toCurrencies {
                    latestRouteParameter["to"] = toCurrencies
                }
                return ("/latest", latestRouteParameter)
            }
        }()
        
        let url = try Router.baseURLString.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(result.path))
        
        return try URLEncoding.default.encode(urlRequest, with: result.parameters)
    }
}

struct RequestBuilder {
    private var host = "frankfurter.app"
}
