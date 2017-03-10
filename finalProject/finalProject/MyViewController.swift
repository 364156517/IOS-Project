//
//  MyViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 2/27/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet weak var lb_count: UILabel!
    
    let coreData = BaseCoreData()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if let list = coreData.findAllCoreDate(entityName: "Itemlist", predicate: nil){
            
            lb_count.text = String(list.count)
        }else{
            lb_count.text = "0"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func click_lock(_ sender: Any) {
        
        self.performSegue(withIdentifier: "checkpwd", sender: self)
    }
    
    
}
