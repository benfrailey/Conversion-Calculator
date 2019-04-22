//
//  conversionModel.swift
//  Conversion Calculator
//
//  Created by Ben Frailey on 4/22/19.
//  Copyright © 2019 Ben Frailey. All rights reserved.
//

import Foundation

class ConversionModel {
    var convertString = ""

    func resetNum(){
        convertString = ""
    }
    func numAdded(_ num: String) -> String{
        let originalNum = Double(convertString) ?? 0.0
        
        switch num {
        case "0":
            if(convertString != "0"){
                convertString += "0"
            }
            
        case "1", "2", "3", "4", "5", "6", "7", "8", "9":
            if(convertString == "0"){
                convertString = num
            }
            else{
                convertString += num
            }
            
        case "C":
            convertString = ""
            
        case "-":
            if(originalNum > 0){
                convertString = "-" + convertString
            }
            else{
                convertString = convertString.replacingOccurrences(of: "-", with: "")
            }
            
        case ".":
            if(!convertString.contains(".")){
                convertString += "."
            }

        default:
            print("Cannot perform operation")
        }
        
        return convertString
    }
    
    func convertNum(_ inputString: String,_ currentConverter: Int) -> Double?{
        let inputNum = Double(inputString)
        var outputNum = 0.0
        
        if(inputNum != nil){
            switch currentConverter {
            case 0:
                outputNum = (inputNum! - 32) * (5/9)
                
            case 1:
                outputNum = inputNum! * (9/5) + 32
                
            case 2:
                outputNum = inputNum! * 1.609344
                
            case 3:
                outputNum = inputNum! * 0.6214
                
            default:
                print("Cannot convert value")
            }
            return outputNum
        }
        else{
            return nil
        }
    }
}
