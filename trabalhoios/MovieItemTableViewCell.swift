//
//  MovieItemTableViewCell.swift
//  trabalhoios
//
//  Created by Neto Moura on 12/03/17.
//  Copyright © 2017 Fernando Valler. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setMoview(_ movie: Movie) {
        self.labelTitle.text = movie.title
        self.labelDescription.text = movie.overview
        let imagePath = "https://image.tmdb.org/t/p/w500/" + movie.posterImagePath!
        
        self.imageViewCover.af_setImage(withURL: NSURL(string: imagePath) as URL!)
    }
    
}
