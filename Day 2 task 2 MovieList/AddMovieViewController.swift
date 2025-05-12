//
//  AddMovieViewController.swift
//  Day 2 task 2 MovieList
//
//  Created by Macos on 01/05/2025.
//

import UIKit
import Photos
import CoreData
class AddMovieViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
     lazy var context = appDelegate.persistentContainer.viewContext
    

    @IBOutlet weak var imgViewUser: UIImageView!
    @IBOutlet weak var titleMovie: UITextField!
    
    @IBOutlet weak var rating: UITextField!
    
    @IBOutlet weak var imgMovie: UITextField!
    @IBOutlet weak var releaseYear: UITextField!
    
    @IBOutlet weak var genre: UITextField!
//    var onAddMovie: ((Movie) -> Void)?
    let imgPicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        imgPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveMovie(_ sender: Any) {
    if  let ratingMovieValue = rating.text,
        let ratingMovieValueCasting = Float(ratingMovieValue),
        let releaseYearValue = releaseYear.text,  let releaseYearValueCasting = Int(releaseYearValue),
        let titleMovieValue = titleMovie.text,
        let imgValue = imgViewUser.image,
        let genreValue = genre.text
        
        {
        
        
        guard  let entity = NSEntityDescription.entity(forEntityName: "Movie", in: self.context) else{
            print("Entity not found")
            return
        }
        let movie = NSManagedObject(entity: entity, insertInto: self.context)
        movie.setValue(titleMovieValue, forKey: "title")
        if let imageData = imgValue.jpegData(compressionQuality: 0.8) {
            movie.setValue(imageData, forKey: "image")
        }


        movie.setValue(String(ratingMovieValueCasting), forKey: "rating")

        movie.setValue(String(releaseYearValueCasting), forKey: "releaseYear")

        movie.setValue(genreValue, forKey: "genre")
        do {
            try context.save()
            print("Movie saved successfully")
        } catch {
            print("Failed to save movie: \(error.localizedDescription)")
        }
        navigationController?.popViewController(animated: true)
    }
       
    }
    
    @IBAction func showCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imgPicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imgPicker,animated: true,completion: nil)
        }else{
            print("stop")
        }
        
    }
    @IBAction func showGallary(_ sender: Any) {
        
        PHPhotoLibrary.requestAuthorization(for: .readWrite){ status in
            if status == .authorized{
                print("go")
            }else{
                print("stop")
            }
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            imgPicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imgPicker.allowsEditing = true
            self.present(imgPicker,animated: true,completion: nil)
        }else{
            print("stop")
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imgViewUser.image = info [UIImagePickerController.InfoKey.originalImage] as! UIImage
        dismiss(animated: true)
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
