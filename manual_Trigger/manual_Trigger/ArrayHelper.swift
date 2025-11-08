//
//  ArrayHelper.swift
//  manual_Trigger
//
//  Created by Abdul Ahad on 07.11.25.
//

import Foundation

struct ArrayHelper {
    static func filterEven(_ numbers: [Int]) -> [Int] {
        return numbers.filter { $0 % 2 == 0 }
    }

    static func count<T>(_ array: [T]) -> Int {
        return array.count
    }
}
