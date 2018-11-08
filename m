Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v9-v6sm5318751wrm.6.2018.11.08.08.33.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Nov 2018 08:33:30 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id F1AA73E045E;
	Thu,  8 Nov 2018 16:33:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 1/6] target/arm64: properly handle DBGVR RESS bits
Date: Thu,  8 Nov 2018 16:33:24 +0000
Message-Id: <20181108163329.19940-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181108163329.19940-1-alex.bennee@linaro.org>
References: <20181108163329.19940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4tJfFuW9nBoC

This only fails with some (broken) versions of gdb but we should
treat the top bits of DBGBVR as RESS. Properly sign extend QEMU's
reference copy of dbgbvr and also update the register descriptions in
the comment.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - sanitise register on insertion
  - update reference description
---
 target/arm/kvm64.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 5de8ff0ac5..b92ce3437f 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -103,7 +103,7 @@ static void kvm_arm_init_debug(CPUState *cs)
  * capable of fancier matching but that will require exposing that
  * fanciness to GDB's interface
  *
- * D7.3.2 DBGBCR<n>_EL1, Debug Breakpoint Control Registers
+ * DBGBCR<n>_EL1, Debug Breakpoint Control Registers
  *
  *  31  24 23  20 19   16 15 14  13  12   9 8   5 4    3 2   1  0
  * +------+------+-------+-----+----+------+-----+------+-----+---+
@@ -115,12 +115,25 @@ static void kvm_arm_init_debug(CPUState *cs)
  * SSC/HMC/PMC: Security, Higher and Priv access control (Table D-12)
  * BAS: Byte Address Select (RES1 for AArch64)
  * E: Enable bit
+ *
+ * DBGBVR<n>_EL1, Debug Breakpoint Value Registers
+ *
+ *  63  53 52       49 48       2  1 0
+ * +------+-----------+----------+-----+
+ * | RESS | VA[52:49] | VA[48:2] | 0 0 |
+ * +------+-----------+----------+-----+
+ *
+ * Depending on the addressing mode bits the top bits of the register
+ * are a sign extension of the highest applicable VA bit. Some
+ * versions of GDB don't do it correctly so we ensure they are correct
+ * here so future PC comparisons will work properly.
  */
+
 static int insert_hw_breakpoint(target_ulong addr)
 {
     HWBreakpoint brk = {
         .bcr = 0x1,                             /* BCR E=1, enable */
-        .bvr = addr
+        .bvr = sextract64(addr, 52, 53)
     };
 
     if (cur_hw_bps >= max_hw_bps) {
-- 
2.17.1
