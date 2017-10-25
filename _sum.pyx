

cdef extern from "libsum.h":
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
    GoInt Sum(GoInt, GoInt);
   
def my_sum(a, b):
    """ my sum in golang
    """
    ret = Sum(<GoInt> a, <GoInt> b)
    return ret
