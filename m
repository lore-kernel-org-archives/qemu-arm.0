Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u3sm102257wrq.21.2019.02.07.10.45.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Feb 2019 10:45:05 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 534601FF8F;
	Thu,  7 Feb 2019 18:37:45 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH  v2 15/16] tests/vm: expose BUILD_TARGET, TARGET_LIST and EXTRA_CONFIGURE_OPTS
Date: Thu,  7 Feb 2019 18:37:43 +0000
Message-Id: <20190207183744.5054-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207183744.5054-1-alex.bennee@linaro.org>
References: <20190207183744.5054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EwJ/ZqgObt+p

Now the underlying basevm support passes these along we can expose
some additional variables to our Makefile to allow more customised
tweaking of the build. For example:

  make vm-build-freebsd TARGET_LIST=aarch64-softmmu \
    EXTRA_CONFIGURE_OPTS="--disable-tools --disable-docs" \
    BUILD_TARGET=check-softfloat

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/vm/Makefile.include | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index a58383d263..992d823f6b 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -19,6 +19,11 @@ vm-test:
 	@echo ""
 	@echo "  vm-build-all                    - Build QEMU in all VMs"
 	@echo "  vm-clean-all                    - Clean up VM images"
+	@echo
+	@echo "Special variables:"
+	@echo "    BUILD_TARGET=foo		 - override the build target"
+	@echo "    TARGET_LIST=a,b,c    	 - Override target list in builds."
+	@echo '    EXTRA_CONFIGURE_OPTS="..."'
 
 vm-build-all: $(addprefix vm-build-, $(IMAGES))
 
@@ -47,6 +52,9 @@ vm-build-%: $(IMAGES_DIR)/%.img
 		$(if $(J),--jobs $(J)) \
 		$(if $(V),--verbose) \
 		--image "$<" \
-		--build-qemu $(SRC_PATH), \
+		$(if $(BUILD_TARGET),--build-target $(BUILD_TARGET)) \
+		--build-qemu $(SRC_PATH) -- \
+		$(if $(TARGET_LIST),--target-list=$(TARGET_LIST)) \
+		$(if $(EXTRA_CONFIGURE_OPTS),$(EXTRA_CONFIGURE_OPTS)), \
 		"  VM-BUILD $*")
 
-- 
2.20.1
