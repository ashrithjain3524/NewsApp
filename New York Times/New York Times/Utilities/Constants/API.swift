//
//  API.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

// https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=[YOUR_API_KEY]
extension Constant {
    static let BaseUrl: String = "https://api.nytimes.com"
    static let APIKey: String = "2JxNjh0SA9aA3tEIxHjRQ3yTHMIZ6X1r"
    
    enum API{
        case popularNews(days:PeriodsAllowed)
        
        func getRawValue()->String{
            switch self {
            case .popularNews(let noDays):
                var rawValue =  BaseAPI.popularNews.rawValue
                rawValue = rawValue + "/\(noDays.rawValue).json?api-key=\(Constant.APIKey)"
                return rawValue
            }
        }
    }
    
    enum BaseAPI:String{
        case popularNews = "/svc/mostpopular/v2/viewed"
    }
    
    enum PeriodsAllowed:Int {
        case one = 1
        case seven = 7
        case thirty = 30
    }
    
}
