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
LOCAL_PATH    := $(MAKEFILE_PATH)/distsrc/lib

include $(CLEAR_VARS)

export EXPAT_INCLUDES := $(LOCAL_PATH)

include $(LOCAL_PATH)/Makefile.sources


LOCAL_MODULE     := expat
LOCAL_SRC_FILES  := $(libexpatinternal_la_SOURCES)
LOCAL_C_INCLUDES := $(MAKEFILE_PATH) $(LOCAL_PATH)

include $(BUILD_STATIC_LIBRARY)
