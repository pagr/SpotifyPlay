//
//  Date.swift
//  Santander Mobile App Sweden
//
//  Created by Paul Griffin on 2017-02-14.
//  Copyright © 2017 Santander. All rights reserved.
//

import Foundation

extension Date{
    var formattedString:String{
        get{
            
            /*let seconds = -self.timeIntervalSinceNow
            
            if seconds < 60{//less than a minute old
                return "Nyss"
            }
            
            let minutes = Int(seconds / 60)
            if minutes == 1{ //Age < 2 minutes
                return "1 minut"
            }else if minutes < 60 {// 2 ..< 60 minutes
                return "\(minutes) minuter"
            }
            
            let hours = Int(minutes / 60)
            if hours == 1{ //Age 1 hour
                return "1 timme"
            }else if hours < 24 {// 2 ..< 24 hours
                return "\(hours) timmar"
            }
            
            let days = Int(hours / 24)
            if days == 1{// yesterday
                return "Igår"
            }*/
            let df = DateFormatter()
            df.dateFormat="yyyy-MM-dd"
            return df.string(from: self)
        }
    }
    
    public static func fromWebString(string: String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: string)
    }
    
    public var webFormatted: String{
        get{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.S"
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            return dateFormatter.string(from: self)+"Z"
        }
    }
    
    var year: Int{
        get{
            return Calendar.current.component(.year , from: self)
        }
    }
    var month: Int{
        get{
            return Calendar.current.component(.month , from: self)
        }
    }
}
