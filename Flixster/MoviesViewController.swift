//
//  MoviesViewController.swift
//  Flixster
//
//  Created by Derya Kilic on 2/19/21.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
   
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        //tableView.
        
       /* posterView.layer.borderWidth = 1
        posterView.layer.masksToBounds = false
        posterView.layer.borderColor = UIColor.black.cgColor
        posterView.layer.cornerRadius = posterView.frame.height/2
        posterView.clipsToBounds = true
        */
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            //here I am accesing the results and casting it as an array of dictionaries
            //then i get a compile text error
            //sometimes accesing the variables you need self the compiler will tell you
            //movies = dataDictionary["results"] as! [[String:Any]] to the next line is how xcode fixes it
            self.movies = dataDictionary["results"] as! [[String:Any]]
            self.tableView.reloadData()
            
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data
            //print("hi")

           }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        //cell.textLabel!.text = title
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        // because of swift optional just like casting it is adding ? before .text
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        //cell.posterView.af_setImage(withURL: posterUrl!) but it changed it to below idk why
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        //cell.posterView = self
        
        cell.posterView.layer.cornerRadius = (cell.posterView.frame.width / 2)
        //cell.posterView.layer.cornerRadius = radius
        cell.posterView.layer.masksToBounds = true
    
        cell.posterView.clipsToBounds = true
        /*cell.posterView.layer.borderWidth = 1
        cell.posterView.layer.masksToBounds = false
        cell.posterView.layer.borderColor = UIColor.black.cgColor
        cell.posterView.layer.cornerRadius = cell.posterView.frame.height/2
        cell.posterView.clipsToBounds = true
 */
        
        //print("hi")
        return cell
    }
    

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //find th eselcted value
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
      
        //pass th eselected movie details to the details movie controller
        let detailsViewControllor = segue.destination as! MoviesDetailsViewController
        detailsViewControllor.movie = movie
        
        //toi deselct the aminated press in app
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
