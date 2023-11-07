Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id c7-20020a5d4cc7000000b0032fa66bda58sm2495423wrt.101.2023.11.07.06.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 06:23:55 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id DEF596573F;
	Tue,  7 Nov 2023 14:23:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 03/23] target/arm: mark the 32bit alias of PAR when LPAE enabled
Date: Tue,  7 Nov 2023 14:23:34 +0000
Message-Id: <20231107142354.3151266-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231107142354.3151266-1-alex.bennee@linaro.org>
References: <20231107142354.3151266-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qflF0DdiURWT

We also mark it ARM_CP_NO_GDB so we avoid duplicate PAR's in the
system register XML we send to gdb.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20231107105145.2916124-1-alex.bennee@linaro.org>

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5dc0d20a84..6acd87f5b9 100644
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
@@ -8904,6 +8890,27 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
+        /*
+         * When LPAE exists this 32-bit PAR register is an alias of the
+         * 64-bit AArch32 PAR register defined in lpae_cp_reginfo[]
+         */
+        if (arm_feature(env, ARM_FEATURE_LPAE)) {
+            vapa_cp_reginfo[0].type = ARM_CP_ALIAS | ARM_CP_NO_GDB;
+        }
         define_arm_cp_regs(cpu, vapa_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_CACHE_TEST_CLEAN)) {
-- 
2.39.2
