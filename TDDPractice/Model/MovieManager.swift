//
//  MovieManager.swift
//  TDDPractice
//
//  Created by Zulqarnain on 16/07/2022.
//

import Foundation

public final class MovieManager{
    
    // Mark: - Properties
    private var moviesSeeCount: Int = 0
    private let moviesSeenCount: Int = 0
    
    public init(){}
    
    public var movieToSeeCount: Int{
        get{ self.moviesSeeCount}
    }
    
    public var movieSeenCount: Int{
        get{ self.moviesSeenCount}
    }
    
    public func addMovie(movie: Movie){
        self.moviesSeeCount += 1
    }
}
