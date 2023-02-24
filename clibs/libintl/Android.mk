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
LOCAL_PATH    := $(MAKEFILE_PATH)/distsrc/intl

include $(CLEAR_VARS)

include $(LOCAL_PATH)/Sources.mk

export LIBINTL_INCLUDES := $(MAKEFILE_PATH)/include


LOCAL_MODULE     := libintl
LOCAL_SRC_FILES  := $(SOURCES) $(LOCAL_PATH)/plural.c
LOCAL_CFLAGS     := -g -O2 -fvisibility=hidden -DHAVE_CONFIG_H
LOCAL_C_INCLUDES := $(LIBINTL_INCLUDES) $(LOCAL_PATH) $(MAKEFILE_PATH)


include $(BUILD_STATIC_LIBRARY)
