//
//  NewsListResponseHandlerTest.swift
//  New York TimesTests
//
//  Created by Ashrith Jain on 30/06/22.
//

import XCTest
@testable import New_York_Times


class NewsListResponseHandlerTest: XCTestCase {
    
    func test_NewsListResponseEncoding_Success(){
        let data = fetchJsonFrom("NewsListJsonData")
        XCTAssert(data != nil)
    }
    
    func test_HasArticles_Success() {
        let data = fetchJsonFrom("NewsListJsonData")
        if let obj = data?.num_results{
            XCTAssert(obj > 0)
        }else{
            XCTAssert(false)
        }
        
    }
    
    func test_copyRights_Success() {
        let data = fetchJsonFrom("NewsListJsonData")
        if let obj = data?.copyright{
            XCTAssert(obj.count > 0)
        }else{
            XCTAssert(false)
        }
    }
    
    func test_NewsListResponseEncoding_Failure(){
        let data = fetchJsonFrom("NewsList")
        XCTAssert(data == nil)
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
