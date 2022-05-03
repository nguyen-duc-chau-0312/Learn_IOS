//
//  ImageViewController.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 19/04/2022.
//

import UIKit

class ImageViewController: UIViewController{
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var myData: [MyData] = [
        MyData(name: "Danh Bạ", avatar: "danhba"),
        MyData(name: "Máy Ảnh", avatar: "mayanh"),
        MyData(name: "Trang Web", avatar: "trangweb"),
        MyData(name: "Công việc", avatar: "congviec")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        
        let nibCell = UINib(nibName: "MyCollectionCell", bundle: nil )
        self.myCollectionView.register(nibCell, forCellWithReuseIdentifier: "cell")
        
    }

}

extension ImageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath == [0,2] {
            let websiteVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "websiteVC") as! WebSiteViewController
            self.navigationController?.pushViewController(websiteVC, animated: true)
        } else if indexPath == [0,0] {
            let contactVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ContactVC") as! ContactViewController
            self.navigationController?.pushViewController(contactVC, animated: true)
        } else if indexPath == [0,1] {
//            let cameraVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "avatarVC") as! AvatarViewController
//            self.navigationController?.pushViewController(cameraVC, animated: true)
            let cameraVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CameraVC") as! CameraViewController
            self.navigationController?.pushViewController(cameraVC, animated: true)
        } else if indexPath == [0,3] {
            let todoListVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "todoListVC") as! TodoListViewController
            self.navigationController?.pushViewController(todoListVC, animated: true)
        }
            
        
        
        
        
//        print(indexPath)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionCell
        var item = myData[indexPath.row]
        cell.lblNameImage.text = item.name
        cell.myImage.image = UIImage(named: item.avatar)
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myData.count
    }
    
    //Kich thuoc cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width - 10
        return CGSize(width: screenWidth/3, height: (screenWidth/3)*5/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

