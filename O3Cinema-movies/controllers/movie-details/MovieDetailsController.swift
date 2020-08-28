//
//  MovieDetailsController.swift
//  O3Cinema-movies
//
//  Created by Daryn Soto Soto on 8/28/20.
//  Copyright © 2020 Daryn Soto Soto. All rights reserved.
//

import UIKit

class MovieDetailsController: UIViewController {
    
    @IBOutlet var moviePosterImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieReleased: UILabel!
    @IBOutlet var movieGenre: UILabel!
    @IBOutlet var movieRuntime: UILabel!
    @IBOutlet var movieRatings: UILabel!
    
    // Services
    private let omdbServices = OmdbServices.shared
    
    var idMovie: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        getMovieDetails(movie: idMovie)
    }
    
    func getMovieDetails(movie id: String) {
        omdbServices.getMovieDetail(id){ (result, succes) in
            switch succes {
            case true:
                self.setMovieDetails(with: result!)
                print("SUCCESS")
            case false:
                print("ERROR:")
            }
        }
    }
    
    func setMovieDetails(with movie: MovieDetails) {
        
        self.movieTitle.text = movie.Title
        self.movieReleased.text = movie.Released
        self.movieGenre.text = movie.Genre
        self.movieRuntime.text = movie.Runtime
        self.movieRatings.text = "Working in this..."
        
        for rating in movie.Ratings {
            if rating.Source == "Rotten Tomatoes" {
                self.movieRatings.text = rating.Value
            }
        }
        
        let urlImage = movie.Poster
        if let dataImage = try? Data(contentsOf: URL(string: urlImage)!) {
            self.moviePosterImage.image = UIImage(data: dataImage)
        }
    }
}
