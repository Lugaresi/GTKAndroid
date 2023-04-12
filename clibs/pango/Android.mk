# Copyright 2014 The GTK+Android Developers. See the COPYRIGHT
# file at the top-level directory of this distribution and at
# https://github.com/eugals/GTKAndroid/wiki/COPYRIGHT.
#
# Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
# http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
# <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
# option. This file may not be copied, modified, or distributed
# except according to those terms.
#
# Author(s): Evgeny Sologubov
#

MAKEFILE_PATH := $(call my-dir)
PANGO_SOURCES_PATH := $(MAKEFILE_PATH)/distsrc
LOCAL_PATH:= $(PANGO_SOURCES_PATH)/pango

include $(CLEAR_VARS)

include $(LOCAL_PATH)/Sources.mk

fc_support_sources = pangocairo-fcfont.c pangocairo-fcfontmap.c ../../pango-enum-types.c

LOCAL_MODULE    := pango
LOCAL_SRC_FILES := $(fc_support_sources) $(pangoft2_public_sources) ../../glib-compat.c \
                   $(pango_sources) $(pangofc_public_sources) $(pangoot_public_sources) $(pangocairo_sources)
LOCAL_CFLAGS += -DPANGO_ENABLE_ENGINE=1 -DPANGO_ENABLE_BACKEND=1 -DNVALGRIND=1 \
                -DSYSCONFDIR=\"/etc/xdg\" -DLIBDIR=\"unknown-libdir-in-Android.mk\"
LOCAL_C_INCLUDES = $(MAKEFILE_PATH) $(MAKEFILE_PATH)/include $(MAKEFILE_PATH)/include/pango \
                   $(PANGO_SOURCES_PATH) $(GLIB_INCLUDES) $(FRIBIDI_INCLUDES) \
                   $(FONTCONFIG_INCLUDES) $(FREETYPE_INCLUDES) $(HARFBUZZ_INCLUDES) \
                   $(MAKEFILE_PATH)/../cairo/distsrc/cairo/src \
                   $(MAKEFILE_PATH)/../cairo/cairo-extra
LOCAL_STATIC_LIBRARIES := glib cairo fontconfig freetype harfbuzz fribidi

export PANGO_INCLUDES := $(MAKEFILE_PATH)/include $(PANGO_SOURCES_PATH) $(HARFBUZZ_INCLUDES) \
                         $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)

$(call import-module,glib)
$(call import-module,cairo)
$(call import-module,fribidi)
$(call import-module,fontconfig)
$(call import-module,freetype)
$(call import-module,harfbuzz)