Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a3sm23805858wrp.91.2020.06.15.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 07:19:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 077F91FF8C;
	Mon, 15 Jun 2020 15:19:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	richard.henderson@linaro.org,
	balrogg@gmail.com,
	aurelien@aurel32.net,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 2/2] tests/tcg: ensure -cpu max also used for plugin run
Date: Mon, 15 Jun 2020 15:19:22 +0100
Message-Id: <20200615141922.18829-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200615141922.18829-1-alex.bennee@linaro.org>
References: <20200615141922.18829-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: wDQB5zcG05s9

The check-tcg plugins build was failing because some special case
tests that needed -cpu max failed because the plugin variant hadn't
carried across the QEMU_OPTS tweak.

Guests which globally set QEMU_OPTS=-cpu FOO where unaffected.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 3 ++-
 tests/tcg/i386/Makefile.target    | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 6d60a2f2eed..b617f2ac7e0 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -20,8 +20,9 @@ run-fcvt: fcvt
 # Pauth Tests
 ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4
-run-pauth-%: QEMU_OPTS += -cpu max
 pauth-%: CFLAGS += -march=armv8.3-a
+run-pauth-%: QEMU_OPTS += -cpu max
+run-plugin-pauth-%: QEMU_OPTS += -cpu max
 endif
 
 # Semihosting smoke test for linux-user
diff --git a/tests/tcg/i386/Makefile.target b/tests/tcg/i386/Makefile.target
index 53efec06683..1a6463a7dc1 100644
--- a/tests/tcg/i386/Makefile.target
+++ b/tests/tcg/i386/Makefile.target
@@ -12,6 +12,7 @@ X86_64_TESTS:=$(filter test-i386-ssse3, $(ALL_X86_TESTS))
 
 test-i386-pcmpistri: CFLAGS += -msse4.2
 run-test-i386-pcmpistri: QEMU_OPTS += -cpu max
+run-plugin-test-i386-pcmpistri-%: QEMU_OPTS += -cpu max
 
 #
 # hello-i386 is a barebones app
-- 
2.20.1
