//
//  TutorialPageViewController.swift
//  Brain Scholar
//
//  Created by Derek Roberts on 7/13/17.
//  Copyright © 2017 Derek Roberts. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    //*************************DECLARE VARIABLES****************************
    lazy var VCArray: [UIViewController] = {
        //Here, we return each View controller we want in the tutorial by name to the VCArray
        return [self.VCInstance(name: "FHNTut1"),
                self.VCInstance(name: "FHNTut2")]
    }()
    //**********************************************************************
    
    //*************************SETUP************************************
    private func VCInstance(name: String) -> UIViewController {
        //Here, we instantiate each view controller in Main.Storyboard
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        //Upon loading, we establish the first page to show, which direction to swipe, whether it animates during transitions from page to page, whether it ends
        if let firstVC = VCArray.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    //*******************************************************************
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //******************************PAGE VIEW CONTROLLER*************************************
    
    //************BACKWARDS SWIPING********************
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
            //Here, we make sure that the current view is the right one by making sure the viewControllerIndex matches where we are in the array
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            //Avoid out of bounds of array. Can't have a -1 index.
            //Return last page upon swiping left on the first page.
            return VCArray.last
        }
        guard VCArray.count > previousIndex else {
            //Make sure the count is progressing.
            return nil
        }
        //Return the previous page on backswipe
        return VCArray[previousIndex]
    }
    //*************************************************
    
    
    
    
    //**************FORWARD SWIPING********************
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArray.index(of: viewController) else {
            return nil
            //Here, we make sure that the current view is the right one by making sure the viewControllerIndex matches where we are in the array
        }
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCArray.count else {
            //Avoid out of bounds of array.
            //Return first page upon swiping right on the last page.
            return VCArray.first
        }
        guard VCArray.count > nextIndex else {
            //Make sure the count is progressing.
            return nil
        }
        //Go to the next page on swipe.
        return VCArray[nextIndex]
    }
    //*************************************************
    
    
    
    //******CURRENT PAGE INDICATOR (AT BOTTOM)*********
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        //The number of items reflected in the page indicator.
        return VCArray.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArray.index(of: firstViewController) else {
                return 0
        }
        //The selected item reflected in the page indicator.
        return firstViewControllerIndex
    }
    //*************************************************
    
    //*****************************************************************************************
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
