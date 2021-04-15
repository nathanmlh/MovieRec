//
//  MovieCell.swift
//  MovieRec
//
//  Created by Nathan Holdom on 4/13/21.
//

import UIKit
import AlamofireImage

class MovieCell: UIView {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    var movie: Movie! {
        didSet {
            movieTitleLabel.text = movie.name
            
            // set images
            movieImage.af.setImage(withURL: movie.imageURL!)
            movieImage.layer.cornerRadius = 10
            movieImage.clipsToBounds = true
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
