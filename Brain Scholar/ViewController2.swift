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
    
    //***********VARIABLE DECLARATION***************
    //Declare these variables here so that they are accessible within all inner methods and classes.
    //Variables with "Double()" recieve values passed by segue from the previous view.
    var GNA : Double = Double()
    var GK : Double = Double()
    var BETA : Double = Double()
    var GAMMA : Double = Double()
    var V_STIM : Double = Double()
    var C : Double = Double()
    var timer : Timer?
    var iteration : Int = 0
    var del_t : Double = 0.001
    //This is how we initialize an empty double array of a specific size.
    //"count" = size
    var f = Array(repeating: 0.0, count: 10000)
    var u = Array(repeating: 0.0, count: 10000)
    //"v" array will be the array that houses our y values for the graph.
    var v = Array(repeating: 0.0, count: 10000)
    var lineChartDataSet = LineChartDataSet()
    //***********************************************
    
    //****************OUTLETS************************
    //These outlets are elements from the view passed to this controller.
    //Here, they are initialized as variables.
    
    //Graph View at the top.
    @IBOutlet weak var graphView: LineChartView!
    
    //Value Labels (Directly above sliders).
    @IBOutlet var gnaValue: UILabel!
    @IBOutlet var gkValue: UILabel!
    @IBOutlet var betaValue: UILabel!
    @IBOutlet var gammaValue: UILabel!
    @IBOutlet var v_stimValue: UILabel!
    @IBOutlet var cValue: UILabel!
    
    //Sliders
    @IBOutlet var gnaSlider: UISlider!
    @IBOutlet var gkSlider: UISlider!
    @IBOutlet var betaSlider: UISlider!
    @IBOutlet var gammaSlider: UISlider!
    @IBOutlet var v_stimSlider: UISlider!
    @IBOutlet var cSlider: UISlider!
    //***********************************************
    
    
    //*************SLIDER ACTION*********************
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
    
    //Here, we pass the values of all the sliders to the variables above when the user taps the "Calculate" button.
    //This overrides their current value passed from the other view
    @IBAction func buttonPress(_ sender: UIButton) {
        GNA = Double(gnaSlider.value)
        GK = Double(gkSlider.value)
        BETA = Double(betaSlider.value)
        GAMMA = Double(gammaSlider.value)
        V_STIM = Double(v_stimSlider.value)
        C = Double(cSlider.value)
    }
    //***********************************************
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //***************GRAPH SETUP************************
        
        //Assign self the ChartViewDelegate so we can target correctly in the timer.
        self.graphView.delegate = self
        
        //Move the label and get rid of X gridlines (for further optimization)
        graphView.xAxis.labelPosition = .bottom
        graphView.xAxis.drawGridLinesEnabled = false
        
        //Get rid of that goofy right axis.
        graphView.rightAxis.drawLabelsEnabled = false
        
        //Error message
        graphView.noDataText = "Ayy bruh... It's broke..."
        graphView.descriptionText = ""
       
        //Set the max boundaries and move based on x values
        graphView.notifyDataSetChanged()
        graphView.setVisibleXRangeMaximum(Double(10000))
        graphView.moveViewToX(Double(0))
        
        //Color the line
        lineChartDataSet.setColor(NSUIColor .blue)
       
        //Draw less stuff to optimize performance.
        lineChartDataSet.drawCirclesEnabled = false
        lineChartDataSet.drawIconsEnabled = false
        lineChartDataSet.drawValuesEnabled = false
        
        //Timer = (Time between plotting points (graph speed), target = superclass, select setChart method from below to plot a point, Don't need userInfo, repeat it forever and ever, Amen)
        timer = Timer.scheduledTimer(timeInterval: 0.0000001, target: self, selector: #selector(setChart), userInfo: nil, repeats: true)
        
        //***************************************************
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setChart() {
        //*******************CALCULATE***********************
        
        //This method is called upon continuously and graphs one point at a time.
        u[0] = -1.1;
        v[0] = -1.2;
        let Floor: Double = Double(iteration / 3000)
        let stinum: Double = floor(Floor)
        let stimt: Double = 3000 + 3000 * (stinum - 1)
        let intstim: Int = Int(stimt)
            
        f[iteration % 6000] = v[iteration % 6000] * (1 - ((v[iteration % 6000] * v[iteration % 6000]) / 3));
        v[(iteration + 1) % 6000] = 1 / C * (GNA * f[iteration % 6000] - GK * u[iteration % 6000]) * del_t + v[iteration % 6000];
        if (iteration == intstim) {
            v[(iteration + 1) % 6000] = v[(iteration + 1) % 6000] + V_STIM;
        }
        u[(iteration + 1)%6000] = (v[iteration%6000] + BETA - GAMMA * u[iteration%6000]) * del_t + u[iteration % 6000];
        
        
        //For optimization, we use modulo to grap every 25th point to save the CPU from working too hard.
        if(iteration % 25 == 0) {
            let entry = ChartDataEntry(x: Double(iteration), y: v[iteration % 6000])
            lineChartDataSet.addEntry(entry)
        
            if (Double(iteration) >= 10001) {
                lineChartDataSet.removeFirst()
            }
        }

        iteration += 1
        graphView.data = LineChartData(dataSet: lineChartDataSet)
        //****************************************************
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
