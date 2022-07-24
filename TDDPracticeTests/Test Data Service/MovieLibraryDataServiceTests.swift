//
//  MovieLibraryDataServiceTests.swift
//  TDDPracticeTests
//
//  Created by Zulqarnain on 24/07/2022.
//

import XCTest
import TDDPractice
class MovieLibraryDataServiceTests: XCTestCase {
    
    var sut: MovieLibraryDataService?
    var tableView: UITableView?
    
    let horror = Movie(title: "Friend Request", releaseDate: "2016")
    let comedy = Movie(title: "Let's Be Cops", releaseDate: nil)
    let action = Movie(title: "JarHeads")
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut?.movieManager = MovieManager()
        tableView = UITableView()
        tableView?.dataSource = sut
        tableView?.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func test_tableView_hasTwoSections(){
        let section = tableView?.numberOfSections
        XCTAssertEqual(section, 2)
    }
    
    func test_tableView_SectionOne_ReturnsMoviedToSeeCount(){
        sut?.movieManager?.addMovie(movie: horror)
        sut?.movieManager?.addMovie(movie: comedy)
        XCTAssertEqual(tableView?.numberOfRows(inSection: 0), 2)
        
        sut?.movieManager?.addMovie(movie: action)
        tableView?.reloadData()
        
        XCTAssertEqual(tableView?.numberOfRows(inSection: 0), 3)
    }
    func test_TableViewSectionTwo_ReturnsMoviesSeenCount(){
        sut?.movieManager?.addMovie(movie: horror)
        sut?.movieManager?.addMovie(movie: comedy)
        sut?.movieManager?.checkOffMovieAtIndex(index: 0)
        XCTAssertEqual(tableView?.numberOfRows(inSection: 1), 1)
        
        sut?.movieManager?.checkOffMovieAtIndex(index: 0)
        tableView?.reloadData()
        XCTAssertEqual(tableView?.numberOfRows(inSection: 1), 2)
    }
}
