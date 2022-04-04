//
//  ViewController.swift
//  DemoTableView_Free_02
//
//  Created by Nguyen Duc Chau on 01/04/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTable: UITableView!
//    var mang: [String] = ["anh1", "anh2", "anh3", "anh4", "anh5", "aa"]
    
    var mang:[SieuNhan] = [
        SieuNhan(hinh: "aa", ten: "Sieu nhan den"),
        SieuNhan(hinh: "anh1", ten: "Sieu nhan den"),
        SieuNhan(hinh: "anh2", ten: "Sieu nhan do"),
        SieuNhan(hinh: "anh3", ten: "Sieu nhan trang"),
        SieuNhan(hinh: "anh4", ten: "Sieu nhan vang"),
        SieuNhan(hinh: "anh5", ten: "Sieu nhan xanh1")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.dataSource = self
        myTable.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mang.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "CELL") as! DONGTableViewCell
        cell.imgHinh.image = UIImage(named: mang[indexPath.row].HINH)
        cell.myLabel.text = mang[indexPath.row].TEN
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let mh2 = sb.instantiateViewController(identifier: "MANHINH2") as! ManHinh2ViewController
        mh2.tenHinh = mang[indexPath.row].HINH
        self.navigationController?.pushViewController(mh2, animated: true)
        
    }


}

