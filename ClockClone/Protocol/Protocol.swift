//
//  Protocol.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/28.
//  Copyright © 2019 Lacie. All rights reserved.
//

import Foundation

protocol GetSelectedDaysData: class {
    func receiveSelectedDaysData(days: String)
}

protocol GetTagData: class {
    func receiveTagData(tag: String)
}
