import UIKit
import SDWebImage
import CoreData
import Network
class TableMoviesViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableMovies: UITableView!
    
    @IBOutlet weak var tableLable: UILabel!
    var movies: [Movies] = []
    
   let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    lazy var context = appDelegate.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableMovies.delegate = self
        tableMovies.dataSource = self
        
        if NetworkMonitor.shared.isConnected{
            
            let url = URL(string: "https://dummyjson.com/c/8b9b-3f93-4c8d-a8b9")
            
            let request = URLRequest(url: url!)
            
            let session = URLSession(configuration: URLSessionConfiguration.default)
            
            let task = session.dataTask(with: request){(data,response,error) in
                
                guard let data = data, error == nil else{
                    print("Error \(error?.localizedDescription ?? "unknown" )")
                    return
                }
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data,options: .allowFragments) as!
                    
                    
                    Array<Dictionary<String,Any>>
                    
                    self.movies.removeAll()
                    for rawMovie in json{
                        let movieObj = Movies()
                        movieObj.title = rawMovie["Title"] as? String
                        movieObj.image = rawMovie["Poster"] as? String
                        movieObj.rating = rawMovie["imdbRating"] as? String
                        movieObj.releaseYear = rawMovie["Year"] as? String
                        movieObj.genre = rawMovie["Genre"] as? String
                        self.movies.append(movieObj)
                        
                        
                        
                        guard  let entity = NSEntityDescription.entity(forEntityName: "Movie", in: self.context) else{
                            print("Entity not found")
                            return
                        }
                        
                        let movie = NSManagedObject(entity: entity, insertInto: self.context)
                        movie.setValue(movieObj.title, forKey: "title")
                        
                        
                        if let imageUrlString = movieObj.image,
                           let imageUrl = URL(string: imageUrlString),
                           let imageData = try? Data(contentsOf: imageUrl) {
                            movie.setValue(imageData, forKey: "image")
                            movieObj.imageData = imageData
                        }else {
                            movie.setValue(nil, forKey: "image")
                        }
    
                        movie.setValue(movieObj.rating, forKey: "rating")
                        movie.setValue(movieObj.releaseYear, forKey: "releaseYear")
                        movie.setValue(movieObj.genre, forKey: "genre")
                        
                        do{
                            try self.context.save()
                            print("saved in core data")
                        }catch{
                            print("error in core data")
                        }
                        self.movies.append(movieObj)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableMovies.reloadData()
                    }
                    
                }catch{
                    print(error)
                }
                
                
            }
            
            
            
            task.resume()
            
        }else{
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")
            
            
            
            do{
                
                let getMovie = try context.fetch(fetchRequest)
                self.movies.removeAll()
                for storedMovie in getMovie{
                    let movieObj = Movies()
                    movieObj.title = storedMovie.value(forKey: "title") as? String
                    if let imageData = storedMovie.value(forKey: "image") as? Data {
                        movieObj.imageData = imageData
                    }

                    movieObj.rating = storedMovie.value(forKey: "rating") as? String
                    movieObj.releaseYear = storedMovie.value(forKey: "releaseYear") as? String
                    movieObj.genre = storedMovie.value(forKey: "genre")  as? String
                    self.movies.append(movieObj)
                    
                    
                    
                }
                }catch{
                    print("error fetchdata")
                }
            }
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        movies = Database.shared.fetchAllMovies()
        tableMovies.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
//            if let movies = movies {
//                let firstMovie = movies[0]
//                let movies = movies[indexPath.row]
//                cell.leftLable?.text = movies.title
//                cell.imgView?.sd_setImage(with: URL(string: firstMovie.image ?? ""), placeholderImage: UIImage(named: "placeholder"))
//                cell.rightLable?.text = movies.genre
//            }else{
//                cell.leftLable?.text = "title"
//                cell.imgView?.image = UIImage(named: "placeholder")
//                cell.rightLable?.text = ""
//                
//            }
        
        //core data

    
            let  movie = movies[indexPath.row]
//                let firstMovie = movie[0]
        
             cell.leftLable?.text = movie.title ?? "title"
             cell.rightLable?.text = movie.genre ?? "genre"
         
        
        if let imageData = movie.imageData {
            cell.imgView?.image = UIImage(data: imageData)
        } else {
            cell.imgView?.image = UIImage(named: "placeholder")
        }


        
 
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedMovie = movies[indexPath.row]
        guard !movies.isEmpty else { return }
//        let FirstImg = movies[0]
            let detalisVC = storyboard?.instantiateViewController(withIdentifier: "DetailsMoviesViewController") as! DetailsMoviesViewController
            detalisVC.movie = selectedMovie
//            detalisVC.imgMovie = FirstImg.image
            navigationController?.pushViewController(detalisVC, animated: true)
        }
        
        //deleting
        
        //    func tableView(_ tableView: UITableView,
        //                   commit editingStyle: UITableViewCell.EditingStyle,
        //                   forRowAt indexPath: IndexPath) {
        //
        //        if editingStyle == .delete {
        //          if let movies = movies{
        //                let movieToDelete = movies[indexPath.row]
        //              guard let id = movieToDelete.id else { return }
        //
        //              movies.remove(at: indexPath.row)
        //
        //              tableView.deleteRows(at: [indexPath], with: .automatic)
        //          }
        //
        //        }
        //    }
        
        
            @IBAction func addMovie(_ sender: Any) {
                let addMovieVC = storyboard?.instantiateViewController(withIdentifier: "AddMovieViewController") as! AddMovieViewController
        
                
        
                navigationController?.pushViewController(addMovieVC, animated: true)
        
            }
        
        
    }

