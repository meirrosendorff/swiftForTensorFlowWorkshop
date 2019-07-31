//
//  pythonExampleUseCases.swift
//  tensorForSwiftModel
//
//  Created by Meir Rosendorff on 2019/07/31.
//  Copyright © 2019 Meir Rosendorff. All rights reserved.
//

//import Foundation
//import Python
//
////Swift For TensorFlow workshop
//
////****************************************
//
//  // Lets check our python version
//  print(Python.version)
//
////****************************************
////Lets read a file
//
//let io = Python.import("io")
//
//let myFile = io.open(fileName, "r")
//
//for line in myFile {
//
//  let swiftString = String(line)!
//
//  let splitString = swiftString.split(separator: " ")
//
//  print(splitString)
//}
////***************************************
//
////Lets plot a sin graph
//
//let np = Python.import("numpy")
//let plt = Python.import("matplotlib.pyplot")
//
//let xAxis = np.arange(-np.pi, np.pi, 0.01)
//let yVals = np.sin(xAxis)
//
//plt.plot(xAxis, yVals)
//plt.show()
//
////*************************************************
//
//// some Numpy
//
////lets imprt some python modules
//let np = Python.import("numpy")
//
//let threeDArrOfOnes = np.ones(Python.tuple([5, 3, 2]))
//
//print(threeDArrOfOnes)
//
//print(Python.len(threeDArrOfOnes[0][0]))
//
//let halfs = threeDArrOfOnes / 2.0
//
//print(halfs)
//
//let dims = threeDArrOfOnes.shape
//
//let swiftTuple = dims.tuple3
//
//print("first: \(swiftTuple.0), second: \(swiftTuple.1), third: \(swiftTuple.2)")
