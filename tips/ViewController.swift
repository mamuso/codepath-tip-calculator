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
    @IBOutlet weak var tipForTwoLabel: UILabel!
    @IBOutlet weak var totalForTwoLabel: UILabel!
    @IBOutlet weak var tipForThreeLabel: UILabel!
    @IBOutlet weak var totalForThreeLabel: UILabel!
    @IBOutlet weak var tipForFourLabel: UILabel!
    @IBOutlet weak var totalForFourLabel: UILabel!
    
    // It should be a better way to do this (?)
    @IBOutlet weak var faceImage0: UIImageView!
    @IBOutlet weak var faceImage1: UIImageView!
    @IBOutlet weak var faceImage2: UIImageView!
    @IBOutlet weak var faceImage3: UIImageView!
    @IBOutlet weak var faceImage4: UIImageView!
    @IBOutlet weak var faceImage5: UIImageView!
    @IBOutlet weak var faceImage6: UIImageView!
    @IBOutlet weak var faceImage7: UIImageView!
    @IBOutlet weak var faceImage8: UIImageView!
    @IBOutlet weak var faceImage9: UIImageView!
    
    
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
        
        var backgroundColors = [
            [UIColor(red: 157/255, green: 196/255, blue: 164/255, alpha: 1), UIColor(red: 119/255, green: 140/255, blue: 119/255, alpha: 1)],
            [UIColor(red: 158/255, green: 199/255, blue: 87/255, alpha: 1), UIColor(red: 115/255, green: 150/255, blue: 58/255, alpha: 1)],
            [UIColor(red: 81/255, green: 184/255, blue: 146/255, alpha: 1), UIColor(red: 81/255, green: 140/255, blue: 114/255, alpha: 1)],
            [UIColor(red: 43/255, green: 140/255, blue: 134/255, alpha: 1), UIColor(red: 24/255, green: 97/255, blue: 92/255, alpha: 1)]
        ]
        var backgroundColor = backgroundColors[tipControl.selectedSegmentIndex][0]
        var tintColor = backgroundColors[tipControl.selectedSegmentIndex][1]

        // It should be a better way to do this (?)
        var faces  = [
            self.faceImage0,
            self.faceImage1,
            self.faceImage2,
            self.faceImage3,
            self.faceImage4,
            self.faceImage5,
            self.faceImage6,
            self.faceImage7,
            self.faceImage8,
            self.faceImage9
        ]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        underBillField.text = "$\(billField.text)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "total $%.2f", total)
        
        // It should be a less spaguetti way to do this (?)
        tipForTwoLabel.text = String(format: "$%.2f", tip/2)
        totalForTwoLabel.text = String(format: "total $%.2f", total/2)

        tipForThreeLabel.text = String(format: "$%.2f", tip/3)
        totalForThreeLabel.text = String(format: "total $%.2f", total/3)

        tipForFourLabel.text = String(format: "$%.2f", tip/4)
        totalForFourLabel.text = String(format: "total $%.2f", total/4)

        if(billField.text != "") {
            UIView.animateWithDuration(0.3, animations: {
                self.tipView.alpha = 1
                self.tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(420))
                self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(110))
                self.underBillField.center = CGPoint(x: self.underBillField.center.x, y: CGFloat(110))
                self.tipControl.tintColor = tintColor
                for face in faces {
                    face.tintColor = tintColor
                }
                self.view.backgroundColor = backgroundColor
            })
        } else {
            UIView.animateWithDuration(0.3, animations: {
                self.tipView.alpha = 0
                self.tipView.center = CGPoint(x: self.tipView.center.x, y: CGFloat(550))
                self.underBillField.center = CGPoint(x: self.underBillField.center.x, y: CGFloat(180))
                self.billField.center = CGPoint(x: self.billField.center.x, y: CGFloat(180))
                self.view.backgroundColor = UIColor(red: 210/255, green: 216/255, blue: 219/255, alpha: 1)
            })
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

