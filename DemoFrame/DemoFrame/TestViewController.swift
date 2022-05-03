//
//  TestViewController.swift
//  DemoFrame
//
//  Created by Nguyen Duc Chau on 20/04/2022.
//

import UIKit
import CoreData

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func Click(_ sender: UIButton) {
        self.navigationController!.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)

    }
    
}
