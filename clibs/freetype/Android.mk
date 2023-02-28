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
LOCAL_PATH    := $(MAKEFILE_PATH)/distsrc

include $(CLEAR_VARS)

export FREETYPE_INCLUDES := $(LOCAL_PATH)/include

SRC_DIR := $(LOCAL_PATH)/src
BASE_DIR := $(SRC_DIR)/base

include $(SRC_DIR)/autofit/rules.mk
include $(SRC_DIR)/base/rules.mk
include $(SRC_DIR)/bdf/rules.mk
include $(SRC_DIR)/cache/rules.mk
include $(SRC_DIR)/cff/rules.mk
include $(SRC_DIR)/cid/rules.mk
include $(SRC_DIR)/gzip/rules.mk
include $(SRC_DIR)/lzw/rules.mk
include $(SRC_DIR)/pcf/rules.mk
include $(SRC_DIR)/pfr/rules.mk
include $(SRC_DIR)/psaux/rules.mk
include $(SRC_DIR)/pshinter/rules.mk
include $(SRC_DIR)/psnames/rules.mk
include $(SRC_DIR)/raster/rules.mk
include $(SRC_DIR)/sdf/rules.mk
include $(SRC_DIR)/sfnt/rules.mk
include $(SRC_DIR)/smooth/rules.mk
include $(SRC_DIR)/svg/rules.mk
include $(SRC_DIR)/truetype/rules.mk
include $(SRC_DIR)/type1/rules.mk
include $(SRC_DIR)/type42/rules.mk
include $(SRC_DIR)/winfonts/rules.mk


FREETYPE_SOURCES := $(AUTOF_DRV_SRC) $(BASE_SRC) $(BDF_DRV_SRC) $(CACHE_DRV_SRC) \
					$(CFF_DRV_SRC) $(CID_DRV_SRC) $(GZIP_DRV_SRC) $(LZW_DRV_SRC) \
					$(PCF_DRV_SRC) $(PFR_DRV_SRC) $(PSAUX_DRV_SRC) $(PSHINTER_DRV_SRC) \
					$(PSNAMES_DRV_SRC) $(RASTER_DRV_SRC) $(SDF_DRV_SRC) $(SFNT_DRV_SRC) $(SVG_DRV_SRC) \
					$(SMOOTH_DRV_SRC) $(TT_DRV_SRC) $(T1_DRV_SRC) $(T42_DRV_SRC) $(FNT_DRV_SRC)

EXTRA_BASE_SRCS := $(BASE_DIR)/ftinit.c $(BASE_DIR)/ftbitmap.c $(BASE_DIR)/ftmm.c $(BASE_DIR)/ftsystem.c \
					$(BASE_DIR)/ftdebug.c

LOCAL_MODULE     := freetype
LOCAL_SRC_FILES  := $(FREETYPE_SOURCES) $(EXTRA_BASE_SRCS)
LOCAL_CFLAGS     := -DFT2_BUILD_LIBRARY=1
LOCAL_C_INCLUDES := $(FREETYPE_INCLUDES) $(FONTCONFIG_INCLUDES)


include $(BUILD_STATIC_LIBRARY)
