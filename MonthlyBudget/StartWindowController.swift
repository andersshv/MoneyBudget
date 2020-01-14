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
    }
    
    func showMonthlyBudget() {
        if let mb = UserDefaults.standard.string(forKey: "MonthlyBudget") {
            MonthlyBudgetTitle.text = "Monthly Budget: \(mb)"
        } else {
            MonthlyBudgetTitle.text = "Monthly Budget:"
        }
    }
    
    func showAvailableRestMonth() {
        let calendar = Calendar.current
        let date = Date()
        let t = date.description(with: nil)
        
    }
    
}

