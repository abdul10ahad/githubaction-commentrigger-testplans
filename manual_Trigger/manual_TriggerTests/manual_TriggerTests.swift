//
//  manual_TriggerTests.swift
//  manual_TriggerTests
//
//  Created by Abdul Ahad on 07.11.25.
//

import Testing

struct manual_TriggerTests {

    // First Leg Tests
    @Test func testMathAddition() async throws {
        let value = 2 + 2 +2
        #expect(value == 6, "Addition should work")
    }

    @Test func testMathMultiplication() async throws {
        let value = 3 * 4
        #expect(value == 12, "Multiplication should work")
    }

    // Second Leg Tests
    @Test func testStringLength() async throws {
        let text = "Hello"
        #expect(text.count == 5, "String length should be 5")
    }

    @Test func testStringConcatenation() async throws {
        let result = "Hello" + " " + "World"
        #expect(result == "Hello World", "String concatenation should work")
    }

    // Third Leg Tests
    @Test func testArrayOperations() async throws {
        let numbers = [1, 2, 3, 4, 5]
        #expect(numbers.count == 5, "Array should have 5 elements")
        #expect(numbers.first == 1, "First element should be 1")
    }

    @Test func testArrayFiltering() async throws {
        let numbers = [1, 2, 3, 4, 5, 6]
        let evens = numbers.filter { $0 % 2 == 0 }
        #expect(evens.count == 3, "Should have 3 even numbers")
    }

}
