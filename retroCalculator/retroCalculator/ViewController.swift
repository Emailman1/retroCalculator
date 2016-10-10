//
//  ViewController.swift
//  retroCalculator
//
//  Created by Gordon McQuillan on 08/10/2016.
//  Copyright © 2016 Gordon McQuillan. All rights reserved.
//this is an addition for `Git change
//and another one

import UIKit
import AVFoundation

var BtnSound: AVAudioPlayer!

class ViewController: UIViewController {
    @IBOutlet weak var outputLbl: UILabel!
    enum Operation: String {
    case Divide = "/"
    case Multiply = "*"
    case Subtract = "-"
    case Add = "+"
    case Empty = "Empty"
        
    }
      var currentOperation = Operation.Empty
      var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
      let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        
        
        
        do {
            try BtnSound = AVAudioPlayer(contentsOf: soundUrl)
            BtnSound.prepareToPlay()


        } catch let err as NSError {
            print(err.debugDescription)
            
        }
        
            outputLbl.text = "Ben needs to learn code"
    }

    @IBAction func numberPressed(sender: UIButton)
    {
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
        
    }
    @IBAction func onDividePressed(sender: AnyObject){
        processOperation(operation: .Divide)
    
    }

    @IBAction func onMultiplyPressed(sender: AnyObject){
         processOperation(operation: .Multiply)
}
    @IBAction func onSubtractPressed(sender: AnyObject){
         processOperation(operation: .Subtract)
}
    @IBAction func onAddPressed(sender: AnyObject){
         processOperation(operation: .Add)

    }
    @IBAction func onEqualBtnPressed(Operation: AnyObject){
    processOperation(operation: currentOperation)
    
    }

    func playSound() {
        if BtnSound.isPlaying {
            BtnSound.stop()
        }
        BtnSound.play()

    }
    
    func processOperation(operation: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty{
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                    
                }  else if currentOperation == Operation.Divide {
                     result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                }  else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                }  else if currentOperation == Operation.Add{
                     result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
              
                
                
                
                leftValStr = result
                outputLbl.text = result
            
        }
            currentOperation = operation
        
            } else {
    
            leftValStr = runningNumber
    
            runningNumber = ""
            
            currentOperation = operation
        }
    }
}

