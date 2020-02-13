//
//  ListUserPresenter.swift
//  example
//
//  Created by Alejandro  Rodriguez on 2/13/20.
//  Copyright © 2020 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import UIKit
class ListUserPresenter {
    
    weak var view: ListUsersViewController?
    
    var model: ListUserModelLogic
    var dataSource: ListUserDataSource
    
    init(_ model: ListUsersModel) {
        self.model = model
        self.dataSource = model
    }
    
    func callList() {
        self.model.callListUser { status in
            switch status {
            case .error:
                self.view?.dataError()
            case .empty:
                self.view?.dataEmpty()
            case .ok:
                self.view?.dataOK()
            }
        }
    }

}
