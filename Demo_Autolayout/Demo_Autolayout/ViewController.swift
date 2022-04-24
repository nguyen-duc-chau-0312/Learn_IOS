//
//  ViewController.swift
//  Demo_Autolayout
//
//  Created by Nguyen Duc Chau on 04/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sldFrameValueX: UISlider!
    @IBOutlet weak var sldFrameValueY: UISlider!
    @IBOutlet weak var ViewXanhLa: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func abtnSliderFrame(_ sender: UISlider) {
        
        ViewXanhLa.frame.origin.x = CGFloat(sldFrameValueX.value)
    }
    
    @IBAction func abtnSliderBound(_ sender: Any) {
        
        ViewXanhLa.bounds.origin.x = CGFloat(sldFrameValueY.value)
    }
}

