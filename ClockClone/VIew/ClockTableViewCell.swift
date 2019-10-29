//
//  ClockTableViewCell.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/24.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ClockTableViewCell: UITableViewCell {

    let white = UIColor.white
    let lightGray = UIColor.lightGray
    
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
        
        if toggleSwitch.isOn {
            hourLabel.textColor = white
            colonLabel.textColor = white
            minuteLabel.textColor = white
            timePointLabel.textColor = white
            tagLabel.textColor = white
            daysLabel.textColor = white
            commaImage.image = UIImage(named: "commaWhite")
        }
            
        else {
            hourLabel.textColor = lightGray
            colonLabel.textColor = lightGray
            minuteLabel.textColor = lightGray
            timePointLabel.textColor = lightGray
            tagLabel.textColor = lightGray
            daysLabel.textColor = lightGray
            commaImage.image = UIImage(named: "commaGray")
        }
    }
}
