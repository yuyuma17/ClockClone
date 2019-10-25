//
//  ClockTableViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/22.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ClockTableViewController: UITableViewController, GetTimeData {
    
    var hourArray = ["9", "9", "9"]
    var minuteArray = ["22", "23", "24"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        editButtonItem.title = "編輯"
        editButtonItem.tintColor = .orange
        
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func toAddNewClockPage(_ sender: UIBarButtonItem) {
        let addVCNaviController = UIStoryboard(name: "Clock", bundle: nil).instantiateViewController(withIdentifier: "addVC") as! UINavigationController
        let addVC = addVCNaviController.viewControllers.first as? AddClockViewController
        addVC?.getTimeDelegate = self
        
        present(addVCNaviController, animated: true, completion: nil)
    }
    
    func receiveTimeData(hour: String, minute: String) {
        hourArray.append(hour)
        minuteArray.append(minute)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell", for: indexPath) as! ClockTableViewCell
        cell.hourLabel.text = hourArray[indexPath.row]
        cell.minuteLabel.text = minuteArray[indexPath.row]
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if(editing) {
            editButtonItem.title = "完成"
            editButtonItem.tintColor = .orange
        }
        else {
            editButtonItem.title = "編輯"
            editButtonItem.tintColor = .orange
        }
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowAction.Style.default, title: "刪除") { (UITableViewRowAction, IndexPath) in
            
            self.hourArray.remove(at: indexPath.row)
            self.minuteArray.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        return [deleteAction]
    }
    
    func setClockAlarm(hour: Int, minute: Int) {
        
        let content = UNMutableNotificationContent()
        
        content.body = "鬧鐘"
        content.sound = UNNotificationSound.default
        
        var date = DateComponents()
        date.hour = hour
        date.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
