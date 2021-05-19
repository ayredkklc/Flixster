//
//  MoviesGridDetailsViewController.swift
//  Flixster
//
//  Created by Derya Kilic on 2/27/21.
//

import UIKit

class MoviesGridDetailsViewController: UIViewController {

    
    @IBAction func trailerButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToTrailer", sender: self)
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
    
        posterView.af.setImage(withURL: posterUrl!)
        
        
    }
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cell = sender as! UITapGestureRecognizer
        let indexPath = posterView.index(ofAccessibilityElement: cell)
        //let movies = movie[indexPath]
      
        //pass th eselected movie details to the details movie controller
        let greidDetailsViewControllor = segue.destination as! TrailersViewController
        greidDetailsViewControllor.movie = movie
        
        //toi deselct the aminated press in app
        //collentionView.deselectItem(at: indexPath, animated: true)
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
