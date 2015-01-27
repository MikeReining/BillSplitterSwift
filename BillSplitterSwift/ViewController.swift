//
//  ViewController.swift
//  BillSplitterSwift
//
//  Created by Michael Reining on 1/26/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var calculateBillButton: UIButton!
    @IBOutlet weak var amountOwedPerPersonLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    // NSDecimalNumber constants used in the calculateTip method
    
    @IBAction func calculateSplitAmount(sender: AnyObject) {
        calculateBillTotal()
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
        // convert slider value to an NSDecimalNumber
        let sliderValue =
        NSDecimalNumber(integer: Int(numberOfPeopleSlider.value))
        sliderValueLabel.text = "People #: \(sliderValue)"
        calculateBillTotal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalAmountTextField.becomeFirstResponder()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func calculateBillTotal() {
        // Calculate
        let inputString: NSString = totalAmountTextField.text
        var inputStringAsDouble = inputString.doubleValue / 100

        var sliderValue = Int(numberOfPeopleSlider.value)
        var splitBillAmount = inputStringAsDouble / Double(sliderValue)
        billAmountLabel.text = " Bill amount: \(formatAsCurrency(inputStringAsDouble))"
        amountOwedPerPersonLabel.text = " Bill per person: \(formatAsCurrency(splitBillAmount))"
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        println("Does this fire?")
        
        // Format UI Text Field
        
        if string == "" {
            println("delete detected")
        } else {
            println("all good please proceed")
        }
        
        return true
    }
    
}

// convert a numeric value to localized currency string
func formatAsCurrency(number: NSNumber) -> NSString {
    return NSNumberFormatter.localizedStringFromNumber(
        number, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
}



