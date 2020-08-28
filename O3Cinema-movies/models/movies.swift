//
//  movies.swift
//  O3Cinema-movies
//
//  Created by Daryn Soto Soto on 8/27/20.
//  Copyright © 2020 Daryn Soto Soto. All rights reserved.
//

import Foundation

struct Movies: Codable {
    let movies: [Movie]?
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}
