//
//  Extensions.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 11/05/23.
//

import Foundation
import UIKit

// Extensão para animação do botão quando pressionado.
extension UIButton {
    func touchAnimation() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.transform = CGAffineTransform(scaleX: 0.80, y: 0.80)
        } completion: { finish in UIButton.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.transform = .identity
        }
            
        }
    }
}

// Extensão para configurar a tableView.
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return responseChat.messageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = responseChat.loadCurrentMessage(indexPath: indexPath)
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
