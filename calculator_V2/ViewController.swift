//
//  ViewController.swift
//  calculator_V2
//
//  Created by Mohamed AbdElhakam on 13/05/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func numberBtn(_ sender: UIButton) {
        resultLabel.text = resultLabel.text! + String(sender.tag)
    }
    
    @IBAction func operationBtn(_ sender: UIButton) {
        var operationString = ""
        let operationTag = sender.tag
        switch operationTag{
        case 11: // /
            operationString = "/"
        case 12: //*
            operationString = "*"
        case 13: //-
            operationString = "-"
        case 14: //+
            operationString = "+"
        case 15:
            operationString = "."
      
        default:
            print("there is mistake")
        }
        resultLabel.text! += operationString
    }
    
    @IBAction func equalBtn(_ sender: Any) {
       //using regular expression to match valid text
        let testString = resultLabel.text!
        let range = NSRange(location: 0, length: testString.utf16.count)
        let regex = try! NSRegularExpression(pattern: "^[0-9]+([*/+-][0-9]+)+[0-9]*$")
//        let result = regex.firstMatch(in: testString, options: [], range: range) == nil
        if  regex.firstMatch(in: testString, options: [], range: range) != nil{
            let expression = NSExpression(format: resultLabel.text! )
            let finalResult = expression.expressionValue(with: nil, context: nil) as! Double
                resultLabel.text = String(finalResult)
        }else{
            let alart = UIAlertController(title: "This expression is not valid", message: "Please, enter valid expression ", preferredStyle: .alert)
            alart.addAction(UIAlertAction(title: "Cansel", style: .cancel, handler: nil))
            present(alart, animated: true, completion: nil)
        }
    }
    
    @IBAction func clearBtn(_ sender: Any) {
        resultLabel.text = ""
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        resultLabel.text!.removeLast()
        resultLabel.text = resultLabel.text!
        
    }
    
}


