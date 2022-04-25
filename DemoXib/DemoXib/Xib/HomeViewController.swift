//
//  HomeViewController.swift
//  DemoXib
//
//  Created by Nguyen Duc Chau on 20/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
//        self.navigationController?.navigationBar.isHidden = false
//        UIApplication.shared.setStatusBarHidden(false, with: .none)

        // Add Label
        
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//        label.center = CGPoint(x: 160, y: 285)
//        label.textAlignment = .center
//        label.text = "I'm a test label"
//        self.view.addSubview(label)
        
        
        let frame = CGRect(x: 20, y: 20, width: 200, height: 21)
        let label = UILabel(frame: frame)
        label.text = "Hello World"
        label.backgroundColor = .red
        self.view.addSubview(label)
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
