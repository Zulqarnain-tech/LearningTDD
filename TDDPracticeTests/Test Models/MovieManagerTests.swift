//
//  MovieManagerTests.swift
//  TDDPracticeTests
//
//  Created by Zulqarnain on 16/07/2022.
//

import XCTest
import TDDPractice
class MovieManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Mark: - Check Initial Movie Count Values
    func moviesToSeeAndSeen_ReturnsZero(){
        let (toSeeMoviesCount, seenMoviesCount) = moviesToSeeAndSeenSUT()
        XCTAssertEqual(toSeeMoviesCount, 0)
        XCTAssertEqual(seenMoviesCount, 0)
    }
    private func moviesToSeeAndSeenSUT() -> (toSeeMoviesCount: Int, seenMoviesCount: Int){
        let sut = MovieManager()
        let toSeeMoviesCount = sut.movieToSeeCount
        let seenMoviesCount = sut.movieSeenCount
        return (toSeeMoviesCount, seenMoviesCount)
    }
    
    func test_addMovieToSee_ReturnsOne(){
        let testMovie = Movie(title: "Salt")
        let sut = MovieManager()
        sut.addMovie(movie: testMovie)
        XCTAssertEqual(sut.movieToSeeCount, 1)
    }
}

