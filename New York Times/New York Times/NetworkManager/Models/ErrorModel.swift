//
//  ErrorModel.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

enum ErrorModel:Error {
    case BadUrl
    case Nodata
    case DecodingError
}
