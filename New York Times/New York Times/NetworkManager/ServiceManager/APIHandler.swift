//
//  APIHandler.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

protocol APIHandlerDelegate {
    func fetchData(url:URLRequest,completion: @escaping(Result<Data,ErrorModel>)->Void)
}

class APIHandler:APIHandlerDelegate {
    func fetchData(url:URLRequest,completion: @escaping(Result<Data,ErrorModel>)->Void){
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            guard let data = data,error == nil else{
                return completion(.failure(.Nodata))
            }
            completion(.success(data))
        }.resume()
    }
}
