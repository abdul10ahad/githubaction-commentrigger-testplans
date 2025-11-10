//
//  MathFeatureUITests.swift
//  MathFeature
//
//  Created by Abdul Ahad on 09.11.25.
//

import XCTest

final class MathFeatureUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testMathFeatureUI() throws {
        XCTAssertTrue(app.staticTexts["Math Feature Demo"].exists)
        XCTAssertTrue(app.staticTexts["AddResult"].exists)
        XCTAssertTrue(app.staticTexts["MultiplyResult"].exists)
    }

    func testMathCalculations() throws {
        // Verify the calculations are displayed
        XCTAssertTrue(app.staticTexts["SubtractResult"].exists)
        XCTAssertTrue(app.staticTexts["DivideResult"].exists)
        XCTAssertTrue(app.staticTexts["ModuloResult"].exists)
        XCTAssertTrue(app.staticTexts["PowerResult"].exists)
        XCTAssertTrue(app.staticTexts["AbsResult"].exists)
    }
}
