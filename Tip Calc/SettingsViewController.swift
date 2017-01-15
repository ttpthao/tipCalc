//
//  SettingsViewController.swift
//  Tip Calc
//
//  Created by Thao Tran Thi Phuong on 1/14/17.
//  Copyright © 2017 Thao Tran Thi Phuong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultPercentageSegment: UISegmentedControl!
    @IBOutlet weak var themeSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
