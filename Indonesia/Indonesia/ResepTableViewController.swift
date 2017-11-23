//
//  ResepTableViewController.swift
//  Indonesia
//
//  Created by SMK IDN MI on 11/23/17.
//  Copyright © 2017 Djoendhie. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ResepTableViewController: UITableViewController {
    
    var resepSelected:String?
    var waktuSelected:String?
    var orangSelected:String?
    var hargaSelected:String?
    
    var nampungId : String? = nil
    var arrayresep = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let params = ["id_nama" : nampungId]
        let url = "http://localhost/Indonesia/index.php/api/getnama"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                
                
                if response.result.isSuccess {
                    //kalau response suces kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get jsonaray dari json arrayq
                    self.arrayresep = json["data"].arrayObject as! [[String : String]]
                    //check d log
                    //check jumlah array
                    if (self.arrayresep.count > 0){
                        
                        //refresh tableview
                        self.tableView.reloadData()
                    }
                }
                else{
                    
                    print("error server")
                    
                }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayresep.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellResep", for: indexPath) as! ResepTableViewCell
        
        var serverid = arrayresep[indexPath.row]
        
        var resep = serverid["nama"]
        let waktu = serverid["waktu"]
        let orang = serverid["orang"]
        let harga = serverid["harga"]
        let bahan = serverid["hahan"]
        let cara = serverid["cara"]
        //print judul
        
        cell.labelResep.text = resep
        cell.labelHarga.text = harga
        cell.labelOrang.text = orang
        cell.labelWaktu.text = waktu
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrayresep[indexPath.row]
        resepSelected = task["nama"] as! String
        waktuSelected = task["waktu"] as! String
        orangSelected = task["orang"] as! String
        hargaSelected = task["harga"] as! String
        
        
        performSegue(withIdentifier: "passIsi", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passIsi" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = arrayresep[indexPath.row]
                
                controller.passResep = value["nama"] as! String
                controller.passWaktu = value["waktu"] as! String
                controller.passOrang = value["orang"] as! String
                controller.passHarga = value["harga"] as! String
                controller.passCara = value["cara"] as! String
                controller.passBahan = value["bahan"] as! String
                
                
            }
        }
    }
    
}

