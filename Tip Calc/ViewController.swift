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
    
    let userPreferKey = "userPreferKey"
    let percentageKey = "percentageKey"
    let prevInputBill = "prevInputBill"
    let lastInputDateTime = "lastInputDateTime"
    let defaults = UserDefaults.standard
    
    let tipPercentages = [0.18, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.billField.becomeFirstResponder()
        
        // Do any additional setup after loading the view, typically from a nib.
        if let userInputDateTime = defaults.object(forKey: lastInputDateTime) as! Date! {
            let elapsedTime = Date().timeIntervalSince(userInputDateTime)
            if elapsedTime < 600 {
                if let userInput = defaults.object(forKey: prevInputBill) as! String!{
                   billField.text = userInput
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        billField.becomeFirstResponder()
        if let userPreferences = defaults.dictionary(forKey: userPreferKey){
            tipPercentageSegment.selectedSegmentIndex = userPreferences[percentageKey] as! Int!
        }
        else {
            tipPercentageSegment.selectedSegmentIndex = 0
        }
        
        onTipPercentageChange(tipPercentageSegment)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if billField.text != ""{
            billField.resignFirstResponder()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    @IBAction func onBillChange(_ sender: Any) {
        calculateTip()
    }
    
    @IBAction func onTipPercentageChange(_ sender: UISegmentedControl) {
        calculateTip()
    }
    
    func calculateTip() {
        validateInput()
        if (billField.text != "") {
            tipValueLabel.addTransition(duration: 0.4)
            totalValueLabel.addTransition(duration: 0.4)
        }
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipPercentageSegment.selectedSegmentIndex]
        let total = bill + tip
        
        //Format locale curency
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale.current
        
        UIView.animate(withDuration: 0.4, delay: 1, options: [.transitionCrossDissolve], animations: {
            self.tipValueLabel.text = formatter.string(from: NSNumber(value: total as Double!))}, completion: nil)
        
        UIView.animate(withDuration: 0.4, delay: 1, options: [.transitionCrossDissolve], animations: {
            self.totalValueLabel.text = formatter.string(from: NSNumber(value: total as Double!))}, completion: nil)
        
    }
    
    func validateInput(){
        //check bunch of zeros
        if (billField.text!) == "0"{
            billField.deleteBackward()
        }
        
        //check multiple point
        var decimalCount = 0;
        let billText = billField.text!
        let array = Array(billText.characters)
        for letter in array {
            if letter == "." {
                decimalCount += 1
            }
        }
        if decimalCount > 1 {
            billField.deleteBackward()
        }
    }
}

extension UIView {
    func addTransition(duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFromTop
        animation.duration = duration
        self.layer.add(animation, forKey: kCATransitionPush)
    }
}
