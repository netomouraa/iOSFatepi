//
//  DetailsViewController.swift
//  trabalhoios
//
//  Created by Neto Moura on 12/03/17.
//  Copyright © 2017 Fernando Valler. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailsViewController: UIViewController {
    
    @IBOutlet var labelTitle: UILabel!
    @IBOutlet weak var textOverview: UITextView!
    @IBOutlet weak var imageViewCover: UIImageView!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.movie?.title
        
        self.labelTitle.text = self.movie?.title
        self.textOverview.text = self.movie?.overview
        
        let imagePath = "https://image.tmdb.org/t/p/w1066_and_h600_bestv2/" + (self.movie?.backdropImagePath)!
        self.imageViewCover.af_setImage(withURL: NSURL(string: imagePath) as URL!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
