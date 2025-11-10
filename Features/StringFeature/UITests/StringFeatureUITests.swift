//
//  StringFeatureUITests.swift
//  StringFeature
//
//  Created by Abdul Ahad on 09.11.25.
//

import XCTest

final class StringFeatureUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testStringFeatureUI() throws {
        XCTAssertTrue(app.staticTexts["String Feature Demo"].exists)
        XCTAssertTrue(app.staticTexts["ConcatenateResult"].exists)
    }

    func testStringOperations() throws {
        XCTAssertTrue(app.staticTexts["LengthResult"].exists)
    }
}
