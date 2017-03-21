//
//  AddItemViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 3/9/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import UIKit
import CoreData
class AddItemViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var chooseimg: UIImageView!
    
    var myiamge:UIImage?
    let coreData = BaseCoreData()
    let dfmatter = DateFormatter()
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var tv_content: UITextView!
    @IBOutlet weak var tf_title: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        dfmatter.dateFormat="yyyy-MM-dd"
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        
        
        
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
    
    @IBAction func click_add(_ sender: Any) {
        if (tf_title.text?.isEmpty)! {
            Alert.show("title is empty", view: self)
            return
        }
        if tv_content.text.isEmpty {
            Alert.show("content is empty", view: self)
            return
        }
        
        let titile = tf_title.text!
        let content = tv_content.text
        
        
        
        let time =  dfmatter.string(from: Date())
        let context = coreData.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
        
        let entitylist = NSEntityDescription.entity(forEntityName: "Itemlist", in: context)
        
        //      entitylist?.setValue(titile, forKey: "title")
        //        entitylist?.setValue(time, forKey: "time")
        
        
        let itemlist = NSManagedObject(entity: entitylist!, insertInto: context)
        //
        itemlist.setValue(titile, forKey: "title")
        itemlist.setValue(time, forKey: "time")
        
        
        let item = NSManagedObject(entity: entity!, insertInto: context)
        item.setValue(titile, forKey: "title")
        item.setValue(content, forKey: "content")
        item.setValue(String(time), forKey: "time")
        item.setValue("1", forKey: "mood")
        item.setValue(itemlist, forKey: "id")
        if let _myiamge = myiamge {
            item.setValue(UIImagePNGRepresentation(_myiamge), forKey: "imageData")
        }
        
        //        item.objectIDs(forRelationshipNamed:"id")
        do{
            try context.save()
            self.dismiss(animated: true, completion: nil)
        }catch{
            Alert.show("error", view: self)
            
        }
    }
    @IBAction func click_cancle(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.chooseimg.image = image
            self.myiamge = image
        }
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func click_chooseimage(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    
}
