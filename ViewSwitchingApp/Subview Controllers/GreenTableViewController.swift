//
//  GreenTableViewController.swift
//  ViewSwitchingApp
//
//  Created by Chase Allen on 8/6/20.
//  Copyright © 2020 Chase Allen. All rights reserved.
//

import UIKit

final class GreenTableViewController: HostTableViewController {
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "Green: \(indexPath.row + 1)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        hostDelegate?.tableViewRowSelected(withText: "Green Table selected at indexPath: \(indexPath)")
    }
}
