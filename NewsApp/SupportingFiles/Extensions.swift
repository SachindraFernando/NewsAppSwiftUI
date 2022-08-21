//
//  Extensions.swift
//  NewsApp
//
//  Created by Sachindra Fernando on 2022-08-21.
//

import Foundation

extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}


extension Date {
    
    
    //MARK: - CAST DATE TO STRING
    func toString(dateCast: Date, format: String )-> String{
        
        // Create Date Formatter
        let dateFormatter = DateFormatter()
        
        // Set Date Format
        dateFormatter.dateFormat = format
        
        
        return dateFormatter.string(from: dateCast)
    }
}

