/* Manually generated from meson.build in main directory. Adjust with version changes */

#define PANGO_BINARY_AGE 4811
#define PANGO_INTERFACE_AGE 0
#define PANGO_VERSION_MAJOR 1
#define PANGO_VERSION_MINOR 48
#define PANGO_VERSION_MICRO 11

#define _PANGO_EXTERN extern

#define HAVE_PAGESIZE 1
#define HAVE_FLOCKFILE 1
#define HAVE_STRTOK_R 1

#define HAVE_UNISTD_H 1
#define HAVE_SYS_MMAN_H 1
#define HAVE_DIRENT_H 1

#define HAVE_FCWEIGHTFROMOPENTYPEDOUBLE 1
#define HAVE_FREETYPE 1

#define HAVE_CAIRO 1
#define HAVE_CAIRO_FREETYPE 1

// now we make some overrides
#undef ENABLE_NLS
#undef HAVE_CAIRO_PDF
#undef HAVE_CAIRO_PNG
#undef HAVE_CAIRO_PS
#undef HAVE_CAIRO_WIN32
//#undef HAVE_CAIRO_FREETYPE

#define G_GNUC_FALLTHROUGH __attribute__((fallthrough))

// to prevent $(NDK_ROOT)/platforms/android-XX/<target>/usr/include/alloca.h
// from loading as galloca.h has this definition already
#define _ALLOCA_H

#include <stdlib.h>
