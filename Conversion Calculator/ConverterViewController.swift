//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Ben Frailey on 4/7/19.
//  Copyright © 2019 Ben Frailey. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    @IBOutlet weak var OutputDisplay: UITextField!
    @IBOutlet weak var InputDisplay: UITextField!
    
    var converter = ConversionModel()
    
    struct Converter {
        let label: String
        let inputUnit: String
        let outputUnit: String
    }
    
    var currentConverter = 0
    var converters: [Converter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let converterArray = [Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"), Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"), Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"), Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
        initializeConverters(converterArray: converterArray, current: 0)
        
        
        OutputDisplay.text = converters[currentConverter].outputUnit
        InputDisplay.text = converters[currentConverter].inputUnit
        

        // Do any additional setup after loading the view.
    }
    
    func initializeConverters(converterArray: [Converter], current: Int){
        currentConverter = current
        converters = converterArray
    }
    
    @IBAction func converterPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Converters", message: "Select a converter", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: converters[0].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.currentConverter = 0
            self.respondToActionSheet()
        }))
        
        alert.addAction(UIAlertAction(title: converters[1].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.currentConverter = 1
            self.respondToActionSheet()
        }))
        
        alert.addAction(UIAlertAction(title: converters[2].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.currentConverter = 2
            self.respondToActionSheet()
        }))
        
        alert.addAction(UIAlertAction(title: converters[3].label, style: UIAlertAction.Style.default, handler: {
            (alertAction) -> Void in
            self.currentConverter = 3
            
            self.respondToActionSheet()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        converter.resetNum()
        OutputDisplay.text = ""
        InputDisplay.text = ""

    }
    @IBAction func dotButton(_ sender: Any) {
        converter(".")
    }
    
    @IBAction func zeroButton(_ sender: Any) {
        converter("0")
    }
    
    @IBAction func oneButton(_ sender: Any) {
        converter("1")
    }
    
    @IBAction func twoButton(_ sender: Any) {
        converter("2")
    }
    
    @IBAction func threeButton(_ sender: Any) {
        converter("3")
    }
    
    @IBAction func fourButton(_ sender: Any) {
        converter("4")
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        converter("5")
    }
    
    @IBAction func sixButton(_ sender: Any) {
        converter("6")
    }
    
    @IBAction func sevenButton(_ sender: Any) {
        converter("7")
    }
    
    @IBAction func eightButton(_ sender: Any) {
        converter("8")
    }
    
    @IBAction func nineButton(_ sender: Any) {
        converter("9")
    }
    
    @IBAction func cButton(_ sender: Any) {
        converter("C")
    }
    
    @IBAction func reverseSign(_ sender: Any) {
        converter("-")
    }
    
    
    func converter(_ num: String){
        let newString = converter.numAdded(num)
        InputDisplay.text = newString + " " + converters[currentConverter].inputUnit
        
        let outputNum = converter.convertNum(newString, currentConverter)
        
        if(outputNum != nil){
            OutputDisplay.text = String(format: "%.2f", outputNum!) + " " + converters[currentConverter].outputUnit
        }
        else {
            OutputDisplay.text = converters[currentConverter].outputUnit
        }
    }
    
    func respondToActionSheet(){
        OutputDisplay.text = converters[currentConverter].outputUnit
        InputDisplay.text = converters[currentConverter].inputUnit
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
