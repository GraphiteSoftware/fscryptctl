# external/fscryptctl$ make
# cc  -O2 -Wall -DVERSION="\"0.1.0\"" fscryptctl.c -c -o fscryptctl.o
# cc  -O2 -Wall sha512.c -c -o sha512.o
# cc -O2 -Wall  fscryptctl.o sha512.o -o fscryptctl

LOCAL_PATH := $(call my-dir)

RELEASE_VERSION := 0.1.0
TAG_VERSION := $(shell git -C $(LOCAL_PATH) describe --tags 2>/dev/null)
VERSION := $(if $(TAG_VERSION),$(TAG_VERSION),$(RELEASE_VERSION))

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    fscryptctl.c \
    sha512.c \

LOCAL_CFLAGS := -DVERSION="\"$(VERSION)\""
LOCAL_MODULE := fscryptctl
LOCAL_MODULE_TAGS := optional
include $(BUILD_EXECUTABLE)
