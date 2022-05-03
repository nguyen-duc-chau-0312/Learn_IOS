//
//  PhotoGalleryManager.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 26/04/2022.
//

import UIKit

class PhotoGalleryManager: NSObject {
    
    fileprivate var currentVC: UIViewController!
    static let shared = PhotoGalleryManager()
    var imageView: UIImageView!
    var defaults = UserDefaults.standard
    var imageKey = "imageKey"
    var checkIshidden = false

    
//    var imagePickerBlock: ((UIImage) -> Void)?
    
    private func openCamera() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            pickerController.allowsEditing = true
            currentVC.present(pickerController, animated: true, completion: nil)
        }
    }
    
    
    private func openPhotoGallery() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            pickerController.allowsEditing = true
            currentVC.present(pickerController, animated: true, completion: nil)
        }
    }
    
    private func deletePhoto() {
            defaults.removeObject(forKey: imageKey)
            imageView.isHidden = true
            checkIshidden = true
            

    }
    
   func unisHidden() {
            imageView.isHidden = false
    }
    
    //open action sheet with options
    
    
    func showActionSheet(vc: UIViewController) {
        currentVC = vc
        
        let actionSheet = UIAlertController(title: "Chỉnh sửa ảnh đại diện", message: nil, preferredStyle: .actionSheet)
        
        let actionCamera = UIAlertAction(title: "Ảnh từ Camera", style: .default) { [weak self] _ in
            self?.openCamera()
        }
        
        let actionLibaryPhoto = UIAlertAction(title: "Ảnh từ thư viện", style: .default) { [weak self] _ in
//            if self?.checkIshidden == true {
//                self?.unisHidden()
//            }
            self?.openPhotoGallery()
        }
        
        actionSheet.addAction(actionCamera)
        actionSheet.addAction(actionLibaryPhoto)
        
        actionSheet.addAction(UIAlertAction(title: "Xoá ảnh", style: .destructive, handler: { [weak self] _ in
            self?.deletePhoto()
        }))
                
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true, completion: nil)
        
    }
    
    
        
}

extension PhotoGalleryManager: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        currentVC.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            defaults.setImage(image: imageView.image, forKey: imageKey)
            imageView.isHidden = false
        }
        currentVC.dismiss(animated: true, completion: nil)

//        print(defaults.imageForKey(key: imageKey))
    }

}

extension UserDefaults {
    func imageForKey(key: String) -> UIImage? {
        var image: UIImage?
        if let imageData = data(forKey: key) {
            image = NSKeyedUnarchiver.unarchiveObject(with: imageData) as? UIImage
        }
        return image
    }
    func setImage(image: UIImage?, forKey key: String) {
        var imageData: NSData?
        if let image = image {
            imageData = NSKeyedArchiver.archivedData(withRootObject: image) as NSData?
        }
        set(imageData, forKey: key)
    }
}


