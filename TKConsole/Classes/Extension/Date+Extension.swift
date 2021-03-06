//
//  Date+Extension.swift
//  TKConsole
//
//  Created by zhengxianda on 2018/5/27.
//

import Foundation

extension Date {
    init(_ timestampString: String) {
        self.init(timeIntervalSince1970: TimeInterval(timestampString) ?? 0)
    }
    
    func timestampString() -> String {
        return String(self.timeIntervalSince1970)
    }
    
    var fullDescription: String {
        get {
            return DateFormatter().string(from: self, with: TKFullFormat)
        }
    }
    
    var dateDescription: String {
        get {
            return DateFormatter().string(from: self, with: TKDateFormat)
        }
    }
    
    var timeDescription: String {
        get {
            return DateFormatter().string(from: self, with: TKTimeFormat)
        }
    }
    
    var weeDate: Date {
        get {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day], from: self)
            let weeDate = calendar.date(from: components)!
            return weeDate
        }
    }
    
    var hugeDate: Date {
        get {
            let calendar = Calendar.current
            var components = calendar.dateComponents([.year, .month, .day], from: self)
            components.setValue(components.day! + 1, for: .day)
            let hugeDate = calendar.date(from: components)!
            return hugeDate
        }
    }
    
}
