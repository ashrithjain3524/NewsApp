//
//  NewsList.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

class NewsList: Codable {
    
    var status:String?
    var copyright:String?
    var num_results:Int?
    var results:[ArticleResult]?
    
}

class ArticleResult:Codable{
    var url:String?
    var adx_keywords:String?
    var column:String?
    var section:String?
    var byline:String?
    var type:String?
    var title:String?
    var abstract:String?
    var published_date:String?
    var source:String?
    var id:Int?
    var asset_id:Int?
    var media :[Media]?
}

class Media: Codable {
    var type:String?
    var subtype:String?
    var caption:String?
    var copyright:String?
    var metadata:[MediaMetaData]?
    private enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case metadata = "media-metadata"
    }
}

class MediaMetaData: Codable {
    var url:String?
    var format:String?
    var height:Int?
    var width:Int?
}
