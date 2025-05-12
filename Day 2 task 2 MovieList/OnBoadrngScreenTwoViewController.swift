//
//  OnBoadrngScreenTwoViewController.swift
//  Day 2 task 2 MovieList
//
//  Created by Macos on 07/05/2025.
//

import UIKit

class OnBoadrngScreenTwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextStepToThird(_ sender: Any) {
        let goToThird = self.storyboard?.instantiateViewController(withIdentifier: "OnBoadrngScreenThreeViewController")
         if let goToThird = goToThird{
             navigationController?.pushViewController(goToThird, animated: true)
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
