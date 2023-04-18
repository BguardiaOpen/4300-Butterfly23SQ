# Makefile. 
# Authors: Ishan Parikh, Kevin, 
# CPSC4300, Spring 2023
# Team: Butterfly

EXECUTABLE_FILE = sql5300

all: Shell

Shell: Shell.o heap_storage.o 
	g++ -L/usr/local/db6/lib -o $(EXECUTABLE_FILE) Shell.o heap_storage.o -ldb_cxx -lsqlparser

Shell.o:       heap_storage.h storage_engine.h
heap_storage.o: heap_storage.h storage_engine.h

#compilation rules for all object files
%.o : %.cpp
	g++ -I/usr/local/db6/include -DHAVE_CXX_STDHEADERS -D_GNU_SOURCE -D_REENTRANT -fpermissive -O3 -std=c++11 -c -o $@ $<

clean : 
	rm -f Shell testMe *.o
