//
//  DetailViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 3/9/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var lb_time: UILabel!
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var tv_content: UITextView!
    var item:Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.automaticallyAdjustsScrollViewInsets = false;
        
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        lb_title.text = item?.title
        tv_content.text = item?.content
        lb_time.text = item?.time
        
        if let _imgage = item?.imageData
        {
            
            let xx = UIImage(data: _imgage as Data)
            myimage.image = xx
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
