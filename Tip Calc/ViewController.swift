//
//  ViewController.swift
//  Tip Calc
//
//  Created by Thao Tran Thi Phuong on 1/11/17.
//  Copyright © 2017 Thao Tran Thi Phuong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipValueLabel: UILabel!
    @IBOutlet weak var breakView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var tipPercentageSegment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onBillChange(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func onTipPercentageChange(_ sender: Any) {
        calculateTip()
    }
        
    func calculateTip() {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipPercentageSegment.selectedSegmentIndex]
        let total = bill + tip
        
        tipValueLabel.text = String(format: "$%.2f", tip)
        totalValueLabel.text = String(format: "$%.2f", total)
        
        
        
    }
    
}

