//
//  ViewController.swift
//  Brain Scholar
//
//  Created by Derek Roberts on 7/5/17.
//  Copyright © 2017 Derek Roberts. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {

    var graphSpeeds = ["Very Fast", "Fast", "Moderate", "Slow", "Very Slow"]
    @IBOutlet weak var gnaValue: UILabel!
    @IBOutlet weak var gkValue: UILabel!
    @IBOutlet weak var betaValue: UILabel!
    @IBOutlet weak var gammaValue: UILabel!
    @IBOutlet weak var v_stimValue: UILabel!
    @IBOutlet weak var cValue: UILabel!
    
    @IBOutlet weak var gnaSlider: UISlider!
    @IBOutlet weak var gkSlider: UISlider!
    @IBOutlet weak var betaSlider: UISlider!
    @IBOutlet weak var gammaSlider: UISlider!
    @IBOutlet weak var v_stimSlider: UISlider!
    @IBOutlet weak var cSlider: UISlider!
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return graphSpeeds.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return graphSpeeds[row]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestViewController : ViewController2 = segue.destination as! ViewController2
        
        DestViewController.GNA = Double(gnaSlider.value)
        DestViewController.GK = Double(gkSlider.value)
        DestViewController.BETA = Double(betaSlider.value)
        DestViewController.GAMMA = Double(gammaSlider.value)
        DestViewController.V_STIM = Double(v_stimSlider.value)
        DestViewController.C = Double(cSlider.value)
        
    }
}

