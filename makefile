objects = test.o

libsort: $(objects)
	gcc -shared -o libsort.so $(objects)

test.o :
	gcc -c -fPIC -std=c99 test.c
