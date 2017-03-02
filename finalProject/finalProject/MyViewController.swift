//
//  MyViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 2/27/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func click_lock(_ sender: Any) {
        
        self.performSegue(withIdentifier: "checkpwd", sender: self)
    }
    
    
}
