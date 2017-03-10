//
//  Alert.swift
//  finalProject
//
//  Created by Juncheng Xu on 3/1/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import Foundation
import UIKit

class Alert: NSObject {
    
    
    
    static func show(_ message:String,view:UIViewController)->Void
    {
        let alert:UIAlertController = UIAlertController(title: "TodoList", message: message, preferredStyle:.alert)
        
        let cancelAction = UIAlertAction(title: "CANCLE", style: .cancel,handler: nil)
        alert.addAction(cancelAction)
        view.present(alert, animated: true, completion: nil)
        
    }
    
    
    static func show(_ message:String)->Void
    {
        let alert:UIAlertController = UIAlertController(title: "TodoList", message: message, preferredStyle:.alert)
        
        let cancelAction = UIAlertAction(title: "CANCLE", style: .cancel,handler: nil)
        alert.addAction(cancelAction)
        
        let topVC =    UIApplication.shared.keyWindow?.rootViewController
        if let view = topVC?.presentedViewController {
            view.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
}
