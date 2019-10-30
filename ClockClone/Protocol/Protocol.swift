//
//  Protocol.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/28.
//  Copyright © 2019 Lacie. All rights reserved.
//

import Foundation

protocol GetSelectedDaysData: AnyObject {
    func receiveSelectedDaysData(days: String)
}

protocol GetTagData: AnyObject {
    func receiveTagData(tag: String)
}

protocol GetCellIndexPathRow: AnyObject {
    func receiveCellIndexPathRow(index: Int)
}
