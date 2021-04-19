//
//  Movie.swift
//  MovieRec
//
//  Created by Nathan Holdom on 4/13/21.
//

import Foundation

class Movie {
    
    // ––––– Establish Properties –––––
    var imageURL: URL?
//    var url: URL?
    var name: String
//    var mainCategory: String
//    var phone: String
//    var rating: Double
//    var reviews: Int
//    var location: [String: Any]
//    var address: String
//    var website: URL?


    // –––––  initializer for Restaurant
    init(dict: [String: Any]) {
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = dict["poster_path"] as! String
        imageURL = URL(string: baseUrl + posterPath)
        name = dict["title"] as! String
//        rating = dict["rating"] as! Double
//        reviews = dict["review_count"] as! Int
//        phone = dict["display_phone"] as! String
//        url = URL(string: dict["url"] as! String)
//        mainCategory = Restaurant.getMainCategory(dict: dict)
//        location = dict["location"] as! [String:Any]
//        address = location["address1"] as! String
//        website = URL(string: dict["url"] as! String)
    }
}
