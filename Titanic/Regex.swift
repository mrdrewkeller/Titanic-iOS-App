//
//  Regex.swift
//  Titanic
//
//  Created by Travis on 12/6/15.
//  Copyright © 2015 Drew Keller. All rights reserved.
//

import Foundation

class Regex {
    let internalExpression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        self.internalExpression = try! NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive)
    }
    
    func test(input: String) -> Bool {
        let matches = self.internalExpression.matchesInString(input, options: NSMatchingOptions.ReportProgress, range:NSMakeRange(0, input.characters.count))
        return matches.count > 0
    }
}
