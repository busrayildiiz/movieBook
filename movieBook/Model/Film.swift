//
//  Film.swift
//  movieBook
//
//  Created by MacBook Pro on 9.02.2024.
//

import Foundation

struct Film : Codable {
    
    let title : String
    let year : String
    let imdbID : String
    let type :String
    let poster : String
    
    private enum CodingKeys : String, CodingKey {
        case title =  "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct GelenFilmler : Codable {
   
    let filmler : [Film]
    
    private enum CodingKeys : String, CodingKey {
        case filmler = "Search"
    }
    
}
