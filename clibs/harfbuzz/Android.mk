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
LOCAL_PATH    := $(MAKEFILE_PATH)/distsrc/src

include $(CLEAR_VARS)

export HARFBUZZ_INCLUDES := $(LOCAL_PATH)

include $(LOCAL_PATH)/Makefile.sources

LOCAL_MODULE     := harfbuzz
LOCAL_SRC_FILES  := $(filter %.cc, $(HB_BASE_sources)) $(filter %.cc, $(HB_GLIB_sources)) $(filter %.cc, $(HB_FT_sources))
LOCAL_CFLAGS     += -DHAVE_CONFIG_H=1 -DHB_HAS_GLIB=1 -DHB_HAS_FREETYPE=1
LOCAL_C_INCLUDES := $(MAKEFILE_PATH) $(FREETYPE_INCLUDES) $(GLIB_INCLUDES)

LOCAL_STATIC_LIBRARIES := android_support glib freetype

include $(BUILD_STATIC_LIBRARY)

$(call import-module,android/support)
$(call import-module,freetype)
$(call import-module,glib)