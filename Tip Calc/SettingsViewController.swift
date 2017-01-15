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
    
    let defaults = UserDefaults.standard
    let userPreferKey = "userPreferKey"
    let percentageKey = "percentageKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userPreferences = defaults.dictionary(forKey: userPreferKey){
            defaultPercentageSegment.selectedSegmentIndex = userPreferences[percentageKey] as! Int!
        }
        else {
            defaultPercentageSegment.selectedSegmentIndex = 0;
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let userPreferences: Any = [
            percentageKey: defaultPercentageSegment.selectedSegmentIndex
        ]
        defaults.setValue(userPreferences, forKey: userPreferKey)
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
