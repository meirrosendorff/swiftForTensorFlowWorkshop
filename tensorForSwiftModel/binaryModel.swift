//
//  binaryModel.swift
//  tensorForSwiftModel
//
//  Created by Meir Rosendorff on 2019/07/30.
//  Copyright © 2019 Meir Rosendorff. All rights reserved.
//

import Foundation
import TensorFlow
import Python

struct BinaryModel: Layer {
  
  var layer0 = Dense<Float64>(inputSize: 2, outputSize: 10, activation: relu)
  var layer1 = Dense<Float64>(inputSize: 10, outputSize: 10, activation: relu)
  var layer2 = Dense<Float64>(inputSize: 10, outputSize: 2, activation: softmax)
  
  @differentiable
  func callAsFunction(_ input: Tensor<Float64>) -> Tensor<Float64> {
    return input.sequenced(through: layer0, layer1, layer2)
  }
  
  func save() {

    print("\n***********************************************************")
    print("\tSaving Model")
    print("***********************************************************\n")

    let keras = Python.import("keras")

    let model = keras.Sequential()

    model.add(keras.layers.Dense(10, activation: "relu", input_shape: [2]))
    model.add(keras.layers.Dense(10, activation: "relu"))
    model.add(keras.layers.Dense(2, activation: "softmax"))

    model.layers[0].set_weights([layer0.weight.makeNumpyArray(), layer0.bias.makeNumpyArray()])
    model.layers[1].set_weights([layer1.weight.makeNumpyArray(), layer1.bias.makeNumpyArray()])
    model.layers[2].set_weights([layer2.weight.makeNumpyArray(), layer2.bias.makeNumpyArray()])

    let coremltools = Python.import("coremltools")

    let labelNames: [Int] = [0, 1]

    let coreMLModel = coremltools.converters.keras.convert(model,
                                                           input_names: "binary",
                                                           output_names: "AND",
                                                           class_labels: labelNames
                                                          )
    coreMLModel.author = "mrosendorff"
    coreMLModel.license = "mrosendorff"
    coreMLModel.short_description = "Performs Binary AND"

    coreMLModel.save(coreMLModelDest)
  }
}
