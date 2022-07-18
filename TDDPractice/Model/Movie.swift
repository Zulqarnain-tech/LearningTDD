//
//  Movie.swift
//  TDDPractice
//
//  Created by Zulqarnain on 16/07/2022.
//

import Foundation

public struct Movie: Equatable{
    
    // Mark: - Properties
    private let title: String
    private let releaseDate: String?
    
    public var getTitle: String{
        get{ self.title}
    }
    public var getReleaseDate: String{
        get{ self.releaseDate ?? ""}
    }
    
    public init(title: String, releaseDate: String? = nil){
        self.title = title
        self.releaseDate = releaseDate
    }
    
    public static func==(lhs: Movie, rhs: Movie)-> Bool{
        if lhs.getTitle != rhs.getTitle{
            return false
        }
        if lhs.getReleaseDate != rhs.getReleaseDate{
            return false
        }
        return true
    }
}
