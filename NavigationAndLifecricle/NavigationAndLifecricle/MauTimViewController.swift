//
//  MauTimViewController.swift
//  NavigationAndLifecricle
//
//  Created by Nguyen Duc Chau on 01/04/2022.
//

import UIKit

class MauTimViewController: UIViewController {
    
    @IBOutlet weak var txtHoTenTim: UITextField!
    var hoTen: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEW2: DID LOAD")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("VIEW2: WILL APEAR")
        txtHoTenTim.text = hoTen
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("VIEW2: WILL DISAPPEAR")
    }
    // Appear: Xuat hien ra man hinh
    
    override func viewDidAppear(_ animated: Bool) {
        print("VIEW2: DID APPEAR")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("VIEW2: DID DIDSAPPEAR")
    }
    
    @IBAction func GoToDo(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let manhinh3 = sb.instantiateViewController(identifier: "MAUDO") as! MauDoViewController
        
        self.navigationController?.pushViewController(manhinh3, animated: true)
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
