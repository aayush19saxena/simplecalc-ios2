//
//  ViewController.swift
//  SimpleCalciOS
//
//  Created by Aayush  Saxena on 1/28/18.
//  Copyright © 2018 Aayush  Saxena. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false
    var operation = 0
    var numberList: [Double] = []
    var calculations: [String] = []
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func history(_ sender: UIButton) {
        if calculations.count > 0 {
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyViewController = segue.destination as! HistoryViewController
        historyViewController.calculations = calculations
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if(sender.tag == 19) {
            numberOnScreen = Double(label.text!)!
            label.text = "FACT"
            var fact = 1
            for i in 2...Int(numberOnScreen) {
                fact *= i
            }
            label.text = String(fact)
            calculations.append("\(numberOnScreen) FACT = \(fact)")
        } else if(performingMath == true ) {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        } else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            numberList.append(numberOnScreen)
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16 {
            // if there is a number present and the button in not clear or equals
            previousNumber = Double(label.text!)!
            if(sender.tag == 12) {
                // Divide
                label.text = "/"
            } else if (sender.tag == 13) {
                // Multiply
                label.text = "x"
            } else if (sender.tag == 14) {
                // Subtract
                label.text = "-"
            } else if (sender.tag == 15) {
                // Add
                label.text = "+"
            } else if (sender.tag == 17) {
                // Average
                numberList.append(Double(label.text!)!)
                label.text = "Avg"
            } else if (sender.tag == 18) {
                // Count
                numberList.append(Double(label.text!)!)
                label.text = "Count"
            } else if (sender.tag == 20) {
                // Mod
                label.text = "%"
            }
            operation = sender.tag
            performingMath = true;
        } else if (sender.tag == 16) {
            if (operation == 12) {
                // Divide
                label.text = String(previousNumber / numberOnScreen)
                calculations.append("\(previousNumber) / \(numberOnScreen) = \(previousNumber / numberOnScreen)")
            }
            if (operation == 13) {
                // Multiply
                label.text = String(previousNumber * numberOnScreen)
                calculations.append("\(previousNumber) * \(numberOnScreen) = \(previousNumber * numberOnScreen)")
            }
            if (operation == 14) {
                // Subtract
                label.text = String(previousNumber - numberOnScreen)
                calculations.append("\(previousNumber) - \(numberOnScreen) = \(previousNumber - numberOnScreen)")
            }
            if (operation == 15) {
                // Add
                label.text = String(previousNumber + numberOnScreen)
                calculations.append("\(previousNumber) + \(numberOnScreen) = \(previousNumber + numberOnScreen)")
            }
            if (operation == 17) {
                // Average
                var sum : Double = 0
                var list: String = ""
                for num in numberList {
                    sum += num
                    list.append("\(num) ")
                }
                let avg = sum / Double(numberList.count)
                list.append("AVG = \(avg)")
                calculations.append(list)
                label.text = String(avg)
            }
            if (operation == 18) {
                // Count
                var list: String = ""
                for num in numberList {
                    list.append("\(num) ")
                }
                list.append("COUNT = \(numberList.count)")
                calculations.append(list)
                label.text = String(numberList.count)
            }
            if (operation == 20) {
                // Mod
                label.text = String(abs(previousNumber).truncatingRemainder(dividingBy: abs(numberOnScreen)))
                let ans = abs(previousNumber).truncatingRemainder(dividingBy: abs(numberOnScreen))
                calculations.append("\(previousNumber) % \(numberOnScreen) = \(ans)")
            }
            numberList = []
        } else if (sender.tag == 11) {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            numberList = []
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


