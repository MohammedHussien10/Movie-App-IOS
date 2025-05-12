
//  DetailsMoviesViewController.swift
//  Day 2 task 2 MovieList
//
//  Created by Macos on 30/04/2025.
//

import UIKit

class DetailsMoviesViewController: UIViewController{
    
    var movie: Movies?
    var imgMovie:String?
       @IBOutlet weak var imageView: UIImageView!
       @IBOutlet weak var titleLabel: UILabel!
       @IBOutlet weak var ratingLabel: UILabel!
       @IBOutlet weak var releaseYearLabel: UILabel!
       @IBOutlet weak var genreLabel: UILabel!
    
    
    
       
    override func viewDidLoad() {
        super.viewDidLoad()

        if let movie = movie {
            titleLabel.text = movie.title ?? "No Title"

            if let imageData = movie.imageData {
                          imageView.image = UIImage(data: imageData)
                      } else {
                          imageView.image = UIImage(named: "placeholder")
                      }

            if let rating = movie.rating {
                ratingLabel.text = "Rating: \(rating)"
            } else {
                ratingLabel.text = "Rating: N/A"
            }

            if let year = movie.releaseYear {
                releaseYearLabel.text = "Year: \(year)"
            } else {
                releaseYearLabel.text = "Year: N/A"
            }

            if let genre = movie.genre {
                genreLabel.text = "Genres: \(genre)"
            } else {
                genreLabel.text = "Genres: N/A"
            }
        }
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


