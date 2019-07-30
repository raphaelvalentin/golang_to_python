""" wrap to compiled library
"""
import numpy as np
import _searchsorted

__all__ = ['searchsorted']


def searchsorted(arr, value):
    """ return index
    """
    arr = np.asfarray(arr)
    assert arr.ndim == 1
    return _searchsorted._searchsorted(arr, value, 0, arr.size)
