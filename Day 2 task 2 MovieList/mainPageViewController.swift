//
//  mainPageViewController.swift
//  Day 2 task 2 MovieList
//
//  Created by Macos on 07/05/2025.
//

import UIKit

class mainPageViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource

{
    
    var arrayOfViewControllers = [UIViewController]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var pageViewControllers = UIPageViewController ()
        
        var uiPage1 = self.storyboard?.instantiateViewController(withIdentifier: "OnBoadrngScreenViewController")
        var uiPage2 = self.storyboard?.instantiateViewController(withIdentifier: "OnBoadrngScreenTwoViewController")
        var uiPage3 = self.storyboard?.instantiateViewController(withIdentifier: "OnBoadrngScreenThreeViewController")
        
        arrayOfViewControllers.append(uiPage1!)
        arrayOfViewControllers.append(uiPage2!)
        arrayOfViewControllers.append(uiPage3!)
        delegate = self
        dataSource = self
        
        if let v1 = arrayOfViewControllers.first{
            setViewControllers([v1],direction: .forward, animated: true)
        }
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = arrayOfViewControllers.firstIndex(of: viewController)
        else{
            return nil
        }
        let prevIndex = currentIndex - 1
        
        guard prevIndex>=0 else{
            return nil
        }
        return arrayOfViewControllers[prevIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = arrayOfViewControllers.firstIndex(of: viewController)
        else{
            return nil
        }
        let nextIndex = currentIndex + 1
        
        guard nextIndex < arrayOfViewControllers.count else{
            return arrayOfViewControllers.first
        }
        return arrayOfViewControllers[nextIndex]
    }
    

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrayOfViewControllers.count
    }
   
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
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
