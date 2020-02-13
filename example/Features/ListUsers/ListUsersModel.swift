//
//  ListUsersModel.swift
//  example
//
//  Created by Alejandro  Rodriguez on 2/13/20.
//  Copyright © 2020 Alejandro Rodriguez. All rights reserved.
//

import Foundation
enum ListUserState {
    case ok
    case error
    case empty
}
protocol ListUserModelLogic {
     func callListUser(callback: @escaping (ListUserState) -> Void)
}

protocol  ListUserDataSource {
    var list: [UserEntity] { get set }
}

class ListUsersModel: ListUserModelLogic, ListUserDataSource {

    var service: ListUserServicesLogic
    var list: [UserEntity] = []
    
    init(_ service: ListUserServices) {
        self.service = service
    }
    
    
    func callListUser(callback: @escaping (ListUserState) -> Void) {
        service.callListUserRes { request in
            guard let req = request else {
                return callback(.error)
            }
            
            if req.data.isEmpty {
                return callback(.empty)
            }

            self.list = req.data
            return callback(.ok)
        }
    }
}
