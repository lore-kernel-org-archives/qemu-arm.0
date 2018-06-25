Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z14-v6sm14782771wrm.49.2018.06.25.09.00.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jun 2018 09:00:09 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 5EB693E08B3;
	Mon, 25 Jun 2018 17:00:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 2/5] target/arm: relax permission checks for HWCAP_CPUID registers
Date: Mon, 25 Jun 2018 17:00:06 +0100
Message-Id: <20180625160009.17437-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180625160009.17437-1-alex.bennee@linaro.org>
References: <20180625160009.17437-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4XkvXcPep+CQ

Although technically not visible to userspace the kernel does make
them visible via trap and emulate. For user mode we can provide the
value directly but we need to relax our permission checks to do this.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6e6b1762e8..9d81feb124 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5813,7 +5813,19 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     if (r->state != ARM_CP_STATE_AA32) {
         int mask = 0;
         switch (r->opc1) {
-        case 0: case 1: case 2:
+        case 0:
+#ifdef CONFIG_USER_ONLY
+            /* Some AArch64 CPU ID/feature are exported to userspace
+             * by the kernel (see HWCAP_CPUID) */
+            if (r->opc0 == 3 && r->crn == 0 &&
+                (r->crm == 0 ||
+                 (r->crm >= 4 && r->crm <= 7))) {
+                mask = PL0_R;
+                break;
+            }
+#endif
+            /* fall-through */
+        case 1: case 2:
             /* min_EL EL1 */
             mask = PL1_RW;
             break;
-- 
2.17.1
