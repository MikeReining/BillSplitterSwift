// Playground - noun: a place where people can play

import Cocoa

var textField: NSString = "$0.058"
var inputString = textField.substringFromIndex(1)

let billsAsFloat = (inputString as NSString).doubleValue * 10


//var displayTotal = billAmount.decimalNumberByDividingBy(100)

func formatAsCurrency(number: NSNumber) -> String {
    return NSNumberFormatter.localizedStringFromNumber(
        number, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
}

formatAsCurrency(billsAsFloat)

