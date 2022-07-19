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
    }
}
