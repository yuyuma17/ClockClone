//
//  TagViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/24.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class TagViewController: UIViewController {

    @IBOutlet weak var tagTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviseBackButton()
        reviseLeftPadding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tagTextField.becomeFirstResponder()
    }
    
    func reviseBackButton(){
        self.navigationController?.view.tintColor = UIColor.orange
        
        let backButton = UIBarButtonItem()
        backButton.title = "返回"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func reviseLeftPadding() {
        tagTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tagTextField.frame.height))
        tagTextField.leftViewMode = .always
    }


}
