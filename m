Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5b4f87sm537915366b.48.2024.07.18.02.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:45:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F1C575FA43;
	Thu, 18 Jul 2024 10:45:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Bin Meng <bmeng.cn@gmail.com>,
	qemu-riscv@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Beraldo Leal <bleal@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Ed Maste <emaste@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 10/15] target/mips: Add semihosting stub
Date: Thu, 18 Jul 2024 10:45:18 +0100
Message-Id: <20240718094523.1198645-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240718094523.1198645-1-alex.bennee@linaro.org>
References: <20240718094523.1198645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: edGKb1afJEaz

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since the SEMIHOSTING feature is optional, we need
a stub to link when it is disabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20240717105723.58965-4-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/mips/tcg/sysemu/semihosting-stub.c | 15 +++++++++++++++
 target/mips/tcg/sysemu/meson.build        |  6 ++++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 target/mips/tcg/sysemu/semihosting-stub.c

diff --git a/target/mips/tcg/sysemu/semihosting-stub.c b/target/mips/tcg/sysemu/semihosting-stub.c
new file mode 100644
index 0000000000..7ae27d746f
--- /dev/null
+++ b/target/mips/tcg/sysemu/semihosting-stub.c
@@ -0,0 +1,15 @@
+/*
+ *  MIPS semihosting stub
+ *
+ * SPDX-FileContributor: Philippe Mathieu-Daudé <philmd@linaro.org>
+ * SPDX-FileCopyrightText: 2024 Linaro Ltd.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "internal.h"
+
+void mips_semihosting(CPUMIPSState *env)
+{
+    g_assert_not_reached();
+}
diff --git a/target/mips/tcg/sysemu/meson.build b/target/mips/tcg/sysemu/meson.build
index ec665a4b1e..911341ac37 100644
--- a/target/mips/tcg/sysemu/meson.build
+++ b/target/mips/tcg/sysemu/meson.build
@@ -1,10 +1,12 @@
 mips_system_ss.add(files(
   'cp0_helper.c',
-  'mips-semi.c',
   'special_helper.c',
   'tlb_helper.c',
 ))
-
+mips_system_ss.add(when: ['CONFIG_SEMIHOSTING'],
+  if_true: files('mips-semi.c'),
+  if_false: files('semihosting-stub.c')
+)
 mips_system_ss.add(when: 'TARGET_MIPS64', if_true: files(
   'lcsr_helper.c',
 ))
-- 
2.39.2
