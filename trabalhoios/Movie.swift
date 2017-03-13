//
//  Movie.swift
//  trabalhoios
//
//  Created by Neto Moura on 12/03/17.
//  Copyright © 2017 Fernando Valler. All rights reserved.
//

import Foundation

class Movie {
    var title: String?
    var overview: String?
    var posterImagePath: String?
    var backdropImagePath: String?
    
    init(title:String, overview:String, posterImagePath:String, backdropImagePath:String) {
        self.title = title;
        self.overview = overview;
        self.posterImagePath = posterImagePath;
        self.backdropImagePath = backdropImagePath;
    }
    
    init(dictionary: [String:Any]) {
        self.title = dictionary["name"] as? String
        self.overview = dictionary["overview"] as? String
        self.posterImagePath = dictionary["poster_path"] as? String
        self.backdropImagePath = dictionary["backdrop_path"] as? String
    }
}
