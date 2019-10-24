//
//  TagViewController.swift
//  ClockClone
//
//  Created by 黃士軒 on 2019/10/24.
//  Copyright © 2019 Lacie. All rights reserved.
//

import UIKit

class TagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviseBackButton()
    }
    
    func reviseBackButton(){
        self.navigationController?.view.tintColor = UIColor.orange
        
        let backButton = UIBarButtonItem()
        backButton.title = "返回"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }


}
