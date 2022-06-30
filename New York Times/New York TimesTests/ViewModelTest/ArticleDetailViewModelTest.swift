//
//  ArticleDetailViewModelTest.swift
//  New York TimesTests
//
//  Created by Ashrith Jain on 30/06/22.
//

import XCTest
@testable import New_York_Times

class ArticleDetailViewModelTest: XCTestCase {

    func test_UrlRequest_Failure() {
        let viewModel = ArticleDetailViewModel(article: ArticleResult())
        let request = viewModel.getRequestFromUrl(url: "xyz")
        XCTAssert(request == nil)
    }
    
    func test_UrlRequest_Success() {
        let viewModel = ArticleDetailViewModel(article: ArticleResult())
        let request = viewModel.getRequestFromUrl(url: Constant.BaseUrl)
        XCTAssert(request != nil)
    }

}
