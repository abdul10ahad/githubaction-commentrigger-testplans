//
//  StringHelper.swift
//  manual_Trigger
//
//  Created by Abdul Ahad on 07.11.25.
//

import Foundation

struct StringHelper {
    static func concatenate(_ strings: String...) -> String {
        return strings.joined(separator: " ")
    }

    static func length(of string: String) -> Int {
        return string.count
    }
}
