//
//  DemoTableViewController.swift
//  DemoXib
//
//  Created by Nguyen Duc Chau on 20/04/2022.
//

import UIKit

class DemoTableViewController: UIViewController {
    @IBOutlet weak var tbView: UITableView!
    
    var contentArray = [
        Content(title: "Abc", title1: "Xyz"),
        Content(title: "Abc1", title1: "Xyz1"),
        Content(title: "Abc2", title1: "Xyz2"),
        Content(title: "Abc3", title1: "Xyz3"),
        Content(title: "Abc4", title1: "Xyz4"),
        Content(title: "Abc5", title1: "Xyz5"),
        Content(title: "Abc6", title1: "Xyz6"),
        Content(title: "Abc7", title1: "Xyz7"),
        Content(title: "Abc8", title1: "Xyz8"),
        Content(title: "Abc9", title1: "Xyz9"),
        Content(title: "Abc10", title1: "Xyz10"),
        Content(title: "Abc11", title1: "Xyz11"),
        Content(title: "Abc12", title1: "Xyz12")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbView.delegate = self
        tbView.dataSource = self
        
        registerTableViewCells()
        
        // Do any additional setup after loading the view.
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "DemoTableViewCell",
                                  bundle: nil)
        self.tbView.register(textFieldCell,
                             forCellReuseIdentifier: "DemoTableViewCell")
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension DemoTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    //Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell") as? DemoTableViewCell {
            cell.lblText1.text = contentArray[indexPath.row].title
            cell.lblText2.text = contentArray[indexPath.row].title1
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    
}
