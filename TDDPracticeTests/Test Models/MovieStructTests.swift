//
//  TDDPracticeTests.swift
//  TDDPracticeTests
//
//  Created by Zulqarnain on 16/07/2022.
//

import XCTest
import TDDPractice
class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_init_MovieWithTitle(){
        let testMovie = makeMovieSUT(title: "Get Out")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.getTitle, "Get Out")
    }
    
    func test_init_MovieWith_TitleAndReleaseDate(){
        let testMovie = makeMovieSUT(title: "Spider Man",releaseDate: "2007")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.getReleaseDate, "2007")
    }
    private func makeMovieSUT(title: String, releaseDate: String? = nil)-> (Movie){
        let testMovie = Movie(title: title, releaseDate: releaseDate)
        return testMovie
    }
}


