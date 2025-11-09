//
//  StringHelper.swift
//  manual_Trigger
//
//  Created by Abdul Ahad on 07.11.25.
//

import Foundation

public struct StringHelper {
    public static func concatenate(_ strings: String...) -> String {
        return strings.joined(separator: " ")
    }

    public static func length(of string: String) -> Int {
        return string.count
    }

    public init() {}
}
