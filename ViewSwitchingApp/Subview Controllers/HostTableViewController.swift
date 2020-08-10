//
//  HostTableViewController.swift
//  ViewSwitchingApp
//
//  Created by Chase Allen on 8/6/20.
//  Copyright © 2020 Chase Allen. All rights reserved.
//

import UIKit

protocol HostTableViewControllerDelegate: class {
    func tableViewRowSelected(withText text: String)
}

/**
 View Controller used as host view for all sub view controllers.
 */
class HostTableViewController: UITableViewController {
    
    internal let cellIdentifier = "cell"
    weak var hostDelegate: HostTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
