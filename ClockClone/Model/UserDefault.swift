//
//  UserDefault.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/28.
//  Copyright © 2019 Lacie. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    // MARK: - Static Properties
    static let manager = UserDefaultsWrapper()
    
    // MARK: - Internal getter methods
    func getStoredTimePoint() -> [String]? {
        return UserDefaults.standard.array(forKey: timePointKey) as? [String]
    }
    
    func getStoredHour() -> [String]? {
        return UserDefaults.standard.array(forKey: hourKey) as? [String]
    }
    
    func getStoredMinute() -> [String]? {
        return UserDefaults.standard.array(forKey: minuteKey) as? [String]
    }
    
    func getStoredToggle() -> [Bool]? {
         return UserDefaults.standard.array(forKey: toggleKey) as? [Bool]
     }
    
    func getStoredTag() -> [String]? {
        return UserDefaults.standard.array(forKey: tagKey) as? [String]
    }
    
    // MARK: - Internal setter methods
    func store(timePoint: [String]) {
        UserDefaults.standard.set(timePoint, forKey: timePointKey)
    }
    
    func store(hour: [String]) {
        UserDefaults.standard.set(hour, forKey: hourKey)
    }
    
    func store(minute: [String]) {
        UserDefaults.standard.set(minute, forKey: minuteKey)
    }
    
    func store(toggle: [Bool]) {
        UserDefaults.standard.set(toggle, forKey: toggleKey)
    }
    
    func store(tag: [String]) {
        UserDefaults.standard.set(tag, forKey: tagKey)
    }
    
    // MARK: - Private Properties
    private let timePointKey = "timePointArray"
    private let hourKey = "hourArray"
    private let minuteKey = "minuteArray"
    private let toggleKey = "toggleArray"
    private let tagKey = "tagArray"
}
