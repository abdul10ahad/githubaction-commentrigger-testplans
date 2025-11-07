//
//  manual_TriggerTests.swift
//  manual_TriggerTests
//
//  Created by Abdul Ahad on 07.11.25.
//

import Testing
@testable import manual_Trigger

struct manual_TriggerTests {

    @Test func testFirst() async throws {
        // Simulate First Test Leg
        let value = 2 + 2
        #expect(value == 4, "Basic math should work")
    }

    @Test func testSecond() async throws {
        // Simulate Second Test Leg
        let text = "Hello"
        #expect(text.count == 5, "String length should be 5")
    }

}
