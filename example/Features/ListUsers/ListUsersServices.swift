//
//  ListUsersServices.swift
//  example
//
//  Created by Alejandro  Rodriguez on 2/13/20.
//  Copyright © 2020 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import Alamofire

protocol ListUserServicesLogic {
     func callListUserRes(callback: @escaping (ListUserRequest?) -> Void)
}

class ListUserServices: ListUserServicesLogic  {
    
    func callListUserRes(callback: @escaping (ListUserRequest?) -> Void) {
        
        let uri = URL(string: ListUserConfig.api)
        guard let url = uri else {
            return callback(nil)
        }

        AF.request(url).response { response in
            guard let data = response.data else {
                callback(nil)
                return
            }
            do {
                callback(try JSONDecoder().decode(ListUserRequest.self, from: data))
            }catch( let error ) {
                print(error)
                callback(nil)
            }
        }
    }
}


