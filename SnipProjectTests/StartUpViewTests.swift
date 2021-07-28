//
//  StartUpViewTests.swift
//  SnipProjectTests
//
//  Created by King on 28/07/2021.
//

import XCTest
@testable import SnipProject

class StartUpViewTests: XCTestCase {

    var startUp: StartUpViewController?

    override func setUpWithError() throws {
        startUp = StartUpViewController()
    }

    override func tearDownWithError() throws {
        startUp = nil
    }
    
    func testButtonTap(){
//        let st = UIStoryboard.init(name: "Main", bundle: nil)
//        let vc = st.instantiateViewController(identifier: "StartUpViewController") as! StartUpViewController
////        
//        let text = vc.loginBtn.
//
//        XCTAssertEqual(text, false)
    }
   

}
