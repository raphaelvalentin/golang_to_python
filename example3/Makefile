clean:
	@rm -rf build
	@find -type f | grep "\.o" | xargs rm -f
	@find -type f | grep "\.so" | xargs rm -f
	@find -type f | grep "\.pyc" | xargs rm -f
	@find -type f | grep "libsearchsorted" | xargs rm -f
	@rm -rf _searchsorted.c .pytest_cache __pycache__

build:
	python setup.py build_ext --inplace

install:
	python setup.py install

test:
	python -m pytest
