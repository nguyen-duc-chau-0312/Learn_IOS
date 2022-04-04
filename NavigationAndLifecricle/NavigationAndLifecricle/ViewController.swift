//
//  ViewController.swift
//  NavigationAndLifecricle
//
//  Created by Nguyen Duc Chau on 01/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtHoTenVang: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEW1: DID LOAD")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("VIEW1: WILL APEAR")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("VIEW1: WILL DISAPPEAR")
    }
    // Appear: Xuat hien ra man hinh
    
    override func viewDidAppear(_ animated: Bool) {
        print("VIEW1: DID APPEAR")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("VIEW1: DID DIDSAPPEAR")
    }
    
    
    // DisAppear: Bien mat

    @IBAction func GoToTim(_ sender: UIButton) {
        // b1: Storyboard
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        // b2: tao man hinh mau tim
        let manhinh2 = sb.instantiateViewController(identifier: "MAUTIM") as! MauTimViewController
        
        manhinh2.hoTen = txtHoTenVang.text
        
        // Navigation Push
        self.navigationController?.pushViewController(manhinh2, animated: true)
    }
    
}

