//
//  plotGraphs.swift
//  tensorForSwiftModel
//
//  Created by Meir Rosendorff on 2019/07/30.
//  Copyright © 2019 Meir Rosendorff. All rights reserved.
//

import Foundation
import Python

func plot(loss: [Float64], accuracy: [Float]) {
  
  print("\n***********************************************************")
  print("\tPlotting Graphs")
  print("***********************************************************\n")
  
  let plt = Python.import("matplotlib.pyplot")
  
  plt.figure(figsize: [12, 8])
  
  let accuracyAxes = plt.subplot(2, 1, 1)
  accuracyAxes.set_ylabel("Accuracy")
  accuracyAxes.plot(accuracy)
  
  let lossAxes = plt.subplot(2, 1, 2)
  lossAxes.set_ylabel("Loss")
  lossAxes.set_xlabel("Epoch")
  lossAxes.plot(loss)
  
  plt.show()
}
