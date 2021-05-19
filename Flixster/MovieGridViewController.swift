//
//  MovieGridViewController.swift
//  Flixster
//
//  Created by Derya Kilic on 2/26/21.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    
    @IBOutlet weak var collentionView: UICollectionView!
    var movies = [[String:Any]]()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collentionView.delegate = self
        collentionView.dataSource = self
        
        let layout = collentionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * 2) / 3
        layout.itemSize = CGSize(width: width, height: width * 3/2)
        

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
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
            self.collentionView.reloadData()
            
              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data
    
           }
        }
        task.resume()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
    
        
        
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        
        return cell
    }
    

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UICollectionViewCell
        let indexPath = collentionView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
      
        //pass th eselected movie details to the details movie controller
        let greidDetailsViewControllor = segue.destination as! MoviesGridDetailsViewController
        greidDetailsViewControllor.movie = movie
        
        //toi deselct the aminated press in app
        collentionView.deselectItem(at: indexPath, animated: true)
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
