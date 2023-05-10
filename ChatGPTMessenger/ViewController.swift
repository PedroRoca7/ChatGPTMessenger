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
    
    override func viewWillAppear(_ animated: Bool) {
        messageBarView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor).isActive = true
        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        messageTextField.resignFirstResponder()
    }
    


}

