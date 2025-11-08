//
//  manual_TriggerTests.swift
//  manual_TriggerTests
//
//  Created by Abdul Ahad on 07.11.25.
//

import Testing
@testable import manual_Trigger

struct manual_TriggerTests {

    // First Leg Tests - Depend on MathHelper
    @Test func testMathAddition() async throws {
        let result = MathHelper.add(2, 4)
        #expect(result == 6, "Addition should work")
    }

    @Test func testMathMultiplication() async throws {
        let result = MathHelper.multiply(3, 4)
        #expect(result == 12, "Multiplication should work")
    }

    // Second Leg Tests - Depend on StringHelper
    @Test func testStringLength() async throws {
        let length = StringHelper.length(of: "Hello")
        #expect(length == 5, "String length should be 5")
    }

    @Test func testStringConcatenation() async throws {
        let result = StringHelper.concatenate("Hello", "World")
        #expect(result == "Hello World", "String concatenation should work")
    }

    // Third Leg Tests - Depend on ArrayHelper
    @Test func testArrayOperations() async throws {
        let count = ArrayHelper.count([1, 2, 3, 4, 5])
        #expect(count == 5, "Array should have 5 elements")
    }

    @Test func testArrayFiltering() async throws {
        let numbers = [1, 2, 3, 4, 5, 6]
        let evens = ArrayHelper.filterEven(numbers)
        #expect(evens.count == 3, "Should have 3 even numbers")
    }

}
