//
//  ManHinh2ViewController.swift
//  DemoTableView_Free_02
//
//  Created by Nguyen Duc Chau on 01/04/2022.
//

import UIKit

class ManHinh2ViewController: UIViewController {
    
    var tenHinh: String!

    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: tenHinh)!)
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
