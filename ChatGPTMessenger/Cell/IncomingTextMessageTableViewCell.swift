//
//  IncomingTextMessageTableViewCell.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 11/05/23.
//

import UIKit

class IncomingTextMessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contactMessageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    public func setupCell(data: Message) {
        contactMessageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        messageLabel.text = data.message
    }

}
