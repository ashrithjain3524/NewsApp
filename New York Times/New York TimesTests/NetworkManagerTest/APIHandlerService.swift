//
//  APIHandlerService.swift
//  New York TimesTests
//
//  Created by Ashrith Jain on 30/06/22.
//

import XCTest
@testable import New_York_Times

class APIHandlerService:APIHandlerDelegate{
    var value :Result<Data, ErrorModel> = .failure(.Nodata)
    
    func fetchData(url: URLRequest, completion: @escaping (Result<Data, ErrorModel>) -> Void) {
        completion(value)
    }
}
