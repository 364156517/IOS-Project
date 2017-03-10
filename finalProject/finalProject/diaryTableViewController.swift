//
//  diaryTableViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 3/1/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import UIKit
import CoreData
class diaryTableViewController: UITableViewController {
    
    let coredata = BaseCoreData()
    var data:[NSManagedObject]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //         self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(diaryTableViewController.insertNewObject))
        self.navigationItem.rightBarButtonItem = addButton
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        getItemList()
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
        if let data = self.data{
            return data.count
        }else{
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "diarycell", for: indexPath)
        
        cell.textLabel?.text = data?[(data?.count)! - indexPath.row-1].value(forKey: "title") as? String
        cell.detailTextLabel?.text = data?[(data?.count)!-indexPath.row-1].value(forKey: "time") as? String
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //            tableView.deleteRows(at: [indexPath], with: .fade)
            
            let itemlist = (data?[(data?.count)! - 1 - indexPath.row])! as! Itemlist
            let predicate = NSPredicate(format: "title == %@ and time == %@",itemlist.title!,itemlist.time!)
            if(coredata.deleteCoreDate(entityName: "Itemlist", predicate: predicate))
            {
                getItemList()
            }else{
                Alert.show("DELETE ERROR",view: self)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "detailsView", sender: data?[(data?.count)! - indexPath.row-1])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsView" {
            let controller = segue.destination as! DetailViewController
            controller.item = (sender as? Itemlist)?.id
        }
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    func getItemList(){
        if let data =  coredata.findAllCoreDate(entityName: "Itemlist", predicate: nil){
            self.data = data;
            self.tableView.reloadData()
        }
    }
    
    
    func insertNewObject()  {
        self.performSegue(withIdentifier: "addItem", sender: self)
    }
}
