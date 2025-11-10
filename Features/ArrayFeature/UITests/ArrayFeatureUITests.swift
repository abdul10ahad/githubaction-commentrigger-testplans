//
//  ArrayFeatureUITests.swift
//  ArrayFeature
//
//  Created by Abdul Ahad on 09.11.25.
//

import XCTest

final class ArrayFeatureUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testArrayFeatureUI() throws {
        XCTAssertTrue(app.staticTexts["Array Feature Demo"].exists)
        XCTAssertTrue(app.staticTexts["FilterEvenResult"].exists)
    }

    func testArrayOperations() throws {
        XCTAssertTrue(app.staticTexts["CountResult"].exists)
        XCTAssertTrue(app.staticTexts["SumResult"].exists)
    }
}
