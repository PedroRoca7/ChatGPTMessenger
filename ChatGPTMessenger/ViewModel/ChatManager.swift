//
//  ChatManager.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 10/05/23.
//

import Foundation
import AVFoundation
import UIKit
import CoreGraphics

class ChatManager {
    
    let api = API()
    var player: AVAudioPlayer?
    var messageList: [Message] = []
    
    // Método que faz a chamada da API.
    func requestChat(text: String, completionHandler: @escaping (Bool) -> Void) {
        api.sendOpenAIRequest(text: text) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.addMessage(message: success, type: .chatGPT)
                completionHandler(true)
                print(success)
            case .failure(let failure):
                completionHandler(false)
                print(failure.localizedDescription)
            }
        }
    }
    // Método que faz emitir o som.
    func playsound() {
        guard let url = Bundle.main.url(forResource: "send", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            self.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = self.player else { return }
            player.play()
        } catch let error {
            print("Erro ao tocar o som: \(error.localizedDescription)")
        }
    }
    
    public func addMessage(message: String, type: TypeMessage) {
        messageList.insert(Message(message: message.trimmingCharacters(in: .whitespacesAndNewlines), date: Date(), typeMessage: type), at: .zero)
    }
    
    public var numberOfRowsInSection: Int {
        return messageList.count
    }

    public func loadCurrentMessage(indexPath: IndexPath) -> Message {
        return messageList[indexPath.row]
    }
    
    public func heightForRow(indexPath: IndexPath) -> CGFloat {
        
        let message = loadCurrentMessage(indexPath: indexPath).message
        let font = UIFont.systemFont(ofSize: 16)
        let estimateHeight = message.heightWithConstrainsWidth(width: 220, font: font)
        
        return estimateHeight + 65
    }
}
