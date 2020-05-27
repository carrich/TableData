//
//  EditViewController.swift
//  table3
//
//  Created by Ngoduc on 5/27/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var phoneInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = ViewController()
        
        
        nameInput.text = vc.name
        phoneInput.text = vc.name
        
       
    }


    @IBAction func saveEdit(_ sender: Any) {
    }
    
}
