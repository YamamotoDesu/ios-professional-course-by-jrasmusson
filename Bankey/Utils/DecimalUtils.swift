//
//  DecimalUtils.swift
//  Bankey
//
//  Created by 山本響 on 2022/02/13.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
