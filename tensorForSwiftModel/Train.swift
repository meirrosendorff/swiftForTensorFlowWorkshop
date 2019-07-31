//
//  Train.swift
//  tensorForSwiftModel
//
//  Created by Meir Rosendorff on 2019/07/31.
//  Copyright © 2019 Meir Rosendorff. All rights reserved.
//

import Foundation
import Python
import TensorFlow

func train() {
  
  guard let (tr_features, ts_features, tr_labels, ts_labels) = readInData() else {
    fatalError("unable to read in data")
  }
  
  let learningRate: Float = 0.1
  let numEpochs = 500
  
  var model = BinaryModel()
  
  let optimizer = SGD(for: model, learningRate: learningRate)
  
  var accuracyResults = [Float]()
  var lossResults = [Float64]()
  
  for epoch in 0...numEpochs {
    
    let (loss, grad) = model.valueWithGradient { (model: BinaryModel) -> Tensor<Float64> in

      let logits = model(tr_features)
      return softmaxCrossEntropy(logits: logits, labels: tr_labels)
    }

    optimizer.update(&model.allDifferentiableVariables, along: grad)
    
    //accuracy Analysis
    let logits = model(tr_features)
    let currAccuracy = accuracy(predictions: logits.argmax(squeezingAxis: 1), truths: tr_labels)
    
    accuracyResults.append(currAccuracy)
    lossResults.append(loss.scalarized())
    
    if epoch % 25 == 0 {
      let logits = model(ts_features)
      print("Epoch: \(epoch)\tAccuracy: \(accuracy(predictions: logits.argmax(squeezingAxis: 1), truths: ts_labels)) - loss: \(loss)")
    }
  }
  
  model.save()
  
  plot(loss: lossResults, accuracy: accuracyResults)
}

func accuracy(predictions: Tensor<Int32>, truths: Tensor<Int32>) -> Float {
  return Tensor<Float>(predictions .== truths).mean().scalarized()
}
