//
//  ServiceUnitTest.swift
//  SepiaCodingTaskTests
//
//  Created by Saurav Sagar on 04/03/23.
//

import XCTest
@testable import SepiaCodingTask

final class ServiceUnitTest: XCTestCase {
    
    func test_Service_With_Returns_ValiedResponse() {
        if let data = FileLoader.readLocalFile("pets_list") {
            
            let expectation = self.expectation(description: "Returns_ValiedResponse")
            
            Service.sharedInstance.getAllPetData(data) { (petData) in
                XCTAssertNotNil(petData)
                XCTAssertEqual(petData?.count != 0, true)
                expectation.fulfill()
                
            }
            
            waitForExpectations(timeout: 5)
        }
    }
}
