import UIKit

class DetailsTableMoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var movie: Movies?
    var imgMovie: String?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        print("DetailsTableMoviesViewController")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        
        if let movie = movie {
            switch indexPath.row {
            case 0:
      
                if let imageData = movie.imageData {
                    if let imageView = cell.viewWithTag(100) as? UIImageView {
                        imageView.image = UIImage(data: imageData)
                    }
                } else {
                    if let imageView = cell.viewWithTag(100) as? UIImageView {
                        imageView.image = UIImage(named: "placeholder")
                    }
                }
            case 1:
                
 
                if let titleLabel = cell.viewWithTag(101) as? UILabel {
                    titleLabel.text = movie.title ?? "No Title"
                }
            case 2:
                
     
                if let ratingLabel = cell.viewWithTag(102) as? UILabel {
                    ratingLabel.text = "Rating: \(movie.rating ?? "N/A")"
                }
            case 3:
                
                if let releaseYearLabel = cell.viewWithTag(103) as? UILabel {
                    releaseYearLabel.text = "Year: \(movie.releaseYear ?? "N/A")"
                }
            case 4:
                
           
                
                
                if let genreLabel = cell.viewWithTag(104) as? UILabel {
                    genreLabel.text = "Genres: \(movie.genre ?? "N/A")"
                }
            default:
                break
            }
        }

        return cell
    }

    /*
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass data to the next view controller if needed
    }
    */
}
