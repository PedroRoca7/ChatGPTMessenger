//
//  TableViewController.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 11/05/23.
//

import UIKit

class TableViewController: UITableViewController {
    
    var chat = ChatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chat.numberOfRowsInSection
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = chat.loadCurrentMessage(indexPath: indexPath)
        
        switch message.typeMessage {
        case .user:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "OutgoingTextMessageTableViewCell", for: indexPath) as? OutgoingTextMessageTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
            
        case .chatGPT:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IncomingTextMessageTableViewCell", for: indexPath) as? IncomingTextMessageTableViewCell
            cell?.setupCell(data: message)
            return cell ?? UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return chat.heightForRow(indexPath: indexPath)
    }
    
}
