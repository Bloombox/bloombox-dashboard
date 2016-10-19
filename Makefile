
#
# - Bloombox - bloombox-dashboard
#

BUILDBOT ?= 0
ENV ?= .env/
TARGET ?= build/
CREDENTIALS ?= 1

all: build
	@echo "bloombox-dashboard is ready."


#
## Build Flow
#

build: $(TARGET) $(ENV) dependencies
	@polymer build --sw-precache-config ./sw-precache-config.js
	@echo "Build complete."

release: build
	@echo "Building release package..."
	@tar -czvf release.tar.gz $(TARGET)/
	@mv release.tar.gz $(TARGET)/
	@echo "Release ready."

dependencies:
	@echo "Installing project dependencies..."
	@bower install
	@echo "Dependencies ready."

clean:
	@echo "Cleaning project..."
	@find . -name .DS_Store -delete
	@rm -frv $(TARGET)

distclean: clean
	@echo "Resetting project..."
	@rm -frv $(TARGET) $(ENV)
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

$(TARGET):
	@echo "Establishing buildroot..."
	@mkdir -p $(TARGET)


.PHONY: all build release dependencies clean distclean forceclean

