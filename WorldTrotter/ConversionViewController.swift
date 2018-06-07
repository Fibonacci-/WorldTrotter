//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Tyler Helwig on 4/8/18.
//  Copyright © 2018 Tyler Helwig. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
        updateCelsiusLabel()
        
        let hour = Calendar.current.component(.hour, from: Date())
        if(isEvening(hour: hour)){
            print("It's evening, setting color accordingly: hour is \(hour)")
            self.view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        } else {
            print("It's morning, leaving color as default: hour is \(hour)")
        }
        
        
        
    }
    
    func isEvening(hour:Int) -> Bool {
        if 7...16 ~= hour {
            return false
        }
        return true
    }
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet{
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        let replacementTextHasDecimalChar = NSCharacterSet.decimalDigits.isSuperset(of: (CharacterSet(charactersIn: string)))
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            print("Not entering multiple decimals")
            return false
        }else if !replacementTextHasDecimalChar {
            print("Not entering alpha char")
            return false
        } else {
            return true
        }
        
    }
    
}























