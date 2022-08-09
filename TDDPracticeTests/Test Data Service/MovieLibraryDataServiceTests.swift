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
    
    // Mark: - Cells
    func test_Cell_RowAtIndex_ReturnsMovieCell(){
        sut?.movieManager?.addMovie(movie: comedy)
        tableView?.reloadData()
        let cellQueried = tableView?.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func test_Cell_ShoyldDequeueCell(){
        let mock = TableViewMock()
        mock.dataSource = sut
        mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellID")
        sut?.movieManager?.addMovie(movie: horror)
        mock.reloadData()
        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mock.cellDequeuedProperly)
    }
}

extension MovieLibraryDataServiceTests{
    class TableViewMock: UITableView{
        var cellDequeuedProperly = false
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            self.cellDequeuedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}
