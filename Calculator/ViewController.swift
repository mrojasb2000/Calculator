//
//  ViewController.swift
//  Calculator
//
//  Created by Mauricio Rojas on 1/2/19.
//  Copyright © 2019 Mauricio Rojas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let buttonTagClear = 11;
    let buttonTagEquals = 16;
    
    let labelDivide = "/";
    let buttonTagDivide = 12;
    let labelMultiply = "*";
    let buttonTagMultiply = 13;
    let labelMinus = "-";
    let buttonTagMinus = 14;
    let labelPlus = "+";
    let buttonTagPlus = 15;
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath: Bool = false;
    var operation = 0;
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != buttonTagClear && sender.tag != buttonTagEquals {
            operation = sender.tag
            previousNumber = Double(label.text!)!
            labelOnScreen(operationRequest: operation)
            performingMath = true;
        }
        else if sender.tag == buttonTagEquals
        {
            calculate(operationRequest: operation)
        } else if sender.tag == buttonTagClear {
            clearScreen()
        }
    }
    
    private func labelOnScreen(operationRequest: Int){
        switch operationRequest {
        case buttonTagDivide:
            label.text = labelDivide
        case buttonTagMultiply:
            label.text = labelMultiply
        case buttonTagMinus:
            label.text = labelMinus
        case buttonTagPlus:
            label.text = labelPlus
        default:
            label.text = "Err!"
        }
    }
    
    private func calculate(operationRequest: Int){
        switch operationRequest {
        case buttonTagDivide:
            label.text = String(previousNumber / numberOnScreen)
        case buttonTagMultiply:
            label.text = String(previousNumber * numberOnScreen)
        case buttonTagMinus:
            label.text = String(previousNumber - numberOnScreen)
        case buttonTagPlus:
            label.text = String(previousNumber + numberOnScreen)
        default:
            label.text = "-2147217843"
        }
    }
    
    private func clearScreen(){
        operation = 0;
        previousNumber = 0;
        numberOnScreen = 0;
        label.text = "";
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

