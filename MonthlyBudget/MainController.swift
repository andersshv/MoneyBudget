//
//  ViewController.swift
//  MonthlyBudget
//
//  Created by Anders Strand-Holm Vinther on 14/01/2020.
//  Copyright © 2020 ashvpps. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var AmountPerMonthLabel: UILabel!
    @IBOutlet weak var AmountPerMonthTextField: UITextField!
    
    @IBOutlet weak var AvailablePerDayLabel: UILabel!
        
    @IBOutlet weak var NewPostingDescriptionTextField: UITextField!    
    @IBOutlet weak var NewPostingAmountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateGUI()
    }

    @IBAction func newAmountPerMonthSubmitButtonClicked(_ sender: Any) {
        if let amount = AmountPerMonthTextField.text {
            AmountPerMonthTextField.text = ""
            saveAmountPerMonth(amount: Int(amount)!)
        }
        updateGUI()
    }
    
    func updateGUI() {
        let amountPerMonth = getAmountPerMonth()
        AmountPerMonthLabel.text = String(amountPerMonth)
        
        let usedSoFar = getAmountUsedSoFar()
        let daysLeft = getDaysLeftInMonth()
        
        let moneyLeft = amountPerMonth - usedSoFar
        let availablePerDay = Int(moneyLeft / daysLeft)
        AvailablePerDayLabel.text = String(availablePerDay)
    }

    @IBAction func newPostingSubmitButtonClicked(_ sender: Any) {
        if let description = NewPostingDescriptionTextField.text, let amount = NewPostingAmountTextField.text {
            NewPostingDescriptionTextField.text = ""
            NewPostingAmountTextField.text = ""
            saveNewPosting(description, Int(amount)!)
        }
        updateGUI()
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        clearMonth();
        updateGUI()
    }
}

