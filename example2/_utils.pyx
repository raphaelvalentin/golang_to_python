""" wrapper
"""

cdef extern from "libutils.h":
    ctypedef long long GoInt64;
    ctypedef GoInt64 GoInt;
    ctypedef struct GoString:
        char *p
        GoInt n
    GoInt go_get_version(GoString);
    GoInt go_version_to_int(GoString);
   
def get_version(s):
    """ get_version
    """
    cdef GoString _s
    _s.p = s
    _s.n = len(s)
    ret = go_get_version(_s)
    return ret

def version_to_int(s):
    """ version_to_int
    """
    cdef GoString _s
    _s.p = s
    _s.n = len(s)
    ret = go_version_to_int(_s)
    return ret
