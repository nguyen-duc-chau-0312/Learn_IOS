//
//  ViewController.swift
//  DemoGCD_01
//
//  Created by Nguyen Duc Chau on 05/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img1: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LoadHINH(_ sender: UIButton) {
        
        let queue1 = DispatchQueue(label: "loadHinh1")
        queue1.async {
            //url
            let url = URL(string: "https://images.viblo.asia/140x140/8e1ab551-ac79-4860-a45e-b7e8650be7d8.JPG")
            //data
            do {
                let data = try Data(contentsOf: url!)
                
                DispatchQueue.main.async {
                    self.img1.image = UIImage(data: data)
                }
            }catch{}
        }
     
  
    }
    
}

