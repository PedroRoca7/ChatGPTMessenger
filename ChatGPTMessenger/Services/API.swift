//
//  API.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 10/05/23.
//

import Foundation
import OpenAISwift

enum OpenAIError: Error {
    case missingChoiseText
    case apiError(Error)
}

class API {
    
    static let authToken: String = "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"
    var openAIModelType: OpenAIModelType = .gpt3(.davinci)
    var token: OpenAISwift = OpenAISwift(authToken: authToken)
    
    
    func sendOpenAIRequest(text: String, completion: @escaping (Result<String, OpenAIError>) -> Void) {
        token.sendCompletion(with: text,model: openAIModelType, maxTokens: 4000, completionHandler: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    guard let text = model.choices?.first?.text else {
                        completion(.failure(.missingChoiseText))
                        return
                    }
                    completion(.success(text))
                case .failure(let error):
                    completion(.failure(.apiError(error)))
                }
            }
        })
    }
    
}
