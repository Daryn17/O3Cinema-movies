//
//  omdbServices.swift
//  O3Cinema-movies
//
//  Created by Daryn Soto Soto on 8/27/20.
//  Copyright © 2020 Daryn Soto Soto. All rights reserved.
//

import Foundation
import Alamofire

class OmdbServices {

    static let shared = OmdbServices()

    func getMovies(_ movie: String, completionHandler: @escaping (_ movies: Movies?,_ pass: Bool) -> Void) {
    
        let requestUrl = Config.apiUrlWithKey
        let parameters = ["s": movie, "type": "movie"]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let request = AF.request(requestUrl, parameters: parameters, headers: headers)
        request.responseDecodable(of: Movies.self) { response in
                    switch response.result {
                        case let .success(result):
                            completionHandler(result, true)
                        case .failure(_ ):
                            completionHandler(nil, false)
                    }
                }
    }
    
    func getMovieDetail(_ id: String, completionHandler: @escaping (_ movie: MovieDetails?,_ pass: Bool) -> Void) {
    
        let requestUrl = Config.apiUrlWithKey
        let parameters = ["i": id]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        let request = AF.request(requestUrl, parameters: parameters, headers: headers)
        request.responseDecodable(of: MovieDetails.self) { response in
                    switch response.result {
                        case let .success(result):
                            completionHandler(result, true)
                        case .failure(_):
                            completionHandler(nil, false)
                    }
                }
    }
    
}
