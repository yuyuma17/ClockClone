//
//  ClockTableViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/22.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ClockTableViewController: UITableViewController, GetTimeData {
    
    var hourArray = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        editButtonItem.title = "編輯"
        editButtonItem.tintColor = .orange
        
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func toAddNewClockPage(_ sender: UIBarButtonItem) {
        let secondVC = UIStoryboard(name: "Clock", bundle: nil).instantiateViewController(withIdentifier: "addVC") as! AddClockViewController
        secondVC.getTimeDelegate = self
        let navController = UINavigationController(rootViewController: secondVC)
        navController.navigationBar.barTintColor = UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 44.0 / 255.0, alpha: 100)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navController.navigationBar.titleTextAttributes = textAttributes
        present(navController, animated: true, completion: nil)
    }
    
    func receiveTimeData(time: String) {
        hourArray.append(time)
        tableView.reloadData()
        print(hourArray)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hourArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClockCell", for: indexPath) as! ClockTableViewCell
        cell.hourLabel.text = hourArray[indexPath.row]
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
}
