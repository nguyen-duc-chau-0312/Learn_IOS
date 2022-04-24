//
//  View1.swift
//  DemoXib
//
//  Created by Nguyen Duc Chau on 20/04/2022.
//

import UIKit

class View1: UIView {

    @IBOutlet var contentView: View1!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }
    
    required init?(coder aDcoder: NSCoder){
        super.init(coder: aDcoder)
        commomInit()
    }
    
    private func commomInit(){
        Bundle.main.loadNibNamed("View1", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

        
        
}


