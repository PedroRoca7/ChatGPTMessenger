//
//  ChatManager.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 10/05/23.
//

import Foundation

class ChatManager {
    
    let api = API()
    
    
    
    func requestChat(text: String) {
        api.sendOpenAIRequest(text: text) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
}
