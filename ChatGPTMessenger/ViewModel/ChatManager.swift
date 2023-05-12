//
//  ChatManager.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 10/05/23.
//

import Foundation
import AVFoundation

class ChatManager {
    
    let api = API()
    var player: AVAudioPlayer?
    
    // Método que faz a chamada da API.
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
    
}
