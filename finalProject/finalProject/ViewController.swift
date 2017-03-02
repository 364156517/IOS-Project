//
//  ViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 2/27/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
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
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

