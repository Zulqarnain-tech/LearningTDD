//
//  Movie.swift
//  TDDPractice
//
//  Created by Zulqarnain on 16/07/2022.
//

import Foundation

public struct Movie{
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
}
