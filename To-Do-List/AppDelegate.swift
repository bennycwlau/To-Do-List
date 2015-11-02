//
//  AppDelegate.swift
//  ToDoList
//
//  Created by Benny Lau on 10/22/15.
//  Copyright (c) 2015 Benny Lau. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var plistPathInDocument:String = String() //Saves the name of the plist document
    
    var notesArray:NSMutableArray!
    
    func preparePlistForUse(){
        
        var rootPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, .UserDomainMask, true)[0] as!String //Finds the document directory inside the list of directories in device
        
        plistPathInDocument = rootPath.stringByAppendingPathComponent("notes.plist") //Move directory from main bundle of app to document directory so can edit
        
        if !NSFileManager.defaultManager().fileExistsAtPath(plistPathInDocument) {
            var plistPathInBundle = NSBundle.mainBundle().pathForResource("notes", ofType: "plist")! //If the file does not currently exist in the document directory
            
            NSFileManager.defaultManager().copyItemAtPath(plistPathInBundle, toPath: plistPathInDocument, error: nil) //Copies file over from main bundle to the document directory
        }
        
        var data:NSData =  NSFileManager.defaultManager().contentsAtPath(plistPathInDocument)! //Holds the plist data
        
        notesArray = NSPropertyListSerialization.propertyListWithData(data, options: Int(NSPropertyListMutabilityOptions.MutableContainersAndLeaves.rawValue), format: nil, error: nil) as! NSMutableArray //Deserializes the property list to an array to hold the string objects
        
        var counter:Int = 0
        
        for task in notesArray {
            
            taskMgr.addTask(notesArray[counter] as! String) //For each string object or task in the array, add it to the task manager
            
            counter++ //Goes to the next object
            
        }
    }
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.preparePlistForUse() //Plist file is available to to read and write after application launches
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        //self.preparePlistForUse() //Plist file is available to to read and write after application launches from background
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

