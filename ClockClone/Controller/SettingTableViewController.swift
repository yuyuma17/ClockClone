//
//  SettingTableViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/23.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {

    @IBOutlet weak var repeatOptionCell: UITableViewCell!
    @IBOutlet weak var tagOptionCell: UITableViewCell!
    @IBOutlet weak var voiceOptionCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        repeatOptionCell.accessoryView = setAccessoryView() as? UIView
        tagOptionCell.accessoryView = setAccessoryView() as? UIView
        voiceOptionCell.accessoryView = setAccessoryView() as? UIView
    }
    

    
    func setAccessoryView() -> Any {
        let indicator = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 16))
        indicator.image = UIImage(named: "indicator")
        return indicator
    }

}
