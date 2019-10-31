//
//  SettingTableViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/23.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController, GetTagData, GetSelectedDaysData {
    
    weak var passTagToAddVcDelegate: GetTagData?
    
    @IBOutlet weak var repeatOptionCell: UITableViewCell!
    @IBOutlet weak var tagOptionCell: UITableViewCell!
    @IBOutlet weak var voiceOptionCell: UITableViewCell!
    @IBOutlet weak var RepeatOptionLabel: UILabel!
    @IBOutlet weak var tagOptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        repeatOptionCell.accessoryView = setAccessoryView()
        tagOptionCell.accessoryView = setAccessoryView()
        voiceOptionCell.accessoryView = setAccessoryView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        passTagToAddVcDelegate?.receiveTagData(tag: tagOptionLabel.text!)
    }
    
    // 將 Accessory 以圖片取代
    func setAccessoryView() -> UIImageView {
        let indicator = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 16))
        indicator.image = UIImage(named: "indicator")
        return indicator
    }
    
    // 接收 Delegate 資料
    func receiveSelectedDaysData(days: String) {
        RepeatOptionLabel.text = days
    }
    
    // 接收 Delegate 資料
    func receiveTagData(tag: String) {
        tagOptionLabel.text = tag
    }
    
    // 修改後的資料亦回傳至下個畫面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let repeatOptionViewController = segue.destination as? RepeatOptionViewController
        let tagViewController = segue.destination as? TagViewController
        
        repeatOptionViewController?.selectedDays = RepeatOptionLabel.text
        tagViewController?.tagText = tagOptionLabel.text!
        
        repeatOptionViewController?.getDaysDelegate = self
        tagViewController?.getTagDelegate = self
    }
}
