//
//  MauDoViewController.swift
//  NavigationAndLifecricle
//
//  Created by Nguyen Duc Chau on 01/04/2022.
//

import UIKit

class MauDoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackTo_PREVIOUS(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func BackTo_ROOT(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: false)
        
    }
    
    @IBAction func BackToView(_ sender: Any) {
        
        let manhinh2 = self.navigationController?.viewControllers[1] as! MauTimViewController
        manhinh2.hoTen = "Chau Nguyen"
        
        self.navigationController?.popToViewController(manhinh2, animated: true)
    }
}
