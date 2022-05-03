//
//  ContactTableViewController.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 24/04/2022.
//

import UIKit

class ContactTableViewController: UITableViewController {

    var contacts = [Contact]()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    private func fetchContacts() {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = contacts[indexPath.row].firstName + " " + contacts[indexPath.row].lastName
        cell.detailTextLabel?.text = contacts[indexPath.row].telePhone
        
        return cell
    }
}
