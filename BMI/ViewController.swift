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

    @IBOutlet var vyska: UITextField!
    @IBOutlet var vaha: UITextField!
    @IBOutlet weak var result: UITextView!
    
    //needs changed to english.
    func vypocet_bmi(_ vaha: Float, vyska: Float) -> Float {
        let vyska = vyska/100
        let vypocet = ((vaha)/(vyska*vyska))
        return vypocet
    }
    
    @IBAction func vypocitat(_ sender: UIButton) {
        hideKeyboardWhenTappedAround()
        if vaha.text != "" && vyska.text != "" {
            let vypocet = vypocet_bmi((vaha.text! as NSString).floatValue, vyska: (vyska.text! as NSString).floatValue)
            
            if vypocet<=16.5 {
                result.text = "BMI = " + String(format: "%.2f",vypocet) + " - trpíte těžkou podvýživou"
                result.textColor = UIColor.blue

            }else if vypocet<=18.5 {
                result.text = "BMI = " + String(format: "%.2f",vypocet) + " - suffer from malnutrition"
                result.textColor = UIColor.blue
                
            }else if vypocet<=25 {
                result.text = "BMI = " + String(format: "%.2f",vypocet) + "- ideal weight"
                result.textColor = UIColor.green

            }else if vypocet<=30 {
                result.text = "BMI = " + String(format: "%.2f",vypocet) + " - overweight"
                result.textColor = UIColor.orange
                
            }else if vypocet<=35 {
                result.text = "BMI = " + String(format: "%.2f",vypocet) + " - have mild obesity"
                result.textColor = UIColor.orange
                
            }else if vypocet<=40 {
                result.text = "BMI = " + String(format: "%.2f",vypocet) + " - suffers from moderate obesity"
                result.textColor = UIColor.orange
                
            }else if vypocet>40 {
                result.text = "BMI = " + String(format: "%.2f",vypocet) + " - suffer from morbid obesity"
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


