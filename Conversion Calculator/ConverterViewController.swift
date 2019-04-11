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
