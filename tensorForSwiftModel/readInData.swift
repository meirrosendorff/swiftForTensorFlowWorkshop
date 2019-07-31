//
//  readInData.swift
//  tensorForSwiftModel
//
//  Created by Meir Rosendorff on 2019/07/30.
//  Copyright © 2019 Meir Rosendorff. All rights reserved.
//

import Foundation
import Python
import TensorFlow

func readInData() -> (Tensor<Float64>, Tensor<Float64>, Tensor<Int32>, Tensor<Int32>)? {
  
  //import now incase it crashes, it will crash soon.
  let np = Python.import("numpy")
  let io = Python.import("io")
  
  let dataFile = io.open(dataFileName, "r")
  
  var data = [PythonObject]()
  var labels = [Int]()
  
  for line in dataFile {
    
    guard let lineSections = String(line)?.split(separator: "\t") else { continue }
    
    guard let first = Float(lineSections[0]), let second = Float(lineSections[1]) else { continue }
    
    guard let label = Int(lineSections[2].filter({ $0 != "\n"})) else { continue }
    
    data.append(np.array([first, second]))
    
    labels.append(label)
  }
  
  let skLearn = Python.import("sklearn.model_selection")
  
  let (tr_features, ts_features, tr_labels, ts_labels) =
    skLearn.train_test_split(data,
                             labels,
                             test_size: 0.02,
                             random_state: 42).tuple4

  guard let ts_featuresAttempt = Tensor<Float64>(numpy: np.float64(ts_features)) else { return nil }
  guard let ts_labelsAttempt = Tensor<Int32>(numpy: np.int32(ts_labels)) else { return nil }
  guard let tr_featuresAttempt = Tensor<Float64>(numpy: np.float64(tr_features)) else { return nil }
  guard let tr_labelsAttempt = Tensor<Int32>(numpy: np.int32(tr_labels)) else { return nil }
  
  return (tr_featuresAttempt, ts_featuresAttempt, tr_labelsAttempt, ts_labelsAttempt)
  
}
