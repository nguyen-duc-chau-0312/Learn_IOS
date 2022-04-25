//
//  RegisTerViewController.swift
//  DemoApp
//
//  Created by Nguyen Duc Chau on 18/04/2022.
//

import UIKit

class RegisTerViewController: UIViewController {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    let userArrayKey = "ListUserA1"
    
    let userDefaults = UserDefaults.standard
    var userArray = [User]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Demo.plist")
    
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
                
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
       
        if txtUsername.text?.isEmpty == true || txtPassword.text?.isEmpty == true ||
            txtConfirmPassword.text?.isEmpty == true  {
            
            let alertController = UIAlertController(title: "Alert", message: "Vui lòng nhập đủ các trường.", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Đồng ý", style: .default) {
                (action: UIAlertAction) in
            }
            
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            if (txtPassword.text == txtConfirmPassword.text) {
                let user = User(userName: txtUsername.text!, password: txtPassword.text!)
                self.userArray.append(user)
                
                do {
                    let jsonEncoder = JSONEncoder()
                    let jsonData = try jsonEncoder.encode(self.userArray)
                    let json = String(data: jsonData, encoding: String.Encoding.utf8)
                    userDefaults.set(json, forKey: userArrayKey)
                } catch {
                    NSLog("Unable to archive  \(error)")
                }
                
                //                userDefaults.set(txtUsername.text, forKey: "Username")
                //                userDefaults.set(txtPassword.text, forKey: "Password")
                //                userDefaults.set(txtConfirmPassword.text, forKey: "ConfirmPassword")
                
                let alertController = UIAlertController(title: "Alert", message: "Đăng ký thành công", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Okay", style: .default) {
                    (action: UIAlertAction) in
                }
                
                BacktoVC()
                
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: "Alert", message: "Bạn phải nhập password trùng nhau!", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "Đồng ý", style: .default) {
                    (action: UIAlertAction) in
                }
                
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
                //                print("SAi")
            }
            
        }
    }
    
    @IBAction func ClearPressed(_ sender: UIButton) {
        txtUsername.text = ""
        txtPassword.text = ""
        txtConfirmPassword.text = ""
    }
    
    func BacktoVC() {
        let loginVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GoToLogin") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
