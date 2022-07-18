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
    private var moviesSeenCount: Int = 0
    private var moviesToSeeList: [Movie] = []
    private var moviesToSeenList: [Movie] = []
    
    public init(){}
    
    public var movieToSeeCount: Int{
        get{ self.moviesSeeCount}
    }
    
    public var movieSeenCount: Int{
        get{ self.moviesSeenCount}
    }
    
    public func addMovie(movie: Movie){
        self.moviesSeeCount += 1
        self.moviesToSeeList.append(movie)
    }
    
    public func getMovieIndex(movieID index: Int)->String?{
        if index <= moviesToSeeList.count - 1{
            return self.moviesToSeeList[index].getTitle
        }
        return ""
    }
    public func checkOffMovieAtIndex(index: Int) {
        guard index < moviesSeeCount else {return}
        let checkedMovie = moviesToSeeList.remove(at: index)
        moviesToSeenList.append(checkedMovie)
    }
    
    public func clearMovieDataLists(){
        self.moviesToSeeList.removeAll()
        self.moviesToSeenList.removeAll()
        self.moviesSeeCount = 0
        self.moviesSeenCount = 0
    }
}
