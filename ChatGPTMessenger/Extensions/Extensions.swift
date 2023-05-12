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
