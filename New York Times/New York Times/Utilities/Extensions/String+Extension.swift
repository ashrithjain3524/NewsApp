//
//  String+Extension.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
}
