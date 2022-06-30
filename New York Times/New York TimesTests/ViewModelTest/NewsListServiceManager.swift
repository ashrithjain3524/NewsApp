//
//  NewsListServiceManager.swift
//  New York TimesTests
//
//  Created by Ashrith Jain on 30/06/22.
//

import Foundation
@testable import New_York_Times

class NewsListServiceManager: NewsServiceManagerDelegate{
    var value : Result<NewsList, ErrorModel> = .failure(.Nodata)
    func fetchPopularNews(requestModel: NewsListRequestModel, completion: @escaping (Result<NewsList, ErrorModel>) -> Void) {
        completion(value)
    }
    
    
}
