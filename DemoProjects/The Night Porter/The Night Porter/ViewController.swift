//
//  ViewController.swift
//  The Night Porter
//
//  Created by Bryan Albrecht on 12.11.18.
//  Copyright © 2018 Zuehlke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn{
            view.backgroundColor = UIColor.darkGray
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
    //Delegates
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            
            switch indexPath.section{
            case 0:
                self.dailyTasks[indexPath.row].completed = true
            case 1:
                self.weeklyTasks[indexPath.row].completed = true
            case 2:
                self.monthlyTask[indexPath.row].completed = true
            default:
                break
            }
            tableView.reloadData()
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    
    // Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
       return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Task"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
             return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTask.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask =  weeklyTasks[indexPath.row]
        case 2:
            currentTask =  monthlyTask[indexPath.row]
        default:
            break
        }
        
        cell.textLabel!.text = currentTask?.name
        
        if currentTask.completed {
            cell.textLabel?.textColor = UIColor.lightGray
            cell.accessoryType = .checkmark
        }else {
            cell.textLabel?.textColor = UIColor.black
            cell.accessoryType = .none
        }
        
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    

    var dailyTasks = [Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Check all doors", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Is the boiler fueled", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Empty trahs containers", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "If freezing, check water pipes", type: .daily, completed: false, lastCompleted: nil),
                      Task(name: "Document \"strange and unusual\" occurrences", type: .daily, completed: false, lastCompleted: nil)]
    
    var weeklyTasks = [Task(name: "Check inside all cabins", type: .weekly, completed: false, lastCompleted: nil),
                       Task(name: "Flush all lavatories", type: .weekly, completed: false, lastCompleted: nil),
                       Task(name: "Walk the permiter of property", type: .weekly, completed: false, lastCompleted: nil)]
    
    var monthlyTask = [Task(name: "Test security alarm", type: .monthly, completed: false, lastCompleted: nil),
                       Task(name: "Test motion detector", type: .monthly, completed: false, lastCompleted: nil),
                       Task(name: "Test smoke alarms", type: .monthly, completed: false, lastCompleted: nil)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

