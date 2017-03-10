//
//  ViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 2/27/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//


import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tf_password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func click_unlock(_ sender: Any) {
        if (UserConfig.User?.value(forKey: "password") as! String) == tf_password.text
        {
            self.performSegue(withIdentifier: "showList", sender: self)
        }else {
            Alert.show("password error", view: self)
        }
    }
    
    
}
