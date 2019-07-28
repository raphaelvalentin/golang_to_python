cimport cython
from libc.stdlib cimport malloc, free

cdef extern from "libsearchsorted.h":
    ctypedef signed char GoInt8;
    ctypedef unsigned char GoUint8;
    ctypedef short GoInt16;
    ctypedef unsigned short GoUint16;
    ctypedef int GoInt32;
    ctypedef unsigned int GoUint32;
    ctypedef long long GoInt64;
    ctypedef unsigned long long GoUint64;
    ctypedef GoInt64 GoInt;
    ctypedef GoUint64 GoUint;
    ctypedef float GoFloat32;
    ctypedef double GoFloat64;
    ctypedef struct GoSlice:
        void *data
        GoInt len
        GoInt cap
    GoInt binarySearch(GoSlice, GoFloat64, GoInt, GoInt);

def searchsorted(array, x, lowIndex, highIndex):
    """ binarySearch in golang
    """
    cdef GoSlice _array;
    cdef double *data
    cdef int i;

    data = <double *>malloc(len(array)*cython.sizeof(double))
    for i in range(len(array)):
        data[i] =  <double> array[i]
    _array.data = <GoFloat64*> data;
    _array.len = <GoInt> len(array)
    _array.cap = <GoInt> len(array)

    index = binarySearch(_array, <GoFloat64> x, <GoInt> lowIndex, <GoInt> highIndex)
    return index
