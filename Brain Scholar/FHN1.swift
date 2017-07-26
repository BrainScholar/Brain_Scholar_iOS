//
//  ViewController.swift
//  Brain Scholar
//
//  Created by Derek Roberts on 7/5/17.
//  Copyright © 2017 Derek Roberts. All rights reserved.
//

import UIKit

class FHN1: UIViewController, UIPickerViewDelegate {

    //*********************OUTLETS**************************
    //These outlets are elements from the view passed to this controller.
    //Here, they are initialized as variables.
    
    //Value Labels (Directly above sliders).
    @IBOutlet weak var gnaValue: UILabel!
    @IBOutlet weak var gkValue: UILabel!
    @IBOutlet weak var betaValue: UILabel!
    @IBOutlet weak var gammaValue: UILabel!
    @IBOutlet weak var v_stimValue: UILabel!
    @IBOutlet weak var cValue: UILabel!
    @IBOutlet weak var stimRateValue: UILabel!
    
    //Sliders
    @IBOutlet weak var gnaSlider: UISlider!
    @IBOutlet weak var gkSlider: UISlider!
    @IBOutlet weak var betaSlider: UISlider!
    @IBOutlet weak var gammaSlider: UISlider!
    @IBOutlet weak var v_stimSlider: UISlider!
    @IBOutlet weak var cSlider: UISlider!
    @IBOutlet weak var stimRateSlider: UISlider!
    
    
    //Calc Button
    @IBOutlet var calcButton: UIButton!
    //******************************************************
    
    //********************SLIDER ACTION*********************
    //Here, we change the text of the label above each slider to match the value of each slider.
    
    @IBAction func gnaValueChanged(_ sender: UISlider) {
        gnaValue.text = "\(gnaSlider.value)"
    }
    
    @IBAction func gkValueChanged(_ sender: UISlider) {
        gkValue.text = "\(gkSlider.value)"
    }
    
    @IBAction func betaValueChanged(_ sender: UISlider) {
        betaValue.text = "\(betaSlider.value)"
    }
    
    @IBAction func gammaValueChanged(_ sender: UISlider) {
        gammaValue.text = "\(gammaSlider.value)"
    }
    
    @IBAction func v_stimValueChanged(_ sender: UISlider) {
        v_stimValue.text = "\(v_stimSlider.value)"
    }
    
    @IBAction func cValueChanged(_ sender: UISlider) {
        cValue.text = "\(cSlider.value)"
    }
    
    @IBAction func stimRateValueChanged(_ sender: UISlider) {
        stimRateValue.text = "\(stimRateSlider.value)"
    }
    //*****************************************************
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    //************************SEGUE***********************
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "calcButtonSegue") {
            //Here we determine where we send our values to.
            var DestViewController : FHN2 = segue.destination as! FHN2
        
            //Here we assign values in this view controller directly to variables in our destination view controller.
            DestViewController.GNA = Double(gnaSlider.value)
            DestViewController.GK = Double(gkSlider.value)
            DestViewController.BETA = Double(betaSlider.value)
            DestViewController.GAMMA = Double(gammaSlider.value)
            DestViewController.V_STIM = Double(v_stimSlider.value)
            DestViewController.C = Double(cSlider.value)
            DestViewController.STIMRATE = Int(stimRateSlider.value*1000)
        }
        
    }
    //****************************************************
}

