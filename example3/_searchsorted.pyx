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


def _searchsorted(np.ndarray[double, ndim=1, mode="c"] array, x, lowIndex, highIndex):
    """ call searchsorted from golang lib
    """
    cdef GoSlice goArray;

    try:
        goArray.data = <GoFloat64*> array.data;
        goArray.len = <GoInt> array.size
        goArray.cap = <GoInt> array.size

        index = searchsorted(<GoSlice> goArray, <GoFloat64> x, <GoInt> lowIndex, <GoInt> highIndex)
        return index

    finally:
        # free
        pass
