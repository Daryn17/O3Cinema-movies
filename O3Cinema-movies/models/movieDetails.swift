//
//  movieDetails.swift
//  O3Cinema-movies
//
//  Created by Daryn Soto Soto on 8/28/20.
//  Copyright © 2020 Daryn Soto Soto. All rights reserved.
//

import Foundation

struct MovieDetails: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
    let Released: String
    let Genre: String
    let Runtime: String
    let Ratings: [Reting]
    
    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type", Poster, Released, Genre, Runtime, Ratings
    }
}
