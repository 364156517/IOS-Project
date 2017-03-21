//
//  finalProjectTests.swift
//  finalProjectTests
//
//  Created by Juncheng Xu on 3/1/17.
//  Copyright © 2017 Juncheng Xu. All rights reserved.
//

import XCTest
import CoreData
@testable import finalProject

class finalProjectTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(true,"Pass")
    }
    func testTestCoreData()  {
        let coredata = BaseCoreData()
        XCTAssertNotNil(coredata.getContext(),"context test")
        
        let context = coredata.getContext()
        
        let entity = NSEntityDescription.entity(forEntityName: "Userinfo", in: context)
        
        let Userinfo = NSManagedObject(entity: entity!, insertInto: context)
        Userinfo.setValue("test", forKey: "username")
        Userinfo.setValue("000", forKey: "password")
        do{
            try context.save()
            XCTAssertTrue(true)
        }catch{
            XCTAssertTrue(false,"creat user error")
        }
        
        
        XCTAssertNotNil(coredata.findCoreData(entityName: "Userinfo", predicate: nil),"find user test")
        
        
        
        
        
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
