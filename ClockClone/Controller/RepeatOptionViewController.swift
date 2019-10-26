//
//  RepeatOptionViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/24.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

protocol GetSelectedDaysData: class {
    func receiveSelectedDaysData(days: String)
}

class RepeatOptionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    
    let weekDays = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
    var selectedDays: String!
    weak var getDaysDelegate: GetSelectedDaysData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.tableFooterView = UIView()
        reviseBackButton()
    }
    
    func reviseBackButton(){
        self.navigationController?.view.tintColor = UIColor.orange
        
        let backButton = UIBarButtonItem()
        backButton.title = "返回"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let weekDay = weekDays[indexPath.row]
        getDaysDelegate?.receiveSelectedDaysData(days: weekDay)
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekDays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeekDayCell", for: indexPath)

        let weekDay = weekDays[indexPath.row]
        cell.textLabel?.text = weekDay
        cell.textLabel?.textColor = UIColor.white
        
        if selectedDays == weekDay {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}
