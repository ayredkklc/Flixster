//
//  MovieGridCell.swift
//  Flixster
//
//  Created by Derya Kilic on 2/26/21.
//

import UIKit

class MovieGridCell: UICollectionViewCell {
    
    
    @IBOutlet weak var posterView: UIImageView!
    
   
   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
}
