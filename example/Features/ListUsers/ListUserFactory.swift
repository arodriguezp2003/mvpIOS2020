//
//  ListUserFactory.swift
//  example
//
//  Created by Alejandro  Rodriguez on 2/13/20.
//  Copyright © 2020 Alejandro Rodriguez. All rights reserved.
//

import Foundation
import UIKit
class ListUsersFactory {
    func getVC() -> UIViewController {
        let service = ListUserServices()
        let model = ListUsersModel(service)
        let presenter = ListUserPresenter(model)
        let vc = ListUsersViewController()
        
        presenter.view = vc
        vc.presenter = presenter
        
        return vc
    }
}
