//
//  MoviesViewController.swift
//  MovieRec
//
//  Created by Nathan Holdom on 4/15/21.
//

import UIKit
import Parse

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var movies = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        print("qeurying database for movies")
        let query = PFQuery(className: "MovieLikes")
        // Limiting on user id
        query.whereKey("userId", equalTo: PFUser.current()?.objectId! ?? "")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) items.")
                // Do something with the found objects
                self.movies = objects
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return movies.count
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        cell.movieTitleLabel.text = "Hello"
        print(movie["movie"])
        
//        let name = movie["title"] as! String
//        cell.movie = movie
//
//
//
//        let query = PFQuery(className: "_User")
//        query.whereKey("objectId", equalTo: matchUserId)
//        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let objects = objects {
//                cell.matchName.text = objects[0]["name"] as! String
//            }
//        }
        
        
        return cell
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
