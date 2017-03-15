//
//  BaseCoreData.swift
//  finalProject
//
//  Created by Juncheng Xu on 3/1/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import UIKit
import CoreData
class BaseCoreData {
    
    func findAllCoreDate(entityName:String,predicate:NSPredicate?)->  [NSManagedObject]? {
        let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName);
        if predicate != nil {
            request.predicate = predicate
        }
        do{
            let resultsList = try getContext().fetch(request) as! [NSManagedObject]
            if resultsList.count != 0 {
                return resultsList
            }else {
                return nil
            }
        }catch{
            return nil
        }
    }
    
    func findCoreData(entityName:String,predicate:NSPredicate?) -> NSManagedObject? {
        let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName);
        if predicate != nil {
            request.predicate = predicate
        }
        
        do{
            let resultsList = try getContext().fetch(request) as! [NSManagedObject]
            if resultsList.count != 0 {
                return resultsList[0]
            }else {
                return nil
            }
        }catch{
            return nil
        }
        
    }
    
    func deleteCoreDate(entityName:String,predicate:NSPredicate) -> Bool {
        if let NSManagedObject = findCoreData(entityName: entityName, predicate: predicate) {
            getContext().delete(NSManagedObject)
            do {
                try getContext().save()
                return true
            } catch  {
                return false
            }
        }
        
        return false
    }
    
    
    func  getContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
}
