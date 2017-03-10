//
//  BootViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 2/27/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import UIKit
import CoreData
class BootViewController: UIViewController {
    
    @IBOutlet weak var tf_username: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    let coreData = BaseCoreData()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(haveUser()){
            
            UserConfig.User = coreData.findCoreData(entityName: "Userinfo", predicate: nil)
            self.performSegue(withIdentifier: "login", sender: self)
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func click_addUser(_ sender: Any) {
        
        if tf_username.text == nil && (tf_username.text?.isEmpty)!{
            Alert.show("username is empty", view: self)
            return
        }
        
        if tf_password.text == nil && (tf_password.text?.isEmpty)!{
            Alert.show("password is empty", view: self)
            return
        }
        
        
        let username = tf_username.text!
        let password = tf_password.text!
        let codition = "username == %@"
        let predicate = NSPredicate(format: codition,username)
        if (coreData.findCoreData(entityName: "Userinfo", predicate: predicate) != nil){
            
            Alert.show("User already exists", view: self)
            return
        }
        
        
        let context = coreData.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Userinfo", in: context)
        
        let Userinfo = NSManagedObject(entity: entity!, insertInto: context)
        Userinfo.setValue(username, forKey: "username")
        Userinfo.setValue(password, forKey: "password")
        do{
            try context.save()
            //            Alert.show("success", view: self)
            UserConfig.User = Userinfo
            self.performSegue(withIdentifier: "showMainPage", sender: self)
        }catch{
            Alert.show("error", view: self)
            
        }

        
    }
    
    func haveUser()->Bool{
        
        if let  object = coreData.findAllCoreDate(entityName: "Userinfo", predicate:nil ){
            if  object.count>0{
                return true
            }
            return false
        }
        return false
    }
}
