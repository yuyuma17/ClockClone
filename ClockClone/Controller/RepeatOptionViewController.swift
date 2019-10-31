//
//  RepeatOptionViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/24.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class RepeatOptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var weekDays: [(day: String, selectedStatus: Bool)] = [("星期日", false), ("星期一", false), ("星期二", false), ("星期三", false), ("星期四",false), ("星期五", false), ("星期六", false)]
    var selectedDays: String!
    weak var getDaysDelegate: GetSelectedDaysData?
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.tableFooterView = UIView()
        reviseBackButtonNameAndColor()
    }
    
    // 畫面要消失時把值傳出去
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if weekDays[0].selectedStatus == true && weekDays[6].selectedStatus != true {
            getDaysDelegate?.receiveSelectedDaysData(days: weekDays[0].day)
        } else if weekDays[1].selectedStatus == true {
            getDaysDelegate?.receiveSelectedDaysData(days: weekDays[1].day)
        } else if weekDays[2].selectedStatus == true {
            getDaysDelegate?.receiveSelectedDaysData(days: weekDays[2].day)
        } else if weekDays[3].selectedStatus == true {
            getDaysDelegate?.receiveSelectedDaysData(days: weekDays[3].day)
        } else if weekDays[4].selectedStatus == true {
            getDaysDelegate?.receiveSelectedDaysData(days: weekDays[4].day)
        } else if weekDays[5].selectedStatus == true {
            getDaysDelegate?.receiveSelectedDaysData(days: weekDays[5].day)
        } else if weekDays[6].selectedStatus == true && weekDays[0].selectedStatus != true {
            getDaysDelegate?.receiveSelectedDaysData(days: weekDays[6].day)
        } else if weekDays[0].selectedStatus == true && weekDays[6].selectedStatus == true {
            getDaysDelegate?.receiveSelectedDaysData(days: "週末")
        } else if weekDays[1].selectedStatus == true && weekDays[2].selectedStatus == true && weekDays[3].selectedStatus == true && weekDays[4].selectedStatus == true && weekDays[5].selectedStatus == true {
            getDaysDelegate?.receiveSelectedDaysData(days: "平日")
        }
    }
    
    func reviseBackButtonNameAndColor() {
        
        let backButton = UIBarButtonItem()
        backButton.title = "返回"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationController?.view.tintColor = UIColor.orange
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                weekDays[indexPath.row].selectedStatus = true
            } else {
                cell.accessoryType = .none
                weekDays[indexPath.row].selectedStatus = false
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekDays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeekDayCell", for: indexPath)
        
        cell.textLabel?.text = weekDays[indexPath.row].day
        cell.textLabel?.textColor = UIColor.white
        
        // 在此數再寫一次才能在進去畫面後得到選中的選項（打勾狀態）
        if weekDays[indexPath.row].selectedStatus == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}
