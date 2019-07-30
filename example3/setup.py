from __future__ import print_function
import os
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy
import subprocess


current_path = os.path.abspath(os.path.dirname(__file__))


GO_EXTENSIONS = [
    ("searchsorted", ["searchsorted.go"]),
]


CY_EXTENSIONS = [
    Extension(
        "_searchsorted",
        ['_searchsorted.pyx'],
        include_dirs=[numpy.get_include()],
        libraries=[':libsearchsorted.a'],
        library_dirs=[current_path],
    ),
]


def golangize(extensions):
    for extension in extensions:
        cmd = [
            'go', 'build', '-buildmode=c-archive',
            '-o', 'lib{}.a'.format(extension[0]),
        ] + extension[1]
        print(' '.join(cmd))
        subprocess.call(cmd)
golangize(GO_EXTENSIONS)


setup(
    name="search_sorted",
    version='0.0.1',
    author="Raphael Valentin",
    author_email="raphael@xytech-consulting.com",
    description=("test golang<->cython<->python."),
    package_data={'': ['*.xml'], },
    ext_modules=cythonize(CY_EXTENSIONS),
    zip_safe = True,
)
