//
//  ClockTableViewCell.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/22.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class ClockTableViewCell: UITableViewCell {

    @IBOutlet weak var timePointLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
