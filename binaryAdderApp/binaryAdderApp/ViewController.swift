//
//  ViewController.swift
//  binaryAdderApp
//
//  Created by Meir Rosendorff on 2019/07/30.
//  Copyright © 2019 Meir Rosendorff. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {

  @IBOutlet weak var result: UILabel!
  @IBOutlet weak var first: UITextField!
  @IBOutlet weak var second: UITextField!
  
  let model = binaryModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }


  @IBAction func AndPressed(_ sender: Any) {
    
    
    guard let firstText = first.text, let secondText = second.text else { return }
    
    guard let numOne = Int(firstText), let numTwo = Int(secondText) else {
      print("Invalid Inputs")
      return
    }
    
    guard let input = try? MLMultiArray(shape: [2], dataType: .double) else {
      print("Unable to build input array")
      return
    }
    
    input[0] = NSNumber(value: numOne)
    input[1] = NSNumber(value: numTwo)
    
    guard let prediction = try? model.prediction(binary: input) else {
      print("Unable to make predictions")
      return
    }
    
    print(prediction.classLabel)
    
    result.text = String(prediction.classLabel)
  }
}

