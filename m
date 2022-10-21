Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id o18-20020adfcf12000000b0022a297950cesm19460927wrj.23.2022.10.21.10.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 10:23:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F2C0D1FFB7;
	Fri, 21 Oct 2022 18:23:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: don't process FCSE translations on physical TLBs
Date: Fri, 21 Oct 2022 18:23:38 +0100
Message-Id: <20221021172338.2782240-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EaqXIbdyhItY

A recent change to the page table walking code missed checking if we
are at the processing the physical translation and bombs attempting to
derive the current EL. Fix this by introducing a new
helper (regime_is_phys) and extending the check around the FCSE
processing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Fixes: f3639a64f6 (target/arm: Use softmmu tlbs for page table walking)
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 12 ++++++++++++
 target/arm/ptw.c       |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c3c3920ded..0e753203b5 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -673,6 +673,18 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
     }
 }
 
+static inline bool regime_is_phys(ARMMMUIdx mmu_idx)
+{
+    switch (mmu_idx) {
+    case ARMMMUIdx_Phys_NS:
+    case ARMMMUIdx_Phys_S:
+        return true;
+    default:
+        return false;
+    }
+}
+
+
 /* Return the exception level which controls this address translation regime */
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 6c5ed56a10..1456a2f1de 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2557,7 +2557,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
      * Fast Context Switch Extension. This doesn't exist at all in v8.
      * In v7 and earlier it affects all stage 1 translations.
      */
-    if (address < 0x02000000 && mmu_idx != ARMMMUIdx_Stage2
+    if (address < 0x02000000 && !(mmu_idx == ARMMMUIdx_Stage2 || regime_is_phys(mmu_idx))
         && !arm_feature(env, ARM_FEATURE_V8)) {
         if (regime_el(env, mmu_idx) == 3) {
             address += env->cp15.fcseidr_s;
-- 
2.34.1
