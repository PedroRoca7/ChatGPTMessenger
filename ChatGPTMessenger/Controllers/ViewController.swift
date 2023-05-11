//
//  ViewController.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 09/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageBarView: UIView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputMessageView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inverte a tableView para que as mensagens apareçam na parte inferior da tableView
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        // Registrar observadores para notificações de teclado
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Método chamado quando o teclado está prestes a aparecer
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // Obtenha a altura do teclado
            let keyboardHeight = keyboardSize.height
            
            // Atualize a constante de constraint vertical inferior com a altura do teclado
            bottomConstraint.constant = -keyboardHeight
            
            // Animação da atualização da constraint
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // Método chamado quando o teclado está prestes a desaparecer
    @objc func keyboardWillHide(notification: NSNotification) {
        // Restaure a constante de constraint vertical inferior para o valor original
        bottomConstraint.constant = 0
        
        // Animação da atualização da constraint
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    // Remove os observadores de notificação quando a view controller for destruída
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // Método chamado quando o botão de enviar a mensagem é pressionado.
    @IBAction func sendMessage(_ sender: Any) {
        messageTextField.resignFirstResponder()
    }
    


}

