//
//  MathHelper.swift
//  manual_Trigger
//
//  Created by Abdul Ahad on 07.11.25.
//

import Foundation

public struct MathHelper {
    public static func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }

    public static func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b
    }

    // New function: subtract two numbers
    public static func subtract(_ a: Int, _ b: Int) -> Int {
        return a - b
    }

    // New function: divide two numbers
    public static func divide(_ a: Int, _ b: Int) -> Int {
        guard b != 0 else { return 0 }
        return a / b
    }

    // New function: modulo operation
    public static func modulo(_ a: Int, _ b: Int) -> Int {
        guard b != 0 else { return 0 }
        return a % b
    }

    public init() {}
}
