# Swift For tensorflow Workshop

## Tensor flow installation

- Download and install the xCode11 realese for Swift for Tensorflow from https://github.com/tensorflow/swift/blob/master/Installation.md
- Install xcode11 beta on your machine.
- Make a MacOS command line tool project
- Open your project in xCode 11 and set the toolchain to use the one you just downloaded.
- In your projects build settings 
  - Add /Library/Developer/Toolchains/swift-tensorflow-RELEASE-0.4.xctoolchain/usr/lib/swift/macosx to your Runpath Search Paths
  - Change the optimization level in the Swift Compiler - Code generation Section to -O
- Add libtensorflow.so and libtensorflow_framework.so to Link Binary With Libraries in Build Phases, these libraries are located in /Library/Developer/Toolchains/swift-tensorflow-RELEASE-0.4.xctoolchain/usr/lib/swift/macosx
- In File > Project Settings change build system to a legacy build system.

- Try import TensortFlow and import Python and make sure you can compile and run (if you cant cry a little and throw a tantram and mayber xcode will have pity)
- Check which version of python your tensorflow is using by typing 
  ```
  import Python
  print(Python.version)
  ```
  Make sure all python libraries you want to used are installed for that version of python (just pip/pip3 install)
  
  # Usefull Links
  - [Swift for tensorflow github](https://github.com/tensorflow/swift)
  - [Swift for tensorflow python interoperability tutorial](https://colab.research.google.com/github/tensorflow/swift/blob/master/docs/site/tutorials/python_interoperability.ipynb)
  - [Swift for tensorflow model training tutorial](https://colab.research.google.com/github/tensorflow/swift/blob/master/docs/site/tutorials/model_training_walkthrough.ipynb)
  - [Github of my more complex project for detecting sign language letters from images](https://github.com/meirrosendorff/tensorForSwiftModels/blob/ASL/README.md)
