//
//  Helper.swift
//  MonthlyBudget
//
//  Created by Anders Strand-Holm Vinther on 15/01/2020.
//  Copyright © 2020 ashvpps. All rights reserved.
//

import Foundation

func getDayFromDate(date: Date) -> String {
    let dateString = date.description
    let dateStringSplit = dateString.split(separator: "-")
    let daysPart = dateStringSplit[2]
    return String(daysPart.prefix(2));
}

func getMonthFromDate(date: Date) -> String {
    let dateString = date.description
    let dateStringSplit = dateString.split(separator: "-")
    return String(dateStringSplit[1]);
}

func getYearFromDate(date: Date) -> String {
    let dateString = date.description
    let dateStringSplit = dateString.split(separator: "-")
    return String(dateStringSplit[0]);
}

func getNumberOfDaysInMonth(year: String, month: String) -> Int {
    let dateComponents = DateComponents(year: Int(year), month: Int(month))
    let calendar = Calendar.current
    let date = calendar.date(from: dateComponents)!

    let range = calendar.range(of: .day, in: .month, for: date)!
    let numDays = range.count
    return numDays;
}

func getUsedSoFarThisMonth() -> Int {
    return 1000;
}
