//
//  NewsListRequestModelTest.swift
//  New York TimesTests
//
//  Created by Ashrith Jain on 30/06/22.
//

import XCTest
@testable import New_York_Times

class NewsListRequestModelTest: XCTestCase {

    var requestHandler = NewsListRequestModel(day: .one)
    
    func test_Request_NumberOfDays_success(){
        XCTAssert(requestHandler.day == .one)
    }
    
    func test_Request_NumberOfDays_failure(){
        XCTAssert(requestHandler.day.rawValue != 2)
    }
    
    func test_Request_TypeisGetter_success(){
        XCTAssert(requestHandler.method == .get)
    }
    
    func test_Request_ContainsHeader_Success(){
        XCTAssert(requestHandler.headers.count > 0)
    }

    func test_Request_APIEndpoint_Success(){
        XCTAssert(requestHandler.path == Constant.API.popularNews(days: .one).getRawValue())
    }
    
}
