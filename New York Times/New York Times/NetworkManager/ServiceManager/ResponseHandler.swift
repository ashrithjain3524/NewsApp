//
//  ResponseHandler.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation


protocol ResponseHandlerDelegate {
    func handleResponse<T:Codable>(type:T.Type,data:Data ,completion: @escaping(Result<T,ErrorModel>)->Void)
}

class ResponseHandler:ResponseHandlerDelegate{
    func handleResponse<T:Codable>(type:T.Type,data:Data ,completion: @escaping(Result<T,ErrorModel>)->Void){
        
        let commentResponse = try? JSONDecoder().decode(type.self, from: data)
        if let commentResponse = commentResponse{
            return completion(.success(commentResponse))
        }else{
            return completion(.failure(.DecodingError))
        }
    }
}
