//
//  ViewController.swift
//  Simple Tip
//
//  Created by Jeremy Evans on 11/19/15.
//  Copyright © 2015 Jeremy Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var count = 0
    
    @IBOutlet weak var button: UIButton!
    
    // Fifteen Collumn
    @IBOutlet weak var tipFifteen: UILabel!
    @IBOutlet weak var subFifteen: UILabel!
    @IBOutlet weak var taxFifteen: UILabel!
    @IBOutlet weak var splitFifteen: UILabel!
    @IBOutlet weak var totalFifteen: UILabel!
    
    // Twenty Collumn
    @IBOutlet weak var tipTwenty: UILabel!
    @IBOutlet weak var subTwenty: UILabel!
    @IBOutlet weak var taxTwenty: UILabel!
    @IBOutlet weak var splitTwenty: UILabel!
    @IBOutlet weak var totalTwenty: UILabel!
    
    //
    @IBOutlet weak var tipTwentyFive: UILabel!
    @IBOutlet weak var subTwentyFive: UILabel!
    @IBOutlet weak var taxTwentyFive: UILabel!
    @IBOutlet weak var splitTwentyFive: UILabel!
    @IBOutlet weak var totalTwentyFive: UILabel!
    
    // Textboxes
    @IBOutlet weak var SubTotalText: UITextField!
    @IBOutlet weak var TaxPercent: UITextField!
    @IBOutlet weak var SplitText: UITextField!
    
    
    // Make sure this appears before load
    override func viewDidAppear(animated: Bool) {
        view.backgroundColor = UIColor.clearColor()
        let backgroundLayer = GradientColor.init().gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, atIndex: 0)
        
        // Hide labels
        tipFifteen.hidden = true
        tipTwenty.hidden = true
        tipTwentyFive.hidden = true
        
        taxFifteen.hidden = true
        taxTwenty.hidden = true
        taxTwentyFive.hidden = true
        
        subFifteen.hidden = true
        subTwenty.hidden = true
        subTwentyFive.hidden = true
        
        totalFifteen.hidden = true
        totalTwenty.hidden = true
        totalTwentyFive.hidden = true
        
        splitFifteen.hidden = true
        splitTwenty.hidden = true
        splitTwentyFive.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SplitText.delegate = self
        SubTotalText.delegate = self
        TaxPercent.delegate = self
        
    }
    
    @IBAction func didTapCalculateTip(sender: UIButton!) {
        // grab all textfield inputs and convert to ints. then send to tipCalculation to
        // to display them
        
        if SubTotalText.text != "" && TaxPercent.text != "" && SplitText.text != "" {
            if count == 0 {
                
                
                let taxPercent = (TaxPercent.text! as NSString).floatValue
                let subTotal = (SubTotalText.text! as NSString).floatValue
                let splitValue = (SplitText.text! as NSString).floatValue
                SplitText.resignFirstResponder()
                TaxPercent.resignFirstResponder()
                SubTotalText.resignFirstResponder()
                tipCalculation(taxPercent, subTotal: subTotal, split: splitValue)
                
                button.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0)
                button.setTitle("Reset", forState: .Normal)
                
                count = 1
            } else {
                tipFifteen.text = ""
                tipTwenty.text = ""
                tipTwentyFive.text = ""
                
                subFifteen.text = ""
                subTwenty.text = ""
                subTwentyFive.text = ""
                
                taxFifteen.text = ""
                taxTwenty.text = ""
                taxTwentyFive.text = ""
                
                totalFifteen.text = ""
                totalTwenty.text = ""
                totalTwentyFive.text = ""
                
                splitFifteen.text = ""
                splitTwenty.text = ""
                splitTwentyFive.text = ""
                
                SubTotalText.text = ""
                TaxPercent.text = ""
                SplitText.text = "1"
                
                // Hide labels
                tipFifteen.hidden = true
                tipTwenty.hidden = true
                tipTwentyFive.hidden = true
                
                taxFifteen.hidden = true
                taxTwenty.hidden = true
                taxTwentyFive.hidden = true
                
                subFifteen.hidden = true
                subTwenty.hidden = true
                subTwentyFive.hidden = true
                
                totalFifteen.hidden = true
                totalTwenty.hidden = true
                totalTwentyFive.hidden = true
                
                splitFifteen.hidden = true
                splitTwenty.hidden = true
                splitTwentyFive.hidden = true
                
                
                button.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0)
                button.setTitle("Calculate", forState: .Normal)
                
                count = 0
            }
        } else {
            showAlert("Missing Values", msg: "Please be sure to fill in all values that are needed and try again.")
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        SplitText.resignFirstResponder()
        TaxPercent.resignFirstResponder()
        SubTotalText.resignFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == SplitText {
            didTapCalculateTip(button)
            self.view.endEditing(true)
        } else {
            self.view.endEditing(true)
        }
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tipCalculation(tax: Float, subTotal: Float, split: Float) {
        
        let taxDecimal:Float = tax / 100
        let fifteenPercent:Float = 0.15
        let twentyPercent:Float = 0.20
        let twentyFivePercent:Float = 0.25
        
        
        let meal = subTotal + (subTotal * taxDecimal)
        
        let tipFifteenValue = meal * fifteenPercent
        let tipTwentyValue = meal * twentyPercent
        let tipTwentyFiveValue = meal * twentyFivePercent
        
        let constantTax = subTotal * taxDecimal
        
        let mealFifteen = meal + tipFifteenValue
        let mealTwenty = meal + tipTwentyValue
        let mealTwentyFive = meal + tipTwentyFiveValue
        
        if split <= 1 {
            splitFifteen.text = "\(round(mealFifteen * 100) / 100)"
            splitTwenty.text = "\(round(mealTwenty * 100) / 100)"
            splitTwentyFive.text = "\(round(mealTwentyFive * 100) / 100)"
        } else {
            let splitFifteenValue = mealFifteen / split
            let splitTwentyValue = mealTwenty / split
            let splitTwentyFiveValue = mealTwentyFive / split
            
            splitFifteen.text = "\(round(splitFifteenValue * 100) / 100)"
            splitTwenty.text = "\(round(splitTwentyValue * 100) / 100)"
            splitTwentyFive.text = "\(round(splitTwentyFiveValue * 100) / 100)"
        }
        
        
        tipFifteen.text = "\(round(tipFifteenValue * 100) / 100)"
        tipTwenty.text = "\(round(tipTwentyValue * 100) / 100)"
        tipTwentyFive.text = "\(round(tipTwentyFiveValue * 100) / 100)"
        
        subFifteen.text = "\(round(meal * 100) / 100)"
        subTwenty.text = "\(round(meal * 100) / 100)"
        subTwentyFive.text = "\(round(meal * 100) / 100)"
        
        taxFifteen.text = "\(round(constantTax * 100) / 100)"
        taxTwenty.text = "\(round(constantTax * 100) / 100)"
        taxTwentyFive.text = "\(round(constantTax * 100) / 100)"
        
        totalFifteen.text = "\(round(mealFifteen * 100) / 100)"
        totalTwenty.text = "\(round(mealTwenty * 100) / 100)"
        totalTwentyFive.text = "\(round(mealTwentyFive * 100) / 100)"
        
        // Unhide labels
        tipFifteen.hidden = false
        tipTwenty.hidden = false
        tipTwentyFive.hidden = false
        
        taxFifteen.hidden = false
        taxTwenty.hidden = false
        taxTwentyFive.hidden = false
        
        subFifteen.hidden = false
        subTwenty.hidden = false
        subTwentyFive.hidden = false
        
        totalFifteen.hidden = false
        totalTwenty.hidden = false
        totalTwentyFive.hidden = false
        
        splitFifteen.hidden = false
        splitTwenty.hidden = false
        splitTwentyFive.hidden = false
    }
    
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
}

