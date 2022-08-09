//
//  MovieLibraryDataService.swift
//  TDDPractice
//
//  Created by Zulqarnain on 21/07/2022.
//

import Foundation
import UIKit

enum LibrarySection: Int{
    case moviesToSee, moviesSeen
    
}
public class MovieLibraryDataService: NSObject,UITableViewDataSource,UITableViewDelegate{
    
    public var movieManager: MovieManager?
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        getSection(currentSection: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellID", for: indexPath)
        return cell
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
}

extension MovieLibraryDataService{
    
    private func getSection(currentSection section: Int)->Int{
        guard let movieManageer = movieManager else{ return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
        case .moviesToSee:
            return movieManageer.moviesSeeCount
        case .moviesSeen:
            return movieManageer.moviesSeenCount
        }
    }
}
