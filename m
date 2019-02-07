Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id r12sm26872714wrq.3.2019.02.07.10.37.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:37:53 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2EF621FF8C;
	Thu,  7 Feb 2019 18:37:45 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 12/16] tests/vm: move images to $HOME/.cache/qemu-vm/images
Date: Thu,  7 Feb 2019 18:37:40 +0000
Message-Id: <20190207183744.5054-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +bqEr56kypz1

From: Gerd Hoffmann <kraxel@redhat.com>

It's easier to move around the images then, by replacing the
subdirectory with a symlink.  Allows to share the images between
multiple qemu checkouts for example.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/Makefile.include | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index a98fb3027f..a58383d263 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -3,7 +3,8 @@
 .PHONY: vm-build-all vm-clean-all
 
 IMAGES := ubuntu.i386 freebsd netbsd openbsd centos
-IMAGE_FILES := $(patsubst %, tests/vm/%.img, $(IMAGES))
+IMAGES_DIR := $(HOME)/.cache/qemu-vm/images
+IMAGE_FILES := $(patsubst %, $(IMAGES_DIR)/%.img, $(IMAGES))
 
 .PRECIOUS: $(IMAGE_FILES)
 
@@ -24,9 +25,10 @@ vm-build-all: $(addprefix vm-build-, $(IMAGES))
 vm-clean-all:
 	rm -f $(IMAGE_FILES)
 
-tests/vm/%.img: $(SRC_PATH)/tests/vm/% \
-		$(SRC_PATH)/tests/vm/basevm.py \
-		$(SRC_PATH)/tests/vm/Makefile.include
+$(IMAGES_DIR)/%.img:	$(SRC_PATH)/tests/vm/% \
+			$(SRC_PATH)/tests/vm/basevm.py \
+			$(SRC_PATH)/tests/vm/Makefile.include
+	@mkdir -p $(IMAGES_DIR)
 	$(call quiet-command, \
 		$< \
 		$(if $(V)$(DEBUG), --debug) \
@@ -37,7 +39,7 @@ tests/vm/%.img: $(SRC_PATH)/tests/vm/% \
 
 
 # Build in VM $(IMAGE)
-vm-build-%: tests/vm/%.img
+vm-build-%: $(IMAGES_DIR)/%.img
 	$(call quiet-command, \
 		$(SRC_PATH)/tests/vm/$* \
 		$(if $(V)$(DEBUG), --debug) \
-- 
2.20.1
