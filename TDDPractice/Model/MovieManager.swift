//
//  MovieManager.swift
//  TDDPractice
//
//  Created by Zulqarnain on 16/07/2022.
//

import Foundation

public final class MovieManager{
    
    // Mark: - Properties
    public var moviesSeeCount: Int {return moviesToSeeList.count}
    public var moviesSeenCount: Int {return moviesToSeenList.count}
    private var moviesToSeeList: [Movie] = []
    private var moviesToSeenList: [Movie] = []
    
    public init(){}
    
    public func addMovie(movie: Movie){
        if !self.moviesToSeeList.contains(movie){
            self.moviesToSeeList.append(movie)
        }
    }
    
    public func getMovieIndex(movieID index: Int)->Movie?{
            return self.moviesToSeeList[index]
    }
    public func checkedOffMovieAtIndex(movieID index: Int)->Movie?{
        if index <= moviesToSeenList.count - 1{
            return self.moviesToSeenList[index]
        }
        return nil
    }
    public func checkOffMovieAtIndex(index: Int) {
        guard index < moviesSeeCount else {return}
        let checkedMovie = moviesToSeeList.remove(at: index)
        moviesToSeenList.append(checkedMovie)
    }
    
    public func clearMovieDataLists(){
        self.moviesToSeeList.removeAll()
        self.moviesToSeenList.removeAll()
    }
}
