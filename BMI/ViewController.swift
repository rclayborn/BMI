//
//  ViewController.swift
//  BMI
//
//  Created by Randall Clayborn on 9/4/16.
//  Copyright © 2016 claybear39. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
          self.hideKeyboardWhenTappedAround()
    }

    @IBOutlet var height: UITextField!
    @IBOutlet var weight: UITextField!
    @IBOutlet weak var result: UITextView!
    
    //needs changed to english.
    func calculate_bmi(_ weight: Float, height: Float) -> Float {
        let height = height/100
        let calculate = ((weight)/(height*height))
        return calculate
    }
    
    @IBAction func vypocitat(_ sender: UIButton) {
        hideKeyboardWhenTappedAround()
        if weight.text != "" && height.text != "" {
            let calculate = calculate_bmi((weight.text! as NSString).floatValue, height: (height.text! as NSString).floatValue)
            
            if calculate<=16.5 {
                result.text = "BMI = " + String(format: "%.2f",calculate) + " - trpíte těžkou podvýživou"
                result.textColor = UIColor.blue

            }else if calculate<=18.5 {
                result.text = "BMI = " + String(format: "%.2f",calculate) + " - suffer from malnutrition"
                result.textColor = UIColor.blue
                
            }else if calculate<=25 {
                result.text = "BMI = " + String(format: "%.2f",calculate) + "- ideal weight"
                result.textColor = UIColor.green

            }else if calculate<=30 {
                result.text = "BMI = " + String(format: "%.2f",calculate) + " - overweight"
                result.textColor = UIColor.orange
                
            }else if calculate<=35 {
                result.text = "BMI = " + String(format: "%.2f",calculate) + " - have mild obesity"
                result.textColor = UIColor.orange
                
            }else if calculate<=40 {
                result.text = "BMI = " + String(format: "%.2f",calculate) + " - suffers from moderate obesity"
                result.textColor = UIColor.orange
                
            }else if calculate>40 {
                result.text = "BMI = " + String(format: "%.2f",calculate) + " - suffer from morbid obesity"
                result.textColor = UIColor.red
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}


