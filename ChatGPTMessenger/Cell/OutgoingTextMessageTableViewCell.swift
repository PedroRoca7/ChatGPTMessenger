//
//  TableViewCell.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 11/05/23.
//

import UIKit

class OutgoingTextMessageTableViewCell: UITableViewCell {

    @IBOutlet weak var myMessageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    public func setupCell(data: Message) {
        myMessageView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        messageLabel.text = data.message
    }
    
}
