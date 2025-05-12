//
//  OnBoadrngScreenViewController.swift
//  Day 2 task 2 MovieList
//
//  Created by Macos on 07/05/2025.
//

import UIKit

class OnBoadrngScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextStepToSec(_ sender: Any) {
        let goToSec = self.storyboard?.instantiateViewController(withIdentifier: "OnBoadrngScreenTwoViewController")
         if let goToSec = goToSec{
             navigationController?.pushViewController(goToSec, animated: true)
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
