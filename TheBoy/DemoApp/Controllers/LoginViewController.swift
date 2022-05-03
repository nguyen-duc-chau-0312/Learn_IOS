//
//  ViewController.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 18/04/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    var userDefaults = UserDefaults.standard
    
    var iconClick = false
    let imageicon = UIImageView()
    let userArrayKey = "ListUserA1"
    var userArray = [User]()
    
    var myDictionary = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            var userDecoder = JSONDecoder()
            let json = userDefaults.string(forKey: userArrayKey)
            let data = json?.data(using: .utf8)
            if let dataUser = data {
                self.userArray = try userDecoder.decode([User].self, from: dataUser)
            }
        }catch {
            print("Error decoder, \(error)")
        }
        
        //        myDictionary = userDefaults.string(forKey: userArrayKey)
        print(myDictionary)
        
        setImageIcon()
        loadData()
    }
    
    
    @IBAction func LoginPressed(_ sender: UIButton) {
        if txtUsername.text?.isEmpty == true || txtPassword.text?.isEmpty == true {
            
            let alertController = UIAlertController(title: "Alert", message: "Vui lòng nhập username & password", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Đồng ý", style: .default) {
                (action: UIAlertAction) in
            }
            
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            var check = false
            for user in self.userArray {
                if(user.userName == txtUsername.text) && (user.password == txtPassword.text){
                    check = true
                    break
                }
            }
            if(check){
                let alertController = UIAlertController(title: "Alert", message: "Đăng nhập thành công", preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default) {
                    (action: UIAlertAction) in
                }
                
                ImageVC()
                txtUsername.text = ""
                txtPassword.text = ""
                
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
                
            }else {//bao loi
                let alertController = UIAlertController(title: "Alert", message: "Username hoặc Password không đúng", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Đồng ý", style: .default) {
                    (action: UIAlertAction) in
                }
                
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func RegisTerPressed(_ sender: UIButton) {
        
    }
    
    
    func setImageIcon() {
        imageicon.image = UIImage(named: "closeeye")
        
        let contentView = UIView()
        contentView.addSubview(imageicon)
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(named: "closeeye")!.size.width/2, height: UIImage(named: "closeeye")!.size.height/2)
        
        imageicon.frame = CGRect(x: -10, y: 0, width: UIImage(named: "closeeye")!.size.width/2, height: UIImage(named: "openeye")!.size.height/2)
        
        txtPassword.rightView = contentView
        txtPassword.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        if iconClick {
            iconClick = false
            tappedImage.image = UIImage(named: "openeye")
            txtPassword.isSecureTextEntry = false
        } else {
            iconClick = true
            tappedImage.image = UIImage(named: "closeeye")
            txtPassword.isSecureTextEntry = true
        }
    }
    
    func ImageVC() {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let screenImageVC = storyboard.instantiateViewController(withIdentifier: "ImageVC") as! ImageViewController
        self.navigationController?.pushViewController(screenImageVC, animated: true)
        
    }
    
    func loadData() {
        print(userArray)
        print(userDefaults.value(forKey: userArrayKey))
    }
}

