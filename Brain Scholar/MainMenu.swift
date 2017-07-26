//
//  InitialViewController.swift
//  Brain Scholar
//
//  Created by Derek Roberts on 7/13/17.
//  Copyright © 2017 Derek Roberts. All rights reserved.
//

import UIKit

class MainMenu: UIViewController, UIPickerViewDelegate {
    
    //********************DECLARE VARIABLES**************************
    //Here, we declare an array and fill it with the strings that we want to populate the picker with (top-bottom)
    var modules = ["FitzHugh-Nagumo", "Some Other Module", "Some Other Module", "Some Other Module"]
    
    //These outlets are elements from the view passed to this controller.
    //Here, they are initialized as variables.
    @IBOutlet var modulePicker: UIPickerView!
    @IBOutlet var startButton: UIButton!
    //***************************************************************
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //***********************PICKER VIEW********************************
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        //This always returns 1
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //Set the amount of rows equal to the amount of objects in our "modules" array.
        return modules.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //Set the title of each row = the string value in the corresponding index.
        //Acts like a for loop population.
        return modules[row]
    }
    //******************************************************************

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
