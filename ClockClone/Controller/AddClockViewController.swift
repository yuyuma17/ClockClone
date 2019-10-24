//
//  AddClockViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/22.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

protocol GetTimeData {
    func receiveTimeData(time: String)
}

class AddClockViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    
    var getTimeDelegate: GetTimeData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        revisePickerTextAndLineColor()
    }
    
    @IBAction func cancelAddClock(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveNewClock(_ sender: UIBarButtonItem) {
        getTimeDelegate?.receiveTimeData(time: getPickerHour())
        dismiss(animated: true, completion: nil)
    }
    
    func getPickerHour() -> String {
        let time = timePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H"
        let hour = dateFormatter.string(from: time)
        return hour
    }
    
    func revisePickerTextAndLineColor() {
        
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
