//
//  LibraryViewControllerTests.swift
//  TDDPracticeTests
//
//  Created by Zulqarnain on 20/07/2022.
//

import XCTest
@testable import TDDPractice
class LibraryViewControllerTests: XCTestCase {

    var sut: LibraryViewController?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as? LibraryViewController
        _ = sut?.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_LibraryVCTableViewNotNil(){
        XCTAssertNotNil(sut?.tableView)
    }
    
    func test_DataSource_setsTableViewDataSource(){
        XCTAssertNotNil(sut?.tableView.dataSource)
        XCTAssertTrue(sut?.tableView.dataSource is MovieLibraryDataService)
    }
    
    func test_Delegate_setsTableViewDelegate(){
        XCTAssertNotNil(sut?.tableView.delegate)
        XCTAssertTrue(sut?.tableView.delegate is MovieLibraryDataService)
    }
    
    func test_dataServiceViewDidLoad_DataServiceSingleObject(){
        XCTAssertEqual(sut?.tableView.dataSource as! MovieLibraryDataService, sut?.tableView.delegate as! MovieLibraryDataService)
    }
}
