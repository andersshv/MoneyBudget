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
    if let val = getSavedIntValue(amountPerMonth) {
        return val
    }
    return 0
}

func saveAmountPerMonth(amount: Int) {
    UserDefaults.standard.set(amount, forKey: amountPerMonth)
}

func getCurrentMonthKey() -> String {
    let date = Date()
    let year = getYear(date)
    let month = getMonth(date)
    return year + month
}

func getAmountUsedSoFar() -> Int {
    let key = getCurrentMonthKey()
    if let postingsJson = getSavedStringValue(key) {
        let jsonData = postingsJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        let postings = try! decoder.decode([Posting].self, from: jsonData)
        var amount = 0
        for posting in postings {
            amount += posting.amount
        }
        return amount
    }
    return 0;
}

func saveNewPosting(_ description: String, _ amount: Int) {
    let key = getCurrentMonthKey()
    var postings = [Posting]()
    if let postingsJson = getSavedStringValue(key) {
        let jsonData = postingsJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        postings = try! decoder.decode([Posting].self, from: jsonData)
    }
    postings.append(Posting(description: description, amount: amount))
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try! encoder.encode(postings)
    let jsonString = String(data: data, encoding: .utf8)!
    UserDefaults.standard.set(jsonString, forKey: key)
}

func clearMonth() {
    let key = getCurrentMonthKey()
    UserDefaults.standard.set(nil, forKey: key)
}

func getSavedIntValue(_ key: String) -> Int? {
    return UserDefaults.standard.integer(forKey: key)
}

func getSavedStringValue(_ key: String) -> String? {
    let val = UserDefaults.standard.string(forKey: key)
    return val == "" ? nil : val
}
