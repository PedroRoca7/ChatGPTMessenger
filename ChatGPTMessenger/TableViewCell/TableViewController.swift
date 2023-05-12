//
//  TableViewController.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 11/05/23.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OutgoingTextMessageTableViewCell", for: indexPath)
            // Configurar a célula "OutgoingTextMessageTableViewCell"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IncomingTextMessageTableViewCell", for: indexPath)
            // Configurar a célula "IncomingTextMessageTableViewCell"
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
}
