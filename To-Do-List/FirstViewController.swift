//
//  FirstViewController.swift
//  ToDoList
//
//  Created by Benny Lau on 10/22/15.
//  Copyright (c) 2015 Benny Lau. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblTasks: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.tblTasks.reloadData() //Reloads table data to reflect changes to table view
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //Access variables in appDelegate so not need to re-instantiate here
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) { //Attempt to delete cell
            
            appDelegate.notesArray.removeObjectAtIndex(indexPath.row) //Removes from the task object array
            
            appDelegate.notesArray.writeToFile(appDelegate.plistPathInDocument, atomically: true) //Writes to plist
            
            taskMgr.tasks.removeAtIndex(indexPath.row) //Removes from internal task manager
            
            tblTasks.reloadData()
            
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //Tells our table how many rows to render
        
        return taskMgr.tasks.count
        
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { //Creates individual table cells. Function executes once per cell in table. Each time it executes, index path updates to be the correct position in the table
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Default") //Subtitle style gives you two text fields (one for title, one for subtitle)
        
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name
        
        return cell
        
    }
    
}