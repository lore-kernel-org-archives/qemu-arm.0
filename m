Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z14sm13469930wrm.48.2019.02.05.11.02.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Feb 2019 11:02:26 -0800 (PST)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A1C4A1FF83;
	Tue,  5 Feb 2019 19:02:24 +0000 (UTC)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 3/6] target/arm: expose MPIDR_EL1 to userspace
Date: Tue,  5 Feb 2019 19:02:21 +0000
Message-Id: <20190205190224.2198-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205190224.2198-1-alex.bennee@linaro.org>
References: <20190205190224.2198-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YRgPb+P+I2Va

As this is a single register we could expose it with a simple ifdef
but we use the existing modify_arm_cp_regs mechanism for consistency.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f90754cc11..f2f868ff92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3657,13 +3657,6 @@ static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return mpidr_read_val(env);
 }
 
-static const ARMCPRegInfo mpidr_cp_reginfo[] = {
-    { .name = "MPIDR", .state = ARM_CP_STATE_BOTH,
-      .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
-      .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
-    REGINFO_SENTINEL
-};
-
 static const ARMCPRegInfo lpae_cp_reginfo[] = {
     /* NOP AMAIR0/1 */
     { .name = "AMAIR0", .state = ARM_CP_STATE_BOTH,
@@ -6445,6 +6438,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
 
     if (arm_feature(env, ARM_FEATURE_MPIDR)) {
+        ARMCPRegInfo mpidr_cp_reginfo[] = {
+            { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
+              .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
+              .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
+            REGINFO_SENTINEL
+        };
+#ifdef CONFIG_USER_ONLY
+        ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
+            { .name = "MPIDR_EL1",
+              .fixed_bits = 0x0000000080000000 },
+            REGUSERINFO_SENTINEL
+        };
+        modify_arm_cp_regs(mpidr_cp_reginfo, mpidr_user_cp_reginfo);
+#endif
         define_arm_cp_regs(cpu, mpidr_cp_reginfo);
     }
 
-- 
2.20.1
