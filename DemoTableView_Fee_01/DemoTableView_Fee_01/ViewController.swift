//
//  ViewController.swift
//  DemoTableView_Fee_01
//
//  Created by Nguyen Duc Chau on 01/04/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
 
    @IBOutlet weak var myTable: UITableView!
    var mang:[String]!
    var mang2: [String]!
    
    @IBOutlet weak var myTable2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable2.dataSource = self
        mang = ["IOS", "Android", "Unity", "Java"]
        mang2 = ["Gao", "Duong", "Sua"]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section" + String(section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return mang.count
        }
        
        if tableView.tag == 1 {
            return mang2.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if tableView.tag == 0 {
            cell?.textLabel?.text = mang[indexPath.row]
            cell?.detailTextLabel?.text = "Dong " + String(indexPath.row)
        }
        
        if tableView.tag == 1 {
            cell?.textLabel?.text = mang2[indexPath.row]
            cell?.detailTextLabel?.text = "Dong " + String(indexPath.row)
        }
        return cell!

    }
    

}

