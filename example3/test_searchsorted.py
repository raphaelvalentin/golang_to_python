""" unit test
"""
import numpy as np
from searchsorted import searchsorted

__all__ = ['TestSearchSorted']


class TestSearchSorted:

    def test1(self):
        arr = np.linspace(0, 10, 21)
        value = 3.3
        index = searchsorted(arr, 3.3)
        assert arr[index] == 3.


if __name__ == '__main__':
    test = TestSearchSorted()
    test.test1()
