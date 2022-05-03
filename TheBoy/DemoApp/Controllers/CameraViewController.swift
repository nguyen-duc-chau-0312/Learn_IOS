//
//  CameraViewController.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 25/04/2022.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnPhoto: UIButton!
    var useDefaults = UserDefaults.standard
    var imageKey = "imageKey"

    var checkIshdden = false
    var pickedImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.layer.cornerRadius = 50
        btnPhoto.layer.cornerRadius = 2
        imageView.contentMode = .scaleAspectFill
        btnPhoto.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        imageView.layer.borderWidth = 0.1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
    }
    
    
    /*Code to get Image and show it on imageView at viewWillAppear() event*/

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        imageView.image = useDefaults.imageForKey1(key: imageKey)
        
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        if useDefaults.imageForKey(key: imageKey) != nil {
//            imageView.isHidden = false
//        }
//    }
    
    @IBAction func getPhotoButtonAction(_ sender: UIButton) {
        
        PhotoGalleryManager.shared.showActionSheet(vc: self)
        
        
//        PhotoGalleryManager.shared.imageView = { [weak self] image in
//            guard let self = self  else {
//                return
//            }
//
//            self.imageView.image = image
//        }
//        PhotoGalleryManager.unisHidden()
        PhotoGalleryManager.shared.imageView = imageView
//        imageView.isHidden = false
    }
    
}

extension UserDefaults {
    func imageForKey1(key: String) -> UIImage? {
        var image: UIImage?
        if let imageData = data(forKey: key) {
            image = NSKeyedUnarchiver.unarchiveObject(with: imageData) as? UIImage
        }
        return image
    }
}



