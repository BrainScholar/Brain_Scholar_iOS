//
//  ViewController2.swift
//  Brain Scholar
//
//  Created by Derek Roberts on 7/5/17.
//  Copyright © 2017 Derek Roberts. All rights reserved.
//

import UIKit
import Charts

class ViewController2: UIViewController, ChartViewDelegate {

    var GNA : Double = 0.0
    var GK : Double = 0.0
    var BETA : Double = 0.0
    var GAMMA : Double = 0.0
    var V_STIM : Double = 0.0
    var C : Double = 0.0
    var iteration : Double = 0.0
    var i : Int = 0
    let v : [Double] = []
    

    @IBOutlet weak var graphView: LineChartView!
    
    @IBOutlet var gnaValue: UILabel!
    @IBOutlet var gkValue: UILabel!
    @IBOutlet var betaValue: UILabel!
    @IBOutlet var gammaValue: UILabel!
    @IBOutlet var v_stimValue: UILabel!
    @IBOutlet var cValue: UILabel!
    
    @IBOutlet var gnaSlider: UISlider!
    @IBOutlet var gkSlider: UISlider!
    @IBOutlet var betaSlider: UISlider!
    @IBOutlet var gammaSlider: UISlider!
    @IBOutlet var v_stimSlider: UISlider!
    @IBOutlet var cSlider: UISlider!
    
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
    @IBAction func buttonPress(_ sender: UIButton) {
        GNA = Double(gnaSlider.value)
        GK = Double(gkSlider.value)
        BETA = Double(betaSlider.value)
        GAMMA = Double(gammaSlider.value)
        V_STIM = Double(v_stimSlider.value)
        C = Double(cSlider.value)
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let xValues: [Double] = []
        let yValues: [Double] = []
        
        graphView.noDataText = "Ayy bruh... It's broke..."
        setChart(dataPoints: xValues, values: yValues)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setChart(dataPoints: [Double], values: [Double]) {
        graphView.delegate = self
        var dataEntries: [ChartDataEntry] = []

        for i in 0..<dataPoints.count {
            //v[i] = Double(i)
            let DataEntry = ChartDataEntry(x: dataPoints[i], y: values[i])
            dataEntries.append(DataEntry)
            iteration += 1
        }
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: nil)
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        graphView.data = lineChartData
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
