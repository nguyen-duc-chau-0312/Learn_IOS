//
//  CameraViewController.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 24/04/2022.
//

import UIKit

class CameraViewController: UIViewController {
    
    var itemArray = ["Hello", "How Are", "I'm Fine Thank You"]
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Create bar button item
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Image", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Image", style: .default) { (action) in
            //
            print("Thanh Cong")
            
            self.itemArray.append(textField.text!)
            
            self.myTableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new Image"
            textField = alertTextField
//            print(alertTextField.text)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
//        print(<#T##items: Any...##Any#>)
    }
    
}

extension CameraViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath)
        
        if myTableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            myTableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            myTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        myTableView.deselectRow(at: indexPath, animated: true)
    }
}
