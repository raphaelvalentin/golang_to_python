rm -f *.a
rm -f searchsorted.h
rm -f *.o
rm -f _searchsorted.c
rm -f libsearchsorted.h
find -type f | grep '\.so$' | xargs rm -f
go build -buildmode=c-archive -o libsearchsorted.a searchsorted.go
cython _searchsorted.pyx
gcc $CFLAGS -m64 -I/usr/include/python2.7 -O2 -fPIC -c _searchsorted.c -lpython2.7 -lpthread -lm -lutil -ldl
gcc -shared _searchsorted.o -o _searchsorted.so -L. -Bstatic -lsearchsorted
mkdir -p lib
mv _searchsorted.so lib
rm -f *.a
rm -f *.o
rm -f _searchsorted.c
cd lib
python -c 'from _searchsorted import _searchsorted; arr = [1,2,3,4,5,6,7,8,9,10]; print _searchsorted(arr, 3.3, 0, len(arr))'
cd ..
