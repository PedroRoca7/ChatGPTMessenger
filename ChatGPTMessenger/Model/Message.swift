//
//  Message.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 15/05/23.
//

import Foundation

enum TypeMessage {
    case user
    case chatGPT
}

struct Message {
    var message: String
    var typeMessage: TypeMessage
}
