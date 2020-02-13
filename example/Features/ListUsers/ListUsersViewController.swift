//
//  ListUsersViewController.swift
//  example
//
//  Created by Alejandro  Rodriguez on 2/13/20.
//  Copyright © 2020 Alejandro Rodriguez. All rights reserved.
//

import UIKit
protocol ListUsersVCLogic {
    func dataOK()
    func dataError()
    func dataEmpty()
}

class ListUsersViewController: UIViewController {
    var presenter: ListUserPresenter!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.callList()
        
        setup()
    }
    
    func setup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}
extension ListUsersViewController: ListUsersVCLogic {
    func dataOK() {
        let list = self.presenter.dataSource.list
        tableView.reloadData()
        print(list)
    }
    
    func dataError() {
        print("error")
    }
    
    func dataEmpty() {
        print("empty")
    }
}

extension ListUsersViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.dataSource.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let userEntity = self.presenter.dataSource.list[indexPath.row]
        
        cell.textLabel?.text = userEntity.fullName()
        
        return cell
    }
    
    
}
