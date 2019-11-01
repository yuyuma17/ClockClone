//
//  ClockTableViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/22.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit
import UserNotifications

class ClockTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        // 讓編輯模式下也可以 didSelectRowAt
        tableView.allowsSelectionDuringEditing = true
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        editButtonItem.title = "編輯"
        editButtonItem.tintColor = .orange
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadClockData), name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    // 讀取 UserDefaults 裡的資料
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let storedTimePoint = UserDefaultsWrapper.manager.getStoredTimePoint() {
            AlarmData.timePointArray = storedTimePoint
        }
        if let storedHour = UserDefaultsWrapper.manager.getStoredHour() {
            AlarmData.hourArray = storedHour
        }
        if let storedMinute = UserDefaultsWrapper.manager.getStoredMinute() {
            AlarmData.minuteArray = storedMinute
        }
        if let storedToggle = UserDefaultsWrapper.manager.getStoredToggle() {
            AlarmData.toggleArray = storedToggle
        }
        if let storedTag = UserDefaultsWrapper.manager.getStoredTag() {
            AlarmData.tagArray = storedTag
        }
    }
    
    @objc func reloadClockData(notification: NSNotification){
        tableView.reloadData()
    }
    @IBAction func toAddNewClockPage(_ sender: UIBarButtonItem) {
        let addNaviVC = storyboard?.instantiateViewController(withIdentifier: "addNaviVc") as! UINavigationController
        let addVC = addNaviVC.viewControllers.first as! AddClockViewController
        
        addVC.nowMode = .Add
        
        present(addNaviVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmData.hourArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell", for: indexPath) as! ClockTableViewCell
        
        if AlarmData.toggleArray[indexPath.row] == true {
            cell.timePointLabel.textColor = UIColor.white
            cell.hourLabel.textColor = UIColor.white
            cell.minuteLabel.textColor = UIColor.white
            cell.colonLabel.textColor = UIColor.white
            cell.tagLabel.textColor = UIColor.white
            cell.daysLabel.textColor = UIColor.white
            cell.commaImage.image = UIImage(named: "commaWhite")
        } else {
            cell.timePointLabel.textColor = UIColor.lightGray
            cell.hourLabel.textColor = UIColor.lightGray
            cell.minuteLabel.textColor = UIColor.lightGray
            cell.colonLabel.textColor = UIColor.lightGray
            cell.tagLabel.textColor = UIColor.lightGray
            cell.daysLabel.textColor = UIColor.lightGray
            cell.commaImage.image = UIImage(named: "commaGray")
        }
        
        cell.timePointLabel.text = AlarmData.timePointArray[indexPath.row]
        cell.hourLabel.text = AlarmData.hourArray[indexPath.row]
        cell.minuteLabel.text = AlarmData.minuteArray[indexPath.row]
        cell.tagLabel.text = AlarmData.tagArray[indexPath.row]
        cell.toggleSwitch.isOn = AlarmData.toggleArray[indexPath.row]
        
        cell.cellIndexPathRow = indexPath.row
        cell.getCellIndexPathRowDelegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing {
            
            let addNaviVC = storyboard?.instantiateViewController(withIdentifier: "addNaviVc") as! UINavigationController
            let addVC = addNaviVC.viewControllers.first as! AddClockViewController
            
            addVC.clockVC = self
            addVC.nowMode = .Edit
            
            present(addNaviVC, animated: true) {
                tableView.isEditing = false
                self.editButtonItem.title = "編輯"
            }
        }
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
    
    // 取代 editActionsForRowAt 實作刪除按鈕及儲存
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "刪除", handler: { (action, view, success) in
            
            AlarmData.timePointArray.remove(at: indexPath.row)
            AlarmData.hourArray.remove(at: indexPath.row)
            AlarmData.minuteArray.remove(at: indexPath.row)
            AlarmData.toggleArray.remove(at: indexPath.row)
            AlarmData.tagArray.remove(at: indexPath.row)
            
            UserDefaultsWrapper.manager.store(timePoint: AlarmData.timePointArray)
            UserDefaultsWrapper.manager.store(hour: AlarmData.hourArray)
            UserDefaultsWrapper.manager.store(minute: AlarmData.minuteArray)
            UserDefaultsWrapper.manager.store(toggle: AlarmData.toggleArray)
            UserDefaultsWrapper.manager.store(tag: AlarmData.tagArray)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // TODO
    func setClockAlarm(hour: Int, minute: Int) {
        
        let content = UNMutableNotificationContent()
        
        content.body = "鬧鐘"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "alarmAction"
        
        var date = DateComponents()
        date.hour = hour
        date.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

extension ClockTableViewController: GetCellIndexPathRow {
    
    func receiveCellIndexPathRow(index: Int) {
    }
    
}
