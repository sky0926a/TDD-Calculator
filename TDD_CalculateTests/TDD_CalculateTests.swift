//
//  TDD_CalculateTests.swift
//  TDD_CalculateTests
//
//  Created by Jimmy Li on 2019/3/14.
//  Copyright © 2019 Jimmy Li. All rights reserved.
//

import XCTest
@testable import TDD_Calculate

class TDD_CalculateTests: XCTestCase {
    
    let model: ViewModel = ViewModel()
    var result: String = "0"

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        model.output.handler = { [weak self] (value) in
            self?.result = value
        }
        testExample()
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        testAddition()
//        testSubtraction()
//        testDivision()
//        testMultiplication()
//        testEqual()
//        testSign()
//        testClean()
//        testPercentage()
//        testDigit()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

extension TDD_CalculateTests {
    
    func testUtil() {
        let dotString: String = "123."
        XCTAssertTrue(dotString.withoutTailDot == "123")
        XCTAssertTrue(dotString.value == 123.0)
        XCTAssertTrue(123.0.toString == "123")
        XCTAssertTrue(dotString.isLeaderZero == false)
    }
    
    func testClean() {
        result = "1234"
        model.put(.clean)
        XCTAssertTrue(result == "0")
    }
    
    func testNumber() {
        model.put(.clean)
        model.put(.zero)
        XCTAssertTrue(result == "0")
        model.put(.one)
        XCTAssertTrue(result == "1")
        model.put(.one)
        XCTAssertTrue(result == "11")
        model.put(.one)
        XCTAssertTrue(result == "111")
        model.put(.clean)
    }

    func testAddition() {
        model.put(.clean)
        model.put(.one)
        model.put(.addition)
        XCTAssertTrue(result == "1")
        model.put(.seven)
        XCTAssertTrue(result == "7")
        model.put(.addition)
        XCTAssertTrue(result == "8")
        model.put(.six)
        model.put(.five)
        XCTAssertTrue(result == "65")
        model.put(.addition)
        XCTAssertTrue(result == "73")
    }
    func testSubtraction() {
        model.put(.clean)
        model.put(.eight)
        model.put(.nine)
        XCTAssertTrue(result == "89")
        model.put(.subtraction)
        model.put(.two)
        XCTAssertTrue(result == "2")
        model.put(.four)
        XCTAssertTrue(result == "24")
        model.put(.subtraction)
        XCTAssertTrue(result == "65")
        model.put(.zero)
        XCTAssertTrue(result == "0")
        model.put(.subtraction)
        XCTAssertTrue(result == "65")
    }
    func testDivision() {
        model.put(.clean)
        model.put(.eight)
        model.put(.division)
        model.put(.four)
        model.put(.division)
        XCTAssertTrue(result == "32")
        model.put(.two)
        XCTAssertTrue(result == "2")
        model.put(.division)
        XCTAssertTrue(result == "64")
        model.put(.zero)
        model.put(.division)
        XCTAssertTrue(result == "0")
    }
    func testMultiplication() {
        model.put(.clean)
        model.put(.eight)
        model.put(.four)
        model.put(.multiplication)
        XCTAssertTrue(result == "84")
        model.put(.two)
        XCTAssertTrue(result == "2")
        model.put(.multiplication)
        XCTAssertTrue(result == "42")
        model.put(.six)
        XCTAssertTrue(result == "6")
        model.put(.multiplication)
        XCTAssertTrue(result == "7")
    }
    func testEqual() {
        model.put(.clean)
        model.put(.one)
        model.put(.addition)
        XCTAssertTrue(result == "1")
        model.put(.seven)
        XCTAssertTrue(result == "7")
        model.put(.equal)
        XCTAssertTrue(result == "8")
        
        model.put(.clean)
        model.put(.eight)
        model.put(.subtraction)
        XCTAssertTrue(result == "8")
        model.put(.seven)
        XCTAssertTrue(result == "7")
        model.put(.equal)
        XCTAssertTrue(result == "1")
        
        model.put(.clean)
        model.put(.eight)
        model.put(.division)
        XCTAssertTrue(result == "8")
        model.put(.seven)
        XCTAssertTrue(result == "7")
        model.put(.equal)
        XCTAssertTrue(result == "56")
        
        model.put(.clean)
        model.put(.eight)
        model.put(.multiplication)
        XCTAssertTrue(result == "8")
        model.put(.four)
        XCTAssertTrue(result == "4")
        model.put(.equal)
        XCTAssertTrue(result == "2")
    }
    func testSign() {
        model.put(.clean)
        model.put(.three)
        model.put(.sign)
        XCTAssertTrue(result == "-3")
        model.put(.sign)
        XCTAssertTrue(result == "3")
    }
    func testPercentage() {
        model.put(.clean)
        model.put(.eight)
        model.put(.percentage)
        XCTAssertTrue(result == "0.08")
        model.put(.percentage)
        XCTAssertTrue(result == "0.0008")
    }
    func testDigit() {
        model.put(.clean)
        model.put(.eight)
        model.put(.digit)
        XCTAssertTrue(result == "8.")
        model.put(.digit)
        XCTAssertTrue(result == "8.")
    }
}
