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
        
        tableView.tableFooterView = UIView()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        editButtonItem.title = "編輯"
        editButtonItem.tintColor = .orange
    }
    
    @IBAction func toAddNewClockPage(_ sender: UIBarButtonItem) {
        
        let addNewClockNavigationController = UIStoryboard(name: "Clock", bundle: nil).instantiateViewController(withIdentifier: "addVC") as! UINavigationController
        let addNewClockViewController = addNewClockNavigationController.viewControllers.first as? AddClockViewController
        addNewClockViewController?.getTimeDelegate = self
        
        present(addNewClockNavigationController, animated: true, completion: nil)
    }
    
    // 接收 Delegate 資料並 ReloadData
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 修改編輯按鈕名字和顏色
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
    
    // 取代 editActionsForRowAt 實作刪除按鈕
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "刪除", handler: { (action, view, success) in
            self.hourArray.remove(at: indexPath.row)
            self.minuteArray.remove(at: indexPath.row)
            self.tableView.reloadData()
        })
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // TODO
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
