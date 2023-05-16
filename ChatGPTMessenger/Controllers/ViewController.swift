//
//  ViewController.swift
//  ChatGPTMessenger
//
//  Created by Pedro Henrique on 09/05/23.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var messageBarView: UIView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputMessageView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    var responseChat = ChatManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTextField.delegate = self
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Inverte a tableView para que as mensagens apareçam na parte inferior da tableView
        //tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        
        // Registrar observadores para notificações de teclado
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Registra observador para verificar se o UITextField foi alterado
        messageTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        
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
        messageSend()
    }
    // Método chamado quando o botão enviar do Keyboard é pressionado.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            messageSend()
            return true
        } else {
            return false
        }
    }
    // Método que verifica se UITextField está vazio ou não.
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text, !text.isEmpty {
            sendButton.isEnabled = true
            sendButton.backgroundColor = .green
        } else {
            sendButton.isEnabled = false
            sendButton.backgroundColor = .darkGray
        }
    }
    private func messageSend() {
        guard let text = messageTextField.text else { return }
        responseChat.messageList.append(Message.init(message: text,typeMessage: .user))
        tableView.reloadData()
        responseChat.playsound()
        sendButton.touchAnimation()
        messageTextField.resignFirstResponder()
        messageTextField.text = ""
        sendButton.backgroundColor = .darkGray
        responseChat.requestChat(text: text)
    }
}


