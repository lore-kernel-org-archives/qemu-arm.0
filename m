Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id m11sm5748495wmq.33.2021.06.04.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A8E821FF8F;
	Fri,  4 Jun 2021 16:53:17 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 38/99] target/arm: move arm_sctlr away from tcg helpers
Date: Fri,  4 Jun 2021 16:52:11 +0100
Message-Id: <20210604155312.15902-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WiQeaFLH7Tck

From: Claudio Fontana <cfontana@suse.de>

this function is used for kvm too, add it to the
cpu-common module.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 11 +++++++++++
 target/arm/tcg/helper.c | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index a34f7f19d8..93aea216cc 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -342,3 +342,14 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
 }
 
 /* #endif TARGET_AARCH64 , see matching comment above */
+
+uint64_t arm_sctlr(CPUARMState *env, int el)
+{
+    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
+    if (el == 0) {
+        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
+        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
+            ? 2 : 1;
+    }
+    return env->cp15.sctlr_el[el];
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index 93fa3fa2a9..b9ea043f20 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -1675,17 +1675,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-uint64_t arm_sctlr(CPUARMState *env, int el)
-{
-    /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
-    if (el == 0) {
-        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
-             ? 2 : 1;
-    }
-    return env->cp15.sctlr_el[el];
-}
-
 /* Returns true if the stage 1 translation regime is using LPAE format page
  * tables. Used when raising alignment exceptions, whose FSR changes depending
  * on whether the long or short descriptor format is in use. */
-- 
2.20.1
