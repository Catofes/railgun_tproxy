# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := setsockopt
DEFS_Debug := \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions

INCS_Debug := \
	-I/home/herbertqiao/.node-gyp/0.12.0/src \
	-I/home/herbertqiao/.node-gyp/0.12.0/deps/uv/include \
	-I/home/herbertqiao/.node-gyp/0.12.0/deps/v8/include

DEFS_Release := \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-O3 \
	-ffunction-sections \
	-fdata-sections \
	-fno-tree-vrp \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions

INCS_Release := \
	-I/home/herbertqiao/.node-gyp/0.12.0/src \
	-I/home/herbertqiao/.node-gyp/0.12.0/deps/uv/include \
	-I/home/herbertqiao/.node-gyp/0.12.0/deps/v8/include

OBJS := \
	$(obj).target/$(TARGET)/src/setsockopt.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64

LIBS :=

$(obj).target/setsockopt.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/setsockopt.node: LIBS := $(LIBS)
$(obj).target/setsockopt.node: TOOLSET := $(TOOLSET)
$(obj).target/setsockopt.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/setsockopt.node
# Add target alias
.PHONY: setsockopt
setsockopt: $(builddir)/setsockopt.node

# Copy this to the executable output path.
$(builddir)/setsockopt.node: TOOLSET := $(TOOLSET)
$(builddir)/setsockopt.node: $(obj).target/setsockopt.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/setsockopt.node
# Short alias for building this executable.
.PHONY: setsockopt.node
setsockopt.node: $(obj).target/setsockopt.node $(builddir)/setsockopt.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/setsockopt.node

