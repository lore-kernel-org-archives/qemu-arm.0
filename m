Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x17sm2343829wmc.2.2018.04.16.07.03.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Apr 2018 07:03:30 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 263933E01CA;
	Mon, 16 Apr 2018 15:03:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	takeharu.kato@linaro.org,
	renato.golin@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: support reading of CNTVCT_EL0 from user-space
Date: Mon, 16 Apr 2018 15:03:22 +0100
Message-Id: <20180416140322.904-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZS8XDqo6+0i2

Since kernel commit a86bd139f2 (arm64: arch_timer: Enable CNTVCT_EL0
trap..) user-space has been able to read this system register. This
patch enables access to that register although currently it always
returns 0 as we don't yet have a mechanism for managing timers in
linux-user mode.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b14fdab140..8244badd63 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2121,11 +2121,25 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
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
+     * can't call gt_get_countervalue(env).
+     */
+    return 0;
+}
+
 static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
+    { .name = "CNTVCT_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 0, .opc2 = 2,
+      .access = PL0_R, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .readfn = gt_virt_cnt_read,
+    },
     REGINFO_SENTINEL
 };
 
-- 
2.17.0
