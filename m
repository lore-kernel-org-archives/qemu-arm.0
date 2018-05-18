Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d83-v6sm9959996wmh.16.2018.05.18.04.44.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 May 2018 04:44:24 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 389E23E0260;
	Fri, 18 May 2018 12:44:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 1/2] target/arm: support reading of CNT[VCT|FRQ]_EL0 from user-space
Date: Fri, 18 May 2018 12:44:23 +0100
Message-Id: <20180518114424.18054-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518114424.18054-1-alex.bennee@linaro.org>
References: <20180518114424.18054-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /MNwDWROyhNs

Since kernel commit a86bd139f2 (arm64: arch_timer: Enable CNTVCT_EL0
trap..) user-space has been able to read these system registers. As we
can't use QEMUTimer's in linux-user mode we just directly call
cpu_get_clock().

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - include CNTFRQ_EL0 for PL0_R only
---
 target/arm/helper.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index db8bbe52a6..39098a15bf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2135,11 +2135,32 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
 };
 
 #else
-/* In user-mode none of the generic timer registers are accessible,
- * and their implementation depends on QEMU_CLOCK_VIRTUAL and qdev gpio outputs,
- * so instead just don't register any of them.
+
+/* In user-mode most of the generic timer registers are inaccessible
+ * however modern kernels (4.12+) allow access to cntvct_el0
  */
+
+static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* Currently we have no support for QEMUTimer in linux-user so we
+     * can't call gt_get_countervalue(env), instead we directly
+     * call the lower level functions.
+     */
+    return cpu_get_clock() / GTIMER_SCALE;
+}
+
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
+    { .name = "CNTFRQ_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 0,
+      .access = PL0_R /* no PL1_RW in linux-user */,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_cntfrq),
+      .resetvalue = (1000 * 1000 * 1000) / GTIMER_SCALE,
+    },
+    { .name = "CNTVCT_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 2,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .readfn = gt_virt_cnt_read,
+    },
     REGINFO_SENTINEL
 };
 
-- 
2.17.0
