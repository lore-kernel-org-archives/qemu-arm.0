Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c12sm8185315wrr.90.2021.06.04.09.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C61851FFB7;
	Fri,  4 Jun 2021 16:53:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 31/99] target/arm: tcg: add stubs for some helpers for non-tcg builds
Date: Fri,  4 Jun 2021 16:52:04 +0100
Message-Id: <20210604155312.15902-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ouKFnEXdxFD4

From: Claudio Fontana <cfontana@suse.de>

this first armv7m one should go away with proper
configuration changes (only enabling possible boards for KVM).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-stubs.c | 16 ++++++++++++++++
 target/arm/tcg/meson.build |  3 +++
 2 files changed, 19 insertions(+)
 create mode 100644 target/arm/tcg/tcg-stubs.c

diff --git a/target/arm/tcg/tcg-stubs.c b/target/arm/tcg/tcg-stubs.c
new file mode 100644
index 0000000000..14220d59a1
--- /dev/null
+++ b/target/arm/tcg/tcg-stubs.c
@@ -0,0 +1,16 @@
+/*
+ * QEMU ARM stubs for some TCG helper functions
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    g_assert_not_reached();
+}
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 3d34723eee..78c34742ec 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,6 +30,9 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vfp_helper.c',
   'crypto_helper.c',
   'debug_helper.c',
+
+), if_false: files(
+  'tcg-stubs.c',
 ))
 
 arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
-- 
2.20.1
