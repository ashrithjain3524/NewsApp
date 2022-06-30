//
//  NewsServiceManager.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation


protocol NewsServiceManagerDelegate {
    func fetchPopularNews(requestModel:NewsListRequestModel,completion:@escaping (Result<NewsList,ErrorModel>)->Void)
}

class NewsServiceManager:NewsServiceManagerDelegate{
    
    func fetchPopularNews(requestModel:NewsListRequestModel,completion:@escaping (Result<NewsList,ErrorModel>)->Void) {
        let request = requestModel.urlRequest()
        NetworkManager().fetchRequest(type: NewsList.self, url: request, completion: completion)
    }
}
