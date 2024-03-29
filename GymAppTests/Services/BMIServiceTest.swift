//
//  BMIServiceTest.swift
//  GymAppTests
//
//  Created by Bryan Albrecht on 16.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import XCTest

@testable import GymApp

class BMIServiceTest: XCTestCase {

    var bmiService = BMIService()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBMICalculationCommonValues(){
        let testHeight = 180;
        let testWeight = 100;
        let expectedValue = 30.8641975308642;
    
        let bmi =  try? bmiService.calculateBMI(height: testHeight, weight: testWeight)
        
        XCTAssertNotNil(bmi)
        XCTAssertEqual(bmi!,expectedValue,accuracy: 0.00001)
    }
    
    func testBMICalculationZerroHeight(){
        let testHeight = 0;
        let testWeight = 100;
        
        XCTAssertThrowsError(try bmiService.calculateBMI(height: testHeight, weight: testWeight))
    }
    
    func testBMICalculationZerroHWeight(){
        let testHeight = 180;
        let testWeight = 0;
        
        XCTAssertThrowsError(try bmiService.calculateBMI(height: testHeight, weight: testWeight))
    }

}
