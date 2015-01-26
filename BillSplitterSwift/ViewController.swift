//
//  ViewController.swift
//  BillSplitterSwift
//
//  Created by Michael Reining on 1/26/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var calculateBillButton: UIButton!
    @IBOutlet weak var amountOwedPerPersonLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    // NSDecimalNumber constants used in the calculateTip method
    
    @IBAction func calculateSplitAmount(sender: AnyObject) {
        
        // Format UI Text Field
        
        let inputString: NSString = totalAmountTextField.text
        // convert to NSDecimalNumber and insert decimal point
        if inputString.length == 1
        {
            let inputStringAsDouble = inputString.doubleValue / 100
            totalAmountTextField.text = " " + formatAsCurrency(inputStringAsDouble)
            println("Input String: \(inputString)")
            println("as double: \(inputStringAsDouble)")
            println("\(totalAmountTextField.text)")
        } else
        {
            // Format total amount text field
            let inputStringWithoutCurrency: NSString = inputString.substringFromIndex(2)
            let inputStringAsDouble = inputStringWithoutCurrency.doubleValue * 10
            totalAmountTextField.text = " " + formatAsCurrency(inputStringAsDouble)
            println("Input String: \(inputString)")
            println("as double: \(inputStringAsDouble)")
            println("\(totalAmountTextField.text)")
        }
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
        var inputStringAsDouble: Double
        // convert to NSDecimalNumber and insert decimal point
        if inputString.length == 1 {
            inputStringAsDouble = inputString.doubleValue / 100
        } else {
            let inputStringWithoutCurrency: NSString = inputString.substringFromIndex(2)
            inputStringAsDouble = inputStringWithoutCurrency.doubleValue
        }
        var sliderValue = Int(numberOfPeopleSlider.value)
        var splitBillAmount = inputStringAsDouble / Double(sliderValue)
        amountOwedPerPersonLabel.text = formatAsCurrency(splitBillAmount)
    }
    
    
    
}

// convert a numeric value to localized currency string
func formatAsCurrency(number: NSNumber) -> NSString {
    return NSNumberFormatter.localizedStringFromNumber(
        number, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
}



