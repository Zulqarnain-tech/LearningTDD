//
//  MockExtensions.swift
//  TDDPracticeTests
//
//  Created by Zulqarnain on 13/08/2022.
//

import Foundation
import UIKit
@testable import TDDPractice

extension MovieLibraryDataServiceTests{
    class TableViewMock: UITableView{
        var cellDequeuedProperly = false
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            self.cellDequeuedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell{
        var movieData: Movie?
        
        func configMovieCell(movie: Movie){
            self.movieData = movie
        }
        
    }
}

