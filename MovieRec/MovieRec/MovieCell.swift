//
//  MovieCell.swift
//  MovieRec
//
//  Created by Nathan Holdom on 4/16/21.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    var movie = [String: Any]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("inited movie cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
