//
//  AddClockViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/22.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class AddClockViewController: UIViewController {

    lazy var time = timePicker.date
    let dateFormatter = DateFormatter()
//    let userDefault = UserDefaults()
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        revisePickerTextColorAndLineColor()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
    }
    
    @IBAction func cancelAndBackToMainView(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveAndAddNewClock(_ sender: UIBarButtonItem) {
        AlarmData.hourArray.append(getPickerHour())
        AlarmData.minuteArray.append(getPickerMinute())
//        userDefault.set(AlarmData.hourArray, forKey: "hourArray")
//        userDefault.set(AlarmData.minuteArray, forKey: "minuteArray")
        dismiss(animated: true, completion: nil)
    }
    
    // TODO
    func getPickerHour() -> String {
        dateFormatter.dateFormat = "H"
        let hour = dateFormatter.string(from: time)
        return hour
    }
    
    // TODO
    func getPickerMinute() -> String {
        dateFormatter.dateFormat = "mm"
        let minute = dateFormatter.string(from: time)
        return minute
    }
    
    func revisePickerTextColorAndLineColor() {
        
        if let pickerView = timePicker.subviews.first {
            
            for subView in pickerView.subviews {
                
                if subView.frame.height <= 5 {
                    subView.backgroundColor = UIColor.lightGray
                }
            }
            self.timePicker.setValue(UIColor.white, forKey: "textColor")
        }
    }
}
