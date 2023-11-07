Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c4f0300b003fc0505be19sm15358801wmq.37.2023.11.07.02.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:51:48 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5E0075F790;
	Tue,  7 Nov 2023 10:51:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] target/arm: mark the 32bit alias of PAR when LPAE enabled
Date: Tue,  7 Nov 2023 10:51:45 +0000
Message-Id: <20231107105145.2916124-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3HkKIVD6PLrc

We also mark it ARM_CP_NO_GDB so we avoid duplicate PAR's in the
system register XML we send to gdb.

Suggested-by: <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - only set ARM_CP_NO_GDB when no LPAE enabled
  - also mark as AP_CP_ALIAS
---
 target/arm/helper.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5dc0d20a84..80a35b29bb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3722,20 +3722,6 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
 }
 #endif
 
-static const ARMCPRegInfo vapa_cp_reginfo[] = {
-    { .name = "PAR", .cp = 15, .crn = 7, .crm = 4, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0,
-      .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.par_s),
-                             offsetoflow32(CPUARMState, cp15.par_ns) },
-      .writefn = par_write },
-#ifndef CONFIG_USER_ONLY
-    /* This underdecoding is safe because the reginfo is NO_RAW. */
-    { .name = "ATS", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = CP_ANY,
-      .access = PL1_W, .accessfn = ats_access,
-      .writefn = ats_write, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC },
-#endif
-};
-
 /* Return basic MPU access permission bits.  */
 static uint32_t simple_mpu_ap_bits(uint32_t val)
 {
@@ -8904,6 +8890,24 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, generic_timer_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_VAPA)) {
+        ARMCPRegInfo vapa_cp_reginfo[] = {
+            { .name = "PAR", .cp = 15, .crn = 7, .crm = 4, .opc1 = 0, .opc2 = 0,
+              .access = PL1_RW, .resetvalue = 0,
+              .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.par_s),
+                                     offsetoflow32(CPUARMState, cp15.par_ns) },
+              .writefn = par_write},
+#ifndef CONFIG_USER_ONLY
+            /* This underdecoding is safe because the reginfo is NO_RAW. */
+            { .name = "ATS", .cp = 15, .crn = 7, .crm = 8, .opc1 = 0, .opc2 = CP_ANY,
+              .access = PL1_W, .accessfn = ats_access,
+              .writefn = ats_write, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC },
+#endif
+        };
+
+        /* When LPAE exists the PAR register is an alias */
+        if (arm_feature(env, ARM_FEATURE_LPAE)) {
+            vapa_cp_reginfo[0].type = ARM_CP_ALIAS | ARM_CP_NO_GDB;
+        }
         define_arm_cp_regs(cpu, vapa_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_CACHE_TEST_CLEAN)) {
-- 
2.39.2
