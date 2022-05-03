//
//  ViewController.swift
//  TestCamera
//
//  Created by Nguyen Duc Chau on 26/04/2022.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!

    var pickedImage = false

    override func viewDidAppear(_ animated: Bool) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) && !pickedImage {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            pickedImage = true
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        imageView.image = image
        self.dismiss(animated: true, completion: nil)
    }

}

