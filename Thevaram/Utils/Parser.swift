//
//  RTFParser.swift
//  Thevaram
//
//  Created by Karthik on 11/03/20.
//  Copyright © 2020 Karthik. All rights reserved.
//

import Foundation

struct Parser {
    func parse() -> NSAttributedString {
        let path = Bundle.main.url(forResource: "text1", withExtension: "rtf")!
        let opts : [NSAttributedString.DocumentReadingOptionKey : Any] =
        [.documentType : NSAttributedString.DocumentType.rtf]
        var d : NSDictionary? = nil
        let text = try! NSAttributedString(url: path, options: opts, documentAttributes: &d)
        return text

    }
    
    func textParse()->String {
        let path = Bundle.main.path(forResource: "t1", ofType: "txt")
        var text = ""
        do {
            text = try String(contentsOfFile: path!)
        } catch {
            print(error)
        }
        return text
    }
    
}
