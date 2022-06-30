//
//  NewsListingViewModel.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

class NewsListingViewModel: BaseViewModel {
    let serviceHandler:NewsServiceManagerDelegate
    var responseObject:NewsList?
    var newsList:Bindable<[ArticleResult]>
    
    init(serviceHandler:NewsServiceManagerDelegate = NewsServiceManager()) {
        self.serviceHandler = serviceHandler
        newsList = Bindable.init([])
    }
    
    func fetchPipularNews(days:Constant.PeriodsAllowed) {
        let requestModel = NewsListRequestModel(day: days)
        self.showActivity.value = true
        serviceHandler.fetchPopularNews(requestModel: requestModel) { [weak self] (result) in
            self?.showActivity.value = false
            switch result {
            case .success(let model):
                //print(model.results)
                self?.responseObject = model
                if let articles = model.results{
                    self?.newsList.value = articles
                }
            case .failure(let error):
                
                print(error)
            }
        }
    }
}
