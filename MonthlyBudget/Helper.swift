//
//  Helper.swift
//  MonthlyBudget
//
//  Created by Anders Strand-Holm Vinther on 15/01/2020.
//  Copyright © 2020 ashvpps. All rights reserved.
//

import Foundation

func getDaysLeftInMonth() -> Int {
    let date = Date()
    let year = getYear(date)
    let month = getMonth(date)
    let daysInMonth = getDaysInMonth(year, month);
    let day = getDay(date)
    return daysInMonth - Int(day)! + 1
}

func getYear(_ date: Date) -> String {
    return String(getDateSplit(date)[0])
}

func getMonth(_ date: Date) -> String {
    return String(getDateSplit(date)[1])
}

func getDay(_ date: Date) -> String {
    let daysPart = getDateSplit(date)[2]
    return String(daysPart.prefix(2));
}

func getDateSplit(_ date: Date) -> [String.SubSequence] {
    let dateString = date.description
    let dateStringSplit = dateString.split(separator: "-")
    return dateStringSplit
}

func getDaysInMonth(_ year: String, _ month: String) -> Int {
    let dateComponents = DateComponents(year: Int(year), month: Int(month))
    let calendar = Calendar.current
    let date = calendar.date(from: dateComponents)!

    let range = calendar.range(of: .day, in: .month, for: date)!
    let numDays = range.count
    return numDays;
}

/******** STORAGE *********/

let amountPerMonth = "amountPerMonth"

func getAmountPerMonth() -> Int {
    if let val = getSavedValue(amountPerMonth) {
        return val
    }
    return 0
}

func saveAmountPerMonth(amount: Int) {
    UserDefaults.standard.set(amount, forKey: amountPerMonth)
}

func getAmountUsedSoFar() -> Int {
    let date = Date()
    let year = getYear(date)
    let month = getMonth(date)
    let key = year + month
    let spendingsForMonth = getSavedValue(key)
    
    return 1000;
}

func saveNewPosting(_ description: String, _ amount: Int) {
    
}

func getSavedValue(_ key: String) -> Int? {
    return UserDefaults.standard.integer(forKey: key)
}
