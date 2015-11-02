//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Benny Lau on 10/22/15.
//  Copyright (c) 2015 Benny Lau. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate { //Delegate for both text fields
    
    @IBOutlet var txtTask: UITextField! //! indicates we're declaring a variable but not yet setting it. Responsibility of making sure it isn't null is on us
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddTask_Click(sender: UIButton) { //Function tied to button in storyboard
        
        taskMgr.addTask(txtTask.text) //Adds task to the task manager
        
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate //Access variables from appDelegate so not need to re-instantiate here
        
        appDelegate.notesArray.addObject(self.txtTask.text) //Adds it to the array of task objects
        
        appDelegate.notesArray.writeToFile(appDelegate.plistPathInDocument, atomically: true) //Writes the changes to the plist file
        
        self.view.endEditing(true) //Keyboard disappears once you press button
        
        txtTask.text = "" //Erase the text in the text field
        
        self.tabBarController?.selectedIndex = 0 //Go back to the first tab. 0th index is first tab, 1st index is second tab, etc for tab bar controller
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true) //If you click away from text boxes, keyboard should disappear
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder() //Keyboard should disappear when you hit enter key
        
        return true;
        
    }
    
}