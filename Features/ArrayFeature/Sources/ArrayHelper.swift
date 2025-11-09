//
//  ArrayHelper.swift
//  manual_Trigger
//
//  Created by Abdul Ahad on 07.11.25.
//

import Foundation

public struct ArrayHelper {
    public static func filterEven(_ numbers: [Int]) -> [Int] {
        return numbers.filter { $0 % 2 == 0 }
    }

    public static func count<T>(_ array: [T]) -> Int {
        return array.count
    }

    // New function: sum array of integers
    public static func sum(_ numbers: [Int]) -> Int {
        return numbers.reduce(0, +)
    }

    public init() {}
}
