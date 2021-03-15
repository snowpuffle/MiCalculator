//
//  ViewController.swift
//  MiCalculator
//
//  Created by SnowPuffle on 3/14/21.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen: Double = 0;
    var operation: String = "";
    var result: Double = 0;
    
    var performingMath = false;
    var resetValue = false;
    var startNewRound = true;
    
    var numberOfOperations: Int = 0;
    
    @IBOutlet weak var numberDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Number Button is Pressed
    @IBAction func numberButton(_ sender: UIButton) {
        
        if (operation == "="){
            startNewRound = true;
            performingMath = false;
            result = 0;
        }
        // Calculator State: Active Operation
        if performingMath == true {
            // Wipe and Display
            numberDisplay.text = (sender.accessibilityLabel)!;
            // Set Calculator State to No Operation
            performingMath = false;
        }
        // Calculator State: No Operation
        else {
            // At Beginning or AC Reset
            if numberDisplay.text == "0" || resetValue == true{
                // Wipe and Display
                numberDisplay.text = (sender.accessibilityLabel)!;
            }
            // Number Input Not Completed
            else {
                // Concatenate to Number Input
                numberDisplay.text = numberDisplay.text! + (sender.accessibilityLabel)!;
            }
        }
        
        // Set Number On Screen
        numberOnScreen = Double(numberDisplay.text!)!
    }
    
    // Operator Button is Pressed
    @IBAction func operatorButtons(_ sender: UIButton) {
        
        // Set Selected Operation
        operation = (sender.accessibilityLabel)!
        
        // Calculator State: Start New Round
        if(startNewRound == true){
            // Result = Current Number On Screen
            result = numberOnScreen;
            // Change Calculator State to Intermediate Round
            startNewRound = false;
        }
        // Calculator State: Intermediate Round
        else {
            // Calculate the Current State
            calculate()
        }
        
        // Calculator State: Active Operation
        performingMath = true;
    }
    
    // "=" Button is Pressed
    @IBAction func equalsButton(_ sender: UIButton) {
        
        // Calculate the Current State
        calculate();
        
        // Display the Result
        numberDisplay.text = String(result);
        
        // Re-Initialize and Reset for New Round
        operation = "=";
        performingMath = false;
        resetValue = true;
    }
    
    // "AC" Button is Pressed
    @IBAction func clearButton(_ sender: UIButton) {
        // Reset Displayed Number
        numberDisplay.text = "0";
    }
    
    // Perform Arithmetic Operation
    func calculate(){
        switch operation {
            case "+":   // "+" Operation is Selected
                result = result + numberOnScreen;
                break;
            case "-":   // "-" Operation is Selected
                result = result - numberOnScreen;
                break;
            case "*":   // "*" Operation is Selected
                result = result * numberOnScreen;
                break;
            case "/":   // "/" Operation is Selected
                result = result / numberOnScreen;
                break;
            default:
                break;
        }
    }
}

