//
//  BaseViewModel.swift
//  New York Times
//
//  Created by Ashrith Jain on 29/06/22.
//

import Foundation

class BaseViewModel: NSObject {
    var showActivity = Bindable.init(false)
    var reloadTable = Bindable.init(false)
    var showErrorPopUp = Bindable.init("")
    
}
