//
//  ResponseHandlerService.swift
//  New York TimesTests
//
//  Created by Ashrith Jain on 30/06/22.
//

import XCTest
@testable import New_York_Times

class ResponseHandlerService: ResponseHandlerDelegate {
   // var value :Result<T, ErrorModel> = .failure(.Nodata)
    func handleResponse<T>(type: T.Type, data: Data, completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable {
        completion(.failure(.Nodata))
    }
}
