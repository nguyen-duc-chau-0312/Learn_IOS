//
//  ViewController.swift
//  DemoFrame
//
//  Created by Nguyen Duc Chau on 20/04/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        self.navigationController!.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)

    }
    
}

