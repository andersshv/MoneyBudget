//
//  ViewController.swift
//  MonthlyBudget
//
//  Created by Anders Strand-Holm Vinther on 14/01/2020.
//  Copyright © 2020 ashvpps. All rights reserved.
//

import UIKit

class StartWindowController: UIViewController {

    @IBOutlet weak var MonthlyBudgetTitle: UILabel!
    @IBOutlet weak var MonthlyBudgetInputField: UITextField!
    
    @IBOutlet weak var AvailRestMonth: UILabel!
        
    @IBOutlet weak var NewPostingText: UITextField!    
    @IBOutlet weak var NewPostingAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showMonthlyBudget()
        showAvailableRestMonth()
    }

    @IBAction func monthlyBudgetSubmitClicked(_ sender: Any) {
        UserDefaults.standard.set(MonthlyBudgetInputField.text, forKey: "MonthlyBudget")
        MonthlyBudgetInputField.text = ""
        showMonthlyBudget()
        showAvailableRestMonth()
    }
    
    func showMonthlyBudget() {
        if let mb = UserDefaults.standard.string(forKey: "MonthlyBudget") {
            MonthlyBudgetTitle.text = "Monthly Budget: \(mb)"
        } else {
            MonthlyBudgetTitle.text = "Monthly Budget:"
        }
    }
    
    func showAvailableRestMonth() {
        let date = Date()
        let month = getMonthFromDate(date: date)
        let year = getYearFromDate(date: date)
        let days = getNumberOfDaysInMonth(year: year, month: month);
        let day = getDayFromDate(date: date)
        let daysRemaining = days - Int(day)! + 1
        
        if let mb = UserDefaults.standard.string(forKey: "MonthlyBudget") {
            let usedSoFar = getUsedSoFarThisMonth()
            let remainingMoney = Int(mb)! - usedSoFar
            let remainingMoneyPrDay = remainingMoney / daysRemaining
            let remToInt = Int(remainingMoneyPrDay)
            AvailRestMonth.text = String(remToInt)
        } else {
            return
        }
    }

    @IBAction func monthlyBudgetSubmitClicked(_ sender: Any) {
        var text = NewPostingText.text
        var amount = NewPostingAmount.text
    }
    
}

