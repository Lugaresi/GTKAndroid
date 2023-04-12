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
ATK_SOURCES_PATH := $(MAKEFILE_PATH)/distsrc
LOCAL_PATH:= $(ATK_SOURCES_PATH)/atk

include $(CLEAR_VARS)

include $(LOCAL_PATH)/Sources.mk

LOCAL_MODULE:= atk
# We need to manually add what has not been updated in makefile.msc
LOCAL_SRC_FILES:=  $(atk_sources) \
                   $(MAKEFILE_PATH)/atk/atkmarshal.c $(MAKEFILE_PATH)/atk/atk-enum-types.c
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CFLAGS += -DNVALGRIND=1 -DATK_COMPILATION=1 -DATK_DISABLE_DEPRECATION_WARNINGS=1 \
                -DGLIB_DISABLE_DEPRECATION_WARNINGS=1
LOCAL_C_INCLUDES = $(MAKEFILE_PATH) $(MAKEFILE_PATH)/atk $(MAKEFILE_PATH)/include $(MAKEFILE_PATH)/include/atk $(ATK_SOURCES_PATH) \
                    $(GLIB_INCLUDES) $(LIBINTL_INCLUDES)
LOCAL_STATIC_LIBRARIES := glib gobject

export ATK_INCLUDES := $(ATK_SOURCES_PATH) $(MAKEFILE_PATH)/include

include $(BUILD_STATIC_LIBRARY)

$(call import-module,glib)
$(call import-module,gobject)
