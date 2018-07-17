######
######   What are we building?
######

TARGET = lib/libDBoW2.so


# Objects that must be built in order to link

OBJECTS = DBoW2/BowVector.o 
OBJECTS += DBoW2/FORB.o 
OBJECTS += DBoW2/FeatureVector.o 
OBJECTS += DBoW2/ScoringObject.o 
OBJECTS += DUtils/Random.o 
OBJECTS += DUtils/Timestamp.o 


######
######   Binaries and flags
######

CPPFLAGS = -std=c++11 -DCOMPILEDWITHC11 -fPIC
CPPFLAGS += -O3

CPPFLAGS += -Wall -DNDEBUG
CPPFLAGS += -Iinclude

LD = g++
LDLIBS += $(shell pkg-config --libs opencv)


# Default target:
.PHONY: all
all: $(TARGET)


$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -shared -o $@ $(LDLIBS)

.PHONY: clean
clean:
	rm -f $(OBJECTS)
	rm -f $(TARGET)


DESTDIR=
PREFIX=/usr/local
_INSTDIR=${DESTDIR}/${PREFIX}

.PHONY: install
install:
	mkdir -p ${_INSTDIR}/lib
	mkdir -p ${_INSTDIR}/include/DBoW2
	install lib/lib* ${_INSTDIR}/lib/
	install include/* ${_INSTDIR}/include/DBoW2/


