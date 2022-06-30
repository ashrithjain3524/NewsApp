//
//  ArticleDetailViewModel.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

class ArticleDetailViewModel: BaseViewModel {
    var article:ArticleResult
    
    init(article:ArticleResult) {
        self.article = article
    }
    
    func getRequestFromUrl(url:String) -> URLRequest?{
        let myURL = URL(string: url)
        guard let myUrl = myURL else {
            return nil
        }
        return URLRequest(url: myUrl)
    }
}
