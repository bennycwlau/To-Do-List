//
//  TaskManager.swift
//  ToDoList
//
//  Created by Benny Lau on 10/22/15.
//  Copyright (c) 2015 Benny Lau. All rights reserved.
//

import UIKit

var taskMgr : TaskManager = TaskManager() //Access TaskManager anywhere in app

struct task {
    
    var name : String = "Empty"
    
}

class TaskManager: NSObject {
    
    var tasks = [task]() //Maintains an array of task objects
    
    func addTask(name: String) {
        
        tasks.append(task(name: name))
        
    }
    
}
