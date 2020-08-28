//
//  MovieTableViewCell.swift
//  O3Cinema-movies
//
//  Created by Daryn Soto Soto on 8/28/20.
//  Copyright © 2020 Daryn Soto Soto. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var moviePosterImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static let identifier = "MovieTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    func setDataMovie(with movie: Movie) {
        self.movieTitle.text = movie.Title
        
        let urlImage = movie.Poster
        if let dataImage = try? Data(contentsOf: URL(string: urlImage)!) {
            self.moviePosterImage.image = UIImage(data: dataImage)
        }
    }
}
