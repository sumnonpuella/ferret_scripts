#
# platform_specific_includes.mk.i386-linux
#
# This file is included in the External Function Makefiles and defines
# platform specific macros
# ACM 2/2001 debug flags

INCLUDES        = -I. -I$(TMAP_LOCAL)/include

FINCLUDES       = -I. -I../../fmt/cmn -I../common -I../ef_utility/ferret_cmn -Iferret_cmn


CCSHFLAG        =
CC              = cc
RANLIB          = /usr/bin/ranlib
CFLAGS          = -c -u -Dlint -D_SSIZE_T -DVOID_SIGHANDLER -D_POSIX_VERSION -DLINUX -DFULL_GUI_VERSION -O2 -m486 -DMIXING_NAG_F90_AND_C -DFULL_GUI_VERSION -DX_REFRESH -DXT_CODE -Dsun4 $(INCLUDES)
FC              = gfortran
F77		= gfortran
F77SHFLAG       = 
FFLAGS          = -c -fno-second-underscore -fno-backslash -fdollar-ok -ff2c -ffixed-line-length-132 -fPIC $(FINCLUDES)
LD_DYN_FLAGS    = -G -shared
SYSLIBS         = -lc

CPP             = /lib/cpp
CPP_FLAGS       = -P -traditional $(INCLUDES)
CFLAGS_DEBUG	= -g -Ddebug
FFLAGS_DEBUG	= -g -C -Ddebug

.F.o:
	rm -f $*.f
	$(CPP) $(CPP_FLAGS) $(<F) | sed -e        's/de    /de /g' | sed -e  's/de         /de /g' > $*.f
	$(F77) $(FFLAGS) $*.f
