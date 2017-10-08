
#
# - Bloombox - bloombox-dashboard
#

BUILDBOT ?= 0
ENV ?= .env/
LINKS ?= no
TARGET ?= build/
CREDENTIALS ?=1
COMPONENTS_PATH ?= components/
VERBOSE ?= 0
VERSION ?= 0.0.6
POLYMER_BUILD_FLAGS ?= --sw-precache-config ./sw-precache-config.js
POLYMER_RELEASE_FLAGS ?= --sw-precache-config ./sw-precache-config.js

ifeq ($(VERBOSE),1)
RM ?= rm -v
CP ?= cp -v
RSYNC ?= rsync -v
TAR ?= tar -v
else
RM ?= rm
CP ?= cp
RSYNC ?= rsync
TAR ?= tar
endif

ifeq ($(LINKS),yes)
LINK_DEPS ?= link
else
LINK_DEPS ?=
endif


all: $(TARGET)
	@echo "bloombox-dashboard is ready."


#
## Build Flow
#

$(TARGET): $(ENV) dependencies $(LINK_DEPS)
	@mkdir -p $(TARGET)
	@echo "Staging build..."
	@polymer build $(POLYMER_BUILD_FLAGS);
	@cp -frv src/ $(TARGET)/bundled/
	@echo "Build complete."
	@$(TAR) -czf release.tar.gz $(TARGET)/

release: $(ENV) dependencies $(LINK_DEPS)
	@mkdir -p $(TARGET)
	@echo "Building dashboard in release mode..."
	@polymer build $(POLYMER_RELEASE_FLAGS);
	@echo "Build complete."
	@cp -frv src/ $(TARGET)/bundled/
	@echo "Building release package..."
	@cp -frv ./*.json ./*.html ./Makefile $(TARGET)
	@cd $(TARGET) && $(TAR) -czf ../$(VERSION).tar.gz *
	@echo "Release ready."

dependencies: $(COMPONENTS_PATH)

$(COMPONENTS_PATH):
	@echo "Installing project dependencies..."
	@bower install
	@echo "Dependencies ready."

link: $(COMPONENTS_PATH)
	@echo "Linking local dependencies..."
	@bower link bloombox-account
	@bower link bloombox-partner-info
	@bower link bloombox-settings
	@bower link bloombox-profile
	@bower link bloombox-elements
	@bower link bloombox-enroll
	@bower link bloombox-strain
	@bower link bloombox-edible
	@bower link bloombox-preroll
	@bower link bloombox-concentrate
	@bower link bloombox-cartridge
	@bower link bloombox-apothecary
	@bower link bloombox-device
	@bower link bloombox-analytics-chart
	@bower link bloombox-testing
	@bower link bloombox-menutools
	@bower link bloombox-media
	@bower link bloombox-user
	@bower link bloombox-logo
	@bower link bloombox-icons
	@bower link bloombox-pricelist
	@bower link bloombox-product-list
	@bower link bloombox-product
	@bower link bloombox-styles


clean:
	@echo "Cleaning project..."
	@find . -name .DS_Store -delete
	@$(RM) -fr $(TARGET) *.tar.gz

distclean: clean
	@echo "Resetting project..."
	@$(RM) -frv $(TARGET) $(ENV) $(COMPONENTS_PATH)
	@git reset --hard

forceclean: distclean
	@echo "Sanitizing project..."
	@git clean -xdf

#
## Dependencies
#

$(ENV):
	@echo "Establishing envroot..."
	@mkdir -p $(ENV)

.PHONY: all build release dependencies clean distclean forceclean

