//
//  FileLoaderUnitTest.swift
//  SepiaCodingTaskTests
//
//  Created by Saurav Sagar on 04/03/23.
//

import XCTest
@testable import SepiaCodingTask

final class FileLoaderUnitTest: XCTestCase {
    
    func test_FileLoader_With_Returns_ValiedPath() {
        XCTAssertNotNil(FileLoader.readLocalFile("pets_list"))
    }
}
