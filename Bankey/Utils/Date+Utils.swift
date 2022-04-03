//
//  Date+Utils.swift
//  Bankey
//
//  Created by 山本響 on 2022/04/03.
//

import Foundation

extension Date {
    static var bankeyDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        return formatter
    }
    
    var monthDayYearString: String {
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "yyyy年M月d日(EEEEE)"
        return dateFormatter.string(from: self)
    }
}
