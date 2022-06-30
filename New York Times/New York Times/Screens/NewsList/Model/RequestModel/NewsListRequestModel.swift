//
//  NewsListRequestModel.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

class NewsListRequestModel:RequestModel{
    var day:Constant.PeriodsAllowed
    
     init(day:Constant.PeriodsAllowed) {
         self.day = day
     }
     override var path: String{
        return Constant.API.popularNews(days: day).getRawValue()
     }
}
