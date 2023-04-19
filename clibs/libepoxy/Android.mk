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

export EPOXY_INCLUDES := $(LOCAL_PATH)/../include $(MAKEFILE_PATH)/include

EPOXY_SOURCES := dispatch_common.c dispatch_egl.c
EPOXY_GENERATED_SOURCES := gl_generated_dispatch.c egl_generated_dispatch.c


LOCAL_MODULE     := libepoxy
LOCAL_SRC_FILES  := $(addprefix $(LOCAL_PATH)/, $(EPOXY_SOURCES)) $(addprefix $(MAKEFILE_PATH)/, $(EPOXY_GENERATED_SOURCES))
LOCAL_CFLAGS     += 
LOCAL_C_INCLUDES := $(MAKEFILE_PATH) $(MAKEFILE_PATH)/include $(LOCAL_PATH)/../include

include $(BUILD_STATIC_LIBRARY)
