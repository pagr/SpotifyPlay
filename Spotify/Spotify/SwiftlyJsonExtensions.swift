//
//  SwiftlyJsonExtensions.swift
//  Santander Mobile App Sweden
//
//  Created by Paul Griffin on 2017-02-10.
//  Copyright © 2017 Santander. All rights reserved.
//

import Foundation

extension JSON {
    var date: Date? {
        get{
            guard let string = self.string else { return nil }
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter.date(from: string)
        }
    }
    var decimalWith2DecimalPlaces: Decimal?{
        if let value = (self as? NSNumber){
            let decimalÖren = NSDecimalNumber(decimal: value.decimalValue * 100)
            let decimal = decimalÖren.rounding(accordingToBehavior: nil)
            return decimal.decimalValue / 100
        }
        return nil
    }
}
