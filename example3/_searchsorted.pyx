cimport cython
from libc.stdlib cimport malloc, free
import numpy as np
cimport numpy as np

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
    GoInt searchsorted(GoSlice, GoFloat64, GoInt, GoInt);


def _searchsorted(np.ndarray[double, ndim=1] array, x, lowIndex, highIndex):
    """ call searchsorted from golang lib
    """
    cdef GoSlice goArray;
    cdef GoFloat64 *data
    cdef int i

    data = <GoFloat64 *>malloc(len(array)*cython.sizeof(GoFloat64))
    if data is NULL:
        raise MemoryError()
    try:
        for i in range(len(array)):
            data[i] =  <GoFloat64> array[i]
        goArray.data = <GoFloat64*> data;
        goArray.len = <GoInt> len(array)
        goArray.cap = <GoInt> len(array)

        index = searchsorted(<GoSlice> goArray, <GoFloat64> x, <GoInt> lowIndex, <GoInt> highIndex)
        return index

    finally:
        free(data)
