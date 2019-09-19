Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s1sm14108473wrg.80.2019.09.19.10.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:19:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1543E1FF9E;
	Thu, 19 Sep 2019 18:10:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 14/16] configure: preserve PKG_CONFIG for subdir builds
Date: Thu, 19 Sep 2019 18:10:13 +0100
Message-Id: <20190919171015.12681-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4c8MC9OzfGhV

The slirp sub-module complains about not being able to find the glib
library on cross-compiles because it is using the default pkg-config
tool (which isn't installed in our cross-build docker images).
Preserve PKG_CONFIG in our host config and pass it down to slirp.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile  | 6 +++++-
 configure | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 111082ce545..3cf5b1e7539 100644
--- a/Makefile
+++ b/Makefile
@@ -499,7 +499,11 @@ capstone/all: .git-submodule-status
 
 .PHONY: slirp/all
 slirp/all: .git-submodule-status
-	$(call quiet-command,$(MAKE) -C $(SRC_PATH)/slirp BUILD_DIR="$(BUILD_DIR)/slirp" CC="$(CC)" AR="$(AR)" LD="$(LD)" RANLIB="$(RANLIB)" CFLAGS="$(QEMU_CFLAGS) $(CFLAGS)" LDFLAGS="$(LDFLAGS)")
+	$(call quiet-command,$(MAKE) -C $(SRC_PATH)/slirp		\
+		BUILD_DIR="$(BUILD_DIR)/slirp" 			\
+		PKG_CONFIG="$(PKG_CONFIG)" 				\
+		CC="$(CC)" AR="$(AR)" 	LD="$(LD)" RANLIB="$(RANLIB)"	\
+		CFLAGS="$(QEMU_CFLAGS) $(CFLAGS)" LDFLAGS="$(LDFLAGS)")
 
 # Compatibility gunk to keep make working across the rename of targets
 # for recursion, to be removed some time after 4.1.
diff --git a/configure b/configure
index 30aad233d17..377fbdc9f1b 100755
--- a/configure
+++ b/configure
@@ -7302,6 +7302,7 @@ echo "OBJCOPY=$objcopy" >> $config_host_mak
 echo "LD=$ld" >> $config_host_mak
 echo "RANLIB=$ranlib" >> $config_host_mak
 echo "NM=$nm" >> $config_host_mak
+echo "PKG_CONFIG=$pkg_config_exe" >> $config_host_mak
 echo "WINDRES=$windres" >> $config_host_mak
 echo "CFLAGS=$CFLAGS" >> $config_host_mak
 echo "CFLAGS_NOPIE=$CFLAGS_NOPIE" >> $config_host_mak
-- 
2.20.1
