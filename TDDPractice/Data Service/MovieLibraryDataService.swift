//
//  MovieLibraryDataService.swift
//  TDDPractice
//
//  Created by Zulqarnain on 21/07/2022.
//

import Foundation
import UIKit
public class MovieLibraryDataService: NSObject,UITableViewDataSource,UITableViewDelegate{
    
    public var movieManager: MovieManager?
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movieManageer = movieManager else{
            return 0
        }
        return movieManageer.moviesSeeCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
}
