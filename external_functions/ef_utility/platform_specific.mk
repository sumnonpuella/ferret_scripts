#
# platform_specific_includes.mk.i386-linux
#
# This file is included in the External Function Makefiles and defines
# platform specific macros
# ACM 2/2001 debug flags

INCLUDES	= -I. -I../ef_utility -I../ef_utility/ferret_cmn

CCSHFLAG	=
CC		= gcc
CFLAGS		= -fPIC -m64 -O2 $(INCLUDES)

FC		= gfortran
F77		= gfortran
F77SHFLAG	=
FFLAGS		= -fPIC -m64 -Ddouble_p -fno-second-underscore \
		  -fno-backslash -fdollar-ok -ffixed-line-length-132 \
		  -fdefault-real-8 -fdefault-double-8 $(INCLUDES)

RANLIB		= /usr/bin/ranlib

LD		= gfortran
LD_DYN_FLAGS	= -fPIC -m64 -shared
SYSLIBS		=

CPP		= /lib/cpp
CPP_FLAGS	= -P -traditional -Ddouble_p $(INCLUDES)
CFLAGS_DEBUG	= -O0 -g -Ddebug
FFLAGS_DEBUG	= -O0 -g  -fbounds-check -Ddebug

## cancel the default rule for .f -> .o to prevent objects from being built
## from .f files that are out-of-date with respect to their corresponding .F file
#%.o : %.f
#
## use cpp to preprocess the .F files to .f files and then compile the .f files
#%.o : %.F
#	rm -f $*.f
#	$(CPP) $(CPP_FLAGS) $(<F) | sed -e 's/de    /de /g' | sed -e 's/de         /de /g' > $*.f
#	$(F77) $(FFLAGS) -c $*.f

# Directly compile the .F source files to the .o object files
# since gfortran can handle the C compiler directives in Fortran code
%.o : %.F
	$(FC) $(FFLAGS) -c $*.F -o $*.o

