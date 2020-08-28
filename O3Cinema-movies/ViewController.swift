//
//  ViewController.swift
//  O3Cinema-movies
//
//  Created by Daryn Soto Soto on 8/27/20.
//  Copyright © 2020 Daryn Soto Soto. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UITableViewDataSource,
    UITableViewDelegate,
    UITextFieldDelegate {
    
    @IBOutlet var titlePage: UILabel!
    @IBOutlet var tableMovie: UITableView!
    @IBOutlet var fieldSearch: UITextField!
    
    // Services
    private let omdbServices = OmdbServices.shared
    
    // Variables
    var movies: [Movie]? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableMovie.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableMovie.delegate = self
        tableMovie.dataSource = self
        fieldSearch.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieDetailsController {
            destination.idMovie = movies![(tableMovie.indexPathForSelectedRow?.row)!].imdbID
        }
    }
    
    func getMovies(name movie: String) {
        movies?.removeAll()
        omdbServices.getMovies(movie) { (result, succes) in
            switch succes {
            case true:
                self.movies?.append(contentsOf: result!.movies!)
                DispatchQueue.main.async {
                    self.tableMovie.reloadData()
                }
                print("SUCCESS")
            case false:
                print("ERROR:")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies() {
        fieldSearch.resignFirstResponder()
        guard let movie = fieldSearch.text, !movie.isEmpty else {
            return
        }
        
        getMovies(name: movie)
    }
    
    // Table movie
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        cell.setDataMovie(with: self.movies![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueMovieDetailsVC", sender: self)
    }


}
