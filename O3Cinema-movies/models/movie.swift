//
//  movie.swift
//  O3Cinema-movies
//
//  Created by Daryn Soto Soto on 8/27/20.
//  Copyright © 2020 Daryn Soto Soto. All rights reserved.
//

import Foundation


struct Movie: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
    
    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type", Poster
    }
}
