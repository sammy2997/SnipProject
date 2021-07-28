//
//  SnipProjectTests.swift
//  SnipProjectTests
//
//  Created by King on 28/07/2021.
//

import XCTest
@testable import SnipProject

class SnipProjectTests: XCTestCase {
    
    var startUp: StartUpViewController?

    override func setUpWithError() throws {
        startUp = StartUpViewController()
    }

    override func tearDownWithError() throws {
        startUp = nil
    }

    
}
