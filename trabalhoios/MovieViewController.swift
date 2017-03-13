//
//  MovieViewController.swift
//  trabalhoios
//
//  Created by Neto Moura on 12/03/17.
//  Copyright © 2017 Fernando Valler. All rights reserved.
//

import UIKit
import Alamofire

class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayMovies : [Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovies();
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func getMovies() {
        self.arrayMovies = [Movie]();
        
        let discoverMoviesUrl = "https://api.themoviedb.org/3/discover/tv?api_key=447809fc806193774b3b649725d1333a&language=pt-BR&sort_by=popularity.desc&page=1&timezone=America/New_York&include_null_first_air_dates=false"
        
        //HUD.show(.progress)
        Alamofire.request(discoverMoviesUrl).responseJSON { response in
            debugPrint(response)
            
            switch response.result {
            case .success:
                if let jsonDict = response.result.value as? [String:Any],
                    let dataArray = jsonDict["results"] as? [[String:Any]] {
                    
                    for data in dataArray {
                        let movie = Movie(dictionary: data)
                        self.arrayMovies?.append(movie)
                    }
                    
                    //HUD.hide()
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.arrayMovies != nil {
            return self.arrayMovies!.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MovieItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieItemTableViewCellId", for: indexPath) as! MovieItemTableViewCell
        
        let movie = self.arrayMovies?[indexPath.row]
        cell.setMoview(movie!)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = self.arrayMovies?[indexPath.row]
        let detailsView: DetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsViewController
        detailsView.movie = movie
        
        self.navigationController?.pushViewController(detailsView, animated: true)
        
}

}
