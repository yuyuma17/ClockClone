//
//  ClockTableViewCell.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/24.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ClockTableViewCell: UITableViewCell {

    var cellIndexPathRow: Int!
    weak var getCellIndexPathRowDelegate: GetCellIndexPathRow?
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var colonLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var timePointLabel: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var commaImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func switchOnAndOff(_ sender: UISwitch) {
        
        hourLabel.textColor = sender.isOn ? .white : .lightGray
        colonLabel.textColor = sender.isOn ? .white : .lightGray
        minuteLabel.textColor = sender.isOn ? .white : .lightGray
        timePointLabel.textColor = sender.isOn ? .white : .lightGray
        tagLabel.textColor = sender.isOn ? .white : .lightGray
        daysLabel.textColor = sender.isOn ? .white : .lightGray
        commaImage.image = sender.isOn ? UIImage(named: "commaWhite") : UIImage(named: "commaGray")
        
        getCellIndexPathRowDelegate?.receiveCellIndexPathRow(index: cellIndexPathRow)
        AlarmData.toggleArray[cellIndexPathRow] = sender.isOn ? true : false
        UserDefaultsWrapper.manager.store(toggle: AlarmData.toggleArray)
    }
}
