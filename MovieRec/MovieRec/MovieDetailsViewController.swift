//
//  MovieDetailsViewController.swift
//  MovieRec
//
//  Created by Nathan Holdom on 4/14/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movie: [String : Any]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieTitle.text = movie["title"] as? String
        movieTitle.sizeToFit()

        movieDescription.text = movie["overview"] as? String
        movieDescription.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        movieImage.af_setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
        
        moviePoster.af_setImage(withURL: backdropURL!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
