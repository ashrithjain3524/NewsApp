//
//  NewsListViewModelTest.swift
//  New York TimesTests
//
//  Created by Ashrith Jain on 30/06/22.
//

import XCTest
@testable import New_York_Times

class NewsListViewModelTest: XCTestCase {
    
    func test_FetchNewsList_URLFailure() {
        let serviceHandler = NewsListServiceManager()
        serviceHandler.value = .failure(.BadUrl)
        let viewModel = NewsListingViewModel(serviceHandler: serviceHandler)
        viewModel.serviceHandler.fetchPopularNews(requestModel: NewsListRequestModel(day: .one)) { (response) in
            switch response{
            case .success(_):
                XCTAssert(false)
            case .failure(let error):
                XCTAssert(error == .BadUrl)
            }
        }
        
    }
    
    func test_FetchNewsList_DecodingErrorFailure() {
        let serviceHandler = NewsListServiceManager()
        serviceHandler.value = .failure(.DecodingError)
        let viewModel = NewsListingViewModel(serviceHandler: serviceHandler)
        viewModel.serviceHandler.fetchPopularNews(requestModel: NewsListRequestModel(day: .one)) { (response) in
            switch response{
            case .success(_):
                XCTAssert(false)
            case .failure(let error):
                XCTAssert(error == .DecodingError)
            }
        }
        
    }
    
    func test_FetchNewsList_NodataFailure() {
        let serviceHandler = NewsListServiceManager()
        serviceHandler.value = .failure(.Nodata)
        let viewModel = NewsListingViewModel(serviceHandler: serviceHandler)
        viewModel.serviceHandler.fetchPopularNews(requestModel: NewsListRequestModel(day: .one)) { (response) in
            switch response{
            case .success(_):
                XCTAssert(false)
            case .failure(let error):
                XCTAssert(error == .Nodata)
            }
        }
        
    }
    
    func test_FetchNewsList_Success() {
        let serviceHandler = NewsListServiceManager()
        guard let data = fetchJsonFrom("NewsListJsonData") else {
            XCTAssert(false)
             return
        }
        serviceHandler.value = .success(data)
        let viewModel = NewsListingViewModel(serviceHandler: serviceHandler)
        viewModel.serviceHandler.fetchPopularNews(requestModel: NewsListRequestModel(day: .one)) { (response) in
            switch response{
            case .success(let obj):
                XCTAssert(obj.num_results == data.num_results)
            case .failure(_):
                XCTAssert(false)
            }
        }
        
    }

    func fetchJsonFrom(_ file: String) -> NewsList? {
        let bundle = Bundle(for: type(of: self) as AnyClass)
        if let url = bundle.url(forResource: file, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let commentResponse = try? JSONDecoder().decode(NewsList.self, from: data)
                return commentResponse
            } catch {
                debugPrint(error)
                return  nil
            }
        }
        return nil
    }
}
