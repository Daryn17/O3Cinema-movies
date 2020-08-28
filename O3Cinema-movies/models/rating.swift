//
//  rating.swift
//  O3Cinema-movies
//
//  Created by Daryn Soto Soto on 8/28/20.
//  Copyright © 2020 Daryn Soto Soto. All rights reserved.
//

import Foundation


struct Reting: Codable {
    let Source: String
    let Value: String
    
    private enum CodingKeys: String, CodingKey {
        case Source, Value
    }
}
