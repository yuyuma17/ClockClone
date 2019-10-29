//
//  ClockModel.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/23.
//  Copyright © 2019 Lacie. All rights reserved.
//

import Foundation

struct AlarmData {
    static var timePointArray = [""]
    static var hourArray = [""]
    static var minuteArray = [""]
    static var toggleArray = [Bool]()
}

struct MyAlarms {
    static var alarm: [Alarm] = []
}

struct Alarm {
    let timePoint: String
    let hour: String
    let miunte: String
    let toggle: Bool
}
