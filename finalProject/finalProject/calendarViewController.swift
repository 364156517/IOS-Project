//
//  calendarViewController.swift
//  finalProject
//
//  Created by Juncheng Xu on 3/20/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import UIKit
import CVCalendar
import CoreData
class calendarViewController: UIViewController,CVCalendarViewDelegate, CVCalendarMenuViewDelegate  {
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    
    @IBOutlet weak var calendarView: CVCalendarView!
    var data:[NSManagedObject]?
    var coredata:BaseCoreData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        coredata = BaseCoreData()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.menuView.menuViewDelegate = self
        
        
        self.calendarView.calendarDelegate = self
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        getAdiaryTime()
        self.menuView.commitMenuViewUpdate()
        self.calendarView.commitCalendarViewUpdate()
    }
    func getAdiaryTime(){
        if let data =  coredata?.findAllCoreDate(entityName: "Itemlist", predicate: nil){
            self.data = data;
            calendarView.contentController.refreshPresentedMonth()
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /// Required method to implement!
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    /// Required method to implement!
    func firstWeekday() -> Weekday {
        return .sunday
    }
    
    
    
    
    
    func preliminaryView(shouldDisplayOnDayView dayView: DayView) ->Bool{
        if !dayView.isHidden && dayView.date != nil {
            
            let year = dayView.date.year
            let month = dayView.date.month
            let day = dayView.date.day
            
            
            if let _data = data {
                for i in 0..._data.count-1
                {
                    let time = (_data[i].value(forKey: "time") as! String).components(separatedBy: "-")
                    if year == Int(time[0]) && month == Int(time[1]) && day == Int(time[2]){
                        return true
                    }
                }
                
                
            }
        }
        return false
    }
    
    
    func preliminaryView(viewOnDayView dayView: DayView) -> UIView {
        
        let circleView = CVAuxiliaryView(dayView: dayView, rect: dayView.frame,shape: CVShape.circle)
        circleView.fillColor = .colorFromCode(0xDDDDDD)
        return circleView
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
