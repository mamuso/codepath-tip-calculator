//
//  ViewController.swift
//  tips
//
//  Created by Manuel Muñoz Solera on 8/20/15.
//  Copyright (c) 2015 Manuel Muñoz Solera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var underBillField: UILabel!
    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Temporarilly hiding the view with all the elements
        tipView.alpha = 0
        
        // Focusing on the text when the view load
        billField.becomeFirstResponder()
        
        // Set the center of the billField and tipView
        billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(180))
        underBillField.center = CGPoint(x: self.underBillField.center.x, y: CGFloat(180))
        tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(550))

}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        underBillField.text = "$\(billField.text)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "total $%.2f", total)
        
        if(billField.text != "") {
            UIView.animateWithDuration(0.25, animations: {
                self.tipView.alpha = 1
                self.tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(420))
                self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(110))
                self.underBillField.center = CGPoint(x: self.underBillField.center.x, y: CGFloat(110))
            })
        } else {
            UIView.animateWithDuration(0.25, animations: {
                self.tipView.alpha = 0
                self.tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(550))
                self.underBillField.center = CGPoint(x: self.underBillField.center.x, y: CGFloat(180))
                self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(180))
            })
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

