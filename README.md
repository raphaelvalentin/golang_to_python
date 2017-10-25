# golang_to_python
interfacing golang with python using cython

golang_to_python shows a simple example how to create a python module that includes a golang code with its wrapping interfaces using cython. We can note that this strategy allows to simplify the wrapping interface code between golang and python by:

1. removing the cgo preamble code such as shown in https://blog.filippo.io/building-python-modules-with-go-1-5/,
2. improving the wrapping interface compatibility for the different versions of Python without any change of the code (e.g. no more #include Python.h header and c wrapped functions in the golang code that are version dependent).
3. interfacing third party libraries (e.g. numpy) into the cython script such as the associated wrapping interface can be invisible of any golang code or any python scripts (https://github.com/ryanbressler/numpy2go/blob/master/numpy2go.py),
4. No more ctypes, 
5. Making the compilation of the module just more easy,

Finally, creating a module using golang for python can just re-become simple and clean!

This simple example has been tested with

* ubuntu-gnome
* golang = 1.9 (not tested with previous version, but get some issues with golang 1.6)
* python = 2.7
* cython = 0.26
* gcc = 5.4
