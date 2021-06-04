Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y22sm10838514wma.36.2021.06.04.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 368EA1FF91;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 60/99] target/arm: cleanup cpu includes
Date: Fri,  4 Jun 2021 16:52:33 +0100
Message-Id: <20210604155312.15902-61-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hg26jm6HQ+Ga

From: Claudio Fontana <cfontana@suse.de>

cpu.c,
cpu32.c,
cpu64.c,
tcg/sysemu/tcg-cpu.c,

all need a good cleanup when it comes to included header files.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c                |  6 ++----
 target/arm/cpu32.c              | 14 --------------
 target/arm/cpu64.c              |  6 ------
 target/arm/tcg/sysemu/tcg-cpu.c | 22 +---------------------
 4 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9b81cbe386..7e3726ff00 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -21,24 +21,22 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "target/arm/idau.h"
-#include "qemu/module.h"
 #include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #include "cpregs.h"
+
 #ifdef CONFIG_TCG
 #include "tcg/tcg-cpu.h"
 #endif /* CONFIG_TCG */
 #include "cpu32.h"
-#include "internals.h"
 #include "exec/exec-all.h"
 #include "hw/qdev-properties.h"
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
 #endif
+
 #include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
 #include "kvm/kvm_arm.h"
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
diff --git a/target/arm/cpu32.c b/target/arm/cpu32.c
index 56f02ca891..6c53245d66 100644
--- a/target/arm/cpu32.c
+++ b/target/arm/cpu32.c
@@ -20,26 +20,12 @@
 
 #include "qemu/osdep.h"
 #include "qemu/qemu-print.h"
-#include "qemu-common.h"
-#include "target/arm/idau.h"
 #include "qemu/module.h"
-#include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #include "cpregs.h"
-#include "internals.h"
-#include "exec/exec-all.h"
-#include "hw/qdev-properties.h"
 #if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
 #include "hw/boards.h"
 #endif
-#include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
-#include "kvm/kvm_arm.h"
-#include "disas/capstone.h"
-#include "fpu/softfloat.h"
 #include "cpu-mmu.h"
 #include "cpu32.h"
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index f5ead76374..a8ff1994ca 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -23,13 +23,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "cpu32.h"
-#ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
 #include "qemu/module.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#endif
 #include "sysemu/kvm.h"
 #include "kvm/kvm_arm.h"
 #include "qapi/visitor.h"
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 6ab49ba614..327b2a5073 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -19,29 +19,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/qemu-print.h"
-#include "qemu-common.h"
-#include "target/arm/idau.h"
-#include "qemu/module.h"
-#include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
 #include "semihosting/common-semi.h"
-#include "cpregs.h"
-#include "internals.h"
-#include "exec/exec-all.h"
-#include "hw/qdev-properties.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#include "hw/boards.h"
-#endif
-#include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
-#include "sysemu/hw_accel.h"
-#include "disas/capstone.h"
-#include "fpu/softfloat.h"
-#include "cpu-mmu.h"
+#include "qemu/log.h"
 #include "tcg/tcg-cpu.h"
 
 /*
-- 
2.20.1
