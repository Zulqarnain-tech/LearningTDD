//
//  MovieManagerTests.swift
//  TDDPracticeTests
//
//  Created by Zulqarnain on 16/07/2022.
//

import XCTest
import TDDPractice
class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Mark: - Check Initial Movie Count Values
    func test_moviesToSeeAndSeen_ReturnsZero(){
        let (toSeeMoviesCount, seenMoviesCount) = moviesToSeeAndSeenSUT()
        XCTAssertEqual(toSeeMoviesCount, 0)
        XCTAssertEqual(seenMoviesCount, 0)
    }
    
    private func moviesToSeeAndSeenSUT() -> (toSeeMoviesCount: Int?, seenMoviesCount: Int?){
        let toSeeMoviesCount = sut?.movieToSeeCount
        let seenMoviesCount = sut?.movieSeenCount
        return (toSeeMoviesCount, seenMoviesCount)
    }
    
    func test_addMovieToSee_ReturnsOne(){
        let testMovie = Movie(title: "Salt")
        sut?.addMovie(movie: testMovie)
        XCTAssertEqual(sut?.movieToSeeCount, 1)
    }
    
    func test_Query_ReturnsMovieAtIndex(){
        let testMovie = Movie(title: "Grudge")
        sut?.addMovie(movie: testMovie)
        XCTAssertEqual(testMovie.getTitle, sut?.getMovieIndex(movieID: 0))
    }
    
    func test_Equatable_MovieObjects(){
        let movieOne = Movie(title: "Friends")
        let movieTwo = Movie(title: "Friends")
        XCTAssertEqual(movieOne, movieTwo)
    }
    
    func test_clearMovieArrays(){
        sut?.clearMovieDataLists()
        XCTAssertEqual(sut?.movieSeenCount, 0)
        XCTAssertEqual(sut?.movieToSeeCount, 0)
    }
}

