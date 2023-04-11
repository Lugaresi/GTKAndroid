// Will use "config.h.win32" from GLIB distribution directory
// to obtain some invariants (like GLIB_*_VERSION)

#undef _GDK_PIXBUF_EXTERN
// define _MSC_VER to avoid errors from __attribute__ in config.h.win32
#define _MSC_VER 1200
#include "config.h.win32"

// now we make some overrides

#undef _WIN32_WINNT
#undef BROKEN_POLL
#undef NO_FD_SET
#undef USE_MMX
#define HAVE_LRINT 1
#define HAVE_ROUND 1

#undef ENABLE_NLS

// "config.h.win32" defines _GDK_PIXBUF_EXTERN incompatible with gmacros.h
#undef _GDK_PIXBUF_EXTERN
// redefine it!
#define _GDK_PIXBUF_EXTERN extern

// to prevent $(NDK_ROOT)/platforms/android-XX/<target>/usr/include/alloca.h
// from loading as galloca.h has this definition already
#define _ALLOCA_H
