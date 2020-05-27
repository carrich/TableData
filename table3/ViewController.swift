//
//  ViewController.swift
//  table3
//
//  Created by Ngoduc on 5/22/20.
//  Copyright © 2020 Ngoduc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var persons = [Person1]()
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
    }
    func configTable(){
        tableView.register(UINib(nibName: "CustommerTableViewCell", bundle: nil), forCellReuseIdentifier: "CustommerTableViewCell")
        tableView.reloadData()
//        tableView.rowHeight = 100
//        persons = fakeData()
    }
    @objc func addContact(){
        let vc = AddContactViewController()
        vc.passData = { [weak self] data in
            guard let strongSelf = self else { return }
            strongSelf.persons.append(data)
            strongSelf.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustommerTableViewCell", for: indexPath) as! CustommerTableViewCell
        cell.person = persons[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
         let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, completion) in
            self.name = "aaga"
            let vc = EditViewController()
            self.navigationController?.pushViewController(vc, animated: true)
               }
               let delete = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in
                print(self.persons[0])
                self.persons.remove(at: 0)
                self.tableView.reloadData()
                      }
               
               edit.backgroundColor = .blue
               delete.backgroundColor = .red
               let configuration = UISwipeActionsConfiguration(actions: [edit,delete])
               return configuration
    }
    
}
