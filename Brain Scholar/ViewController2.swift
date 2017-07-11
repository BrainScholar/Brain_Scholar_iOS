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

    var GNA : Double = Double()
    var GK : Double = Double()
    var BETA : Double = Double()
    var GAMMA : Double = Double()
    var V_STIM : Double = Double()
    var C : Double = Double()
    
    var iteration : Double = 0.0
    var i : Int = 0
    var del_t : Double = 0.001
    var f = Array(repeating: 0.0, count: 10000)
    var u = Array(repeating: 0.0, count: 10000)
    var v = Array(repeating: 0.0, count: 10000)
    var index : Int = 0

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
        graphView.xAxis.labelPosition = .bottom
        graphView.rightAxis.drawLabelsEnabled = false
        graphView.animate(xAxisDuration: 2.0)
        graphView.noDataText = "Ayy bruh... It's broke..."
        graphView.descriptionText = ""
        setChart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setChart() {
        graphView.delegate = self
        let lineChartDataSet = LineChartDataSet()
        
        u[0] = -1.1;
        v[0] = -1.2;
        
        for i in 0..<9998 {
            let Floor: Double = Double(i / 3000)
            let stinum: Double = floor(Floor)
            let stimt: Double = 3000 + 3000 * (stinum - 1)
            let intstim: Int = Int(stimt)
            
            f[i] = v[i] * (1 - ((v[i] * v[i]) / 3));
            v[i + 1] = 1 / C * (GNA * f[i] - GK * u[i]) * del_t + v[i];
            if (i == intstim) {
                v[i + 1] = v[i + 1] + V_STIM;
            }
            u[i + 1] = (v[i] + BETA - GAMMA * u[i]) * del_t + u[i];
            
            let entry = ChartDataEntry(x: Double(i), y: v[i])
            lineChartDataSet.addEntry(entry)
            iteration += 1
            index = (index + 1) % 6000
        }
        
        lineChartDataSet.drawCirclesEnabled = false
        lineChartDataSet.colors = [NSUIColor .blue]
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
