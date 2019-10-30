//
//  TagViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/24.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class TagViewController: UIViewController {

    weak var getTagDelegate: GetTagData?
    
    @IBOutlet weak var tagTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagTextField.enablesReturnKeyAutomatically = true
        reviseBackButtonNameAndColor()
        reviseTextFieldLeftPadding()
    }
    
    // 一進畫面則選到 TextField 且鍵盤隨後彈出
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tagTextField.becomeFirstResponder()
    }
    
    // 離開畫面時使用 Delegate 傳值到上一頁
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if tagTextField.text?.count == 0 {
            getTagDelegate?.receiveTagData(tag: "鬧鐘")
        } else {
            getTagDelegate?.receiveTagData(tag: tagTextField.text!)
        }
    }
    
    func reviseBackButtonNameAndColor() {
        
        let backButton = UIBarButtonItem()
        backButton.title = "返回"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.view.tintColor = UIColor.orange
    }
    
    func reviseTextFieldLeftPadding() {
        tagTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tagTextField.frame.height))
        tagTextField.leftViewMode = .always
    }
}

extension TagViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if tagTextField.text?.count == 0 {
            tagTextField.isEnabled = false
        } else {
            tagTextField.isEnabled = true
        }
        self.navigationController?.popViewController(animated: true)
        return true
    }
}
