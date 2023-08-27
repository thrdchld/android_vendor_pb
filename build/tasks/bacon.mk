# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# PixelBuilds update package

PIXELBUILDS_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PIXELBUILDS_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(PIXELBUILDS_TARGET_PACKAGE)
	$(hide) $(SHA256) $(PIXELBUILDS_TARGET_PACKAGE) | cut -d ' ' -f1 > $(PIXELBUILDS_TARGET_PACKAGE).sha256sum
	@echo "Package Complete: $(PIXELBUILDS_TARGET_PACKAGE)" >&2
	@echo "sha256:" $(shell cat $(PIXELBUILDS_TARGET_PACKAGE).sha256sum | cut -d ' ' -f 1)
	echo "";
	cat build/make/pb_ascii_logo;
	echo "";
