//
//  HomeViewController.swift
//  MovieRec
//
//  Created by Nathan Holdom on 4/13/21.
//

import UIKit
import AlamofireImage
import Parse

class HomeViewController: UIViewController {

    @IBOutlet weak var movieCard: MovieCard!
    // Array for the movies we currently have in queue
    var movies = [[String:Any]]()
    var movie = [String:Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Loads movies from database and initing movie card
        loadMovies()
    }
    
    func loadMovies() {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            print("got data")
            
            
            // Inits 20 movies in the movies array
            self.movies = dataDictionary["results"] as! [[String:Any]]
            
            // Get first movie and set it as the current card
            self.movie = self.movies.removeFirst()
            self.movieCard.movie = Movie(dict: self.movie)
           }
        }
        task.resume()
    }
    
    func getMovie() {
        // Check if we have no entries in movies
        if self.movies.count < 1 {
            loadMovies()
        }
        // Get first movie and set it as the current card
        self.movie = self.movies.removeFirst()
        movieCard.movie = Movie(dict: self.movie)
    }
    
    @IBAction func onLike(_ sender: Any) {
        print("liked")
        
        // TODO: Save movie like to user database
        saveMovieLike()
        
        // Get next movie
        getMovie()
    }
    
    @IBAction func onDislike(_ sender: Any) {
        print("disliked")
        // Gets next movie
        getMovie()
    }
    
    func saveMovieLike() {
        let movie = PFObject(className: "MovieLikes")
        
        // Setting attributes
        movie["userId"] = PFUser.current()?.objectId
        
        movie["movie"] = self.movie
        
        movie.saveInBackground { (success, error) in
            if success {
                print("Saved movie like!!!")
            } else {
                print("Unable to save like!!")
            }
        }
        
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        delegate.window?.rootViewController = loginViewController
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            let movieDetailsViewController = segue.destination as! MovieDetailsViewController
            movieDetailsViewController.movie = self.movie
        }
    }

}
