//
//  OnBoadrngScreenThreeViewController.swift
//  Day 2 task 2 MovieList
//
//  Created by Macos on 07/05/2025.
//

import UIKit

class OnBoadrngScreenThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func goToHome(_ sender: Any) {
       var goToHome = self.storyboard?.instantiateViewController(withIdentifier: "TableMoviesViewController")
        if let goToHome = goToHome{
            navigationController?.pushViewController(goToHome, animated: true)
        }else{
            return
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
