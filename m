Received: by 10.25.0.144 with SMTP id 138csp1835841lfa;
        Tue, 25 Apr 2017 05:07:19 -0700 (PDT)
X-Received: by 10.28.0.142 with SMTP id 136mr12865293wma.123.1493122039729;
        Tue, 25 Apr 2017 05:07:19 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id b128si3885970wmb.13.2017.04.25.05.07.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:07:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2zFX-0003bL-7B; Tue, 25 Apr 2017 13:07:19 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [PATCH 13/13] arm: Implement HFNMIENA support for M profile MPU
Date: Tue, 25 Apr 2017 13:07:10 +0100
Message-Id: <1493122030-32191-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
X-TUID: js5vvQBI14A6

Implement HFNMIENA support for the M profile MPU. This bit controls
whether the MPU is treated as enabled when executing at execution
priorities of less than zero (in NMI, HardFault or with the FAULTMASK
bit set).

Doing this requires us to use a different MMU index for "running
at execution priority < 0", because we will have different
access permissions for that case versus the normal case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 24 +++++++++++++++++++++++-
 target/arm/helper.c    | 18 +++++++++++++++++-
 target/arm/translate.c |  1 +
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bbdd064..2e873e8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2043,6 +2043,18 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  * for the accesses done as part of a stage 1 page table walk, rather than
  * having to walk the stage 2 page table over and over.)
  *
+ * R profile CPUs have an MPU, but can use the same set of MMU indexes
+ * as A profile. They only need to distinguish NS EL0 and NS EL1 (and
+ * NS EL2 if we ever model a Cortex-R52).
+ *
+ * M profile CPUs are rather different as they do not have a true MMU.
+ * They have the following different MMU indexes:
+ *  User
+ *  Privileged
+ *  Execution priority negative (this is like privileged, but the
+ *  MPU HFNMIENA bit means that it may have different access permission
+ *  check results to normal privileged code, so can't share a TLB).
+ *
  * The ARMMMUIdx and the mmu index value used by the core QEMU TLB code
  * are not quite the same -- different CPU types (most notably M profile
  * vs A/R profile) would like to use MMU indexes with different semantics,
@@ -2078,6 +2090,7 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_S2NS = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_MUser = 0 | ARM_MMU_IDX_M,
     ARMMMUIdx_MPriv = 1 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MNegPri = 2 | ARM_MMU_IDX_M,
     /* Indexes below here don't have TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
      */
@@ -2098,6 +2111,7 @@ typedef enum ARMMMUIdxBit {
     ARMMMUIdxBit_S2NS = 1 << 6,
     ARMMMUIdxBit_MUser = 1 << 0,
     ARMMMUIdxBit_MPriv = 1 << 1,
+    ARMMMUIdxBit_MNegPri = 1 << 2,
 } ARMMMUIdxBit;
 
 #define MMU_USER_IDX 0
@@ -2123,7 +2137,7 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     case ARM_MMU_IDX_A:
         return mmu_idx & 3;
     case ARM_MMU_IDX_M:
-        return mmu_idx & 1;
+        return mmu_idx == ARMMMUIdx_MUser ? 0 : 1;
     default:
         g_assert_not_reached();
     }
@@ -2137,6 +2151,14 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     if (arm_feature(env, ARM_FEATURE_M)) {
         ARMMMUIdx mmu_idx = el == 0 ? ARMMMUIdx_MUser : ARMMMUIdx_MPriv;
 
+        /* Execution priority is negative if FAULTMASK is set or
+         * we're in a HardFault or NMI handler.
+         */
+        if ((env->v7m.exception > 0 && env->v7m.exception <= 3)
+            || env->daif & PSTATE_F) {
+            return arm_to_core_mmu_idx(ARMMMUIdx_MNegPri);
+        }
+
         return arm_to_core_mmu_idx(mmu_idx);
     }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5bf706d..3aae52a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7037,6 +7037,7 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1NSE0:
     case ARMMMUIdx_S1NSE1:
     case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MNegPri:
     case ARMMMUIdx_MUser:
         return 1;
     default:
@@ -7055,6 +7056,7 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1E2:
     case ARMMMUIdx_S2NS:
     case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MNegPri:
     case ARMMMUIdx_MUser:
         return false;
     case ARMMMUIdx_S1E3:
@@ -7077,7 +7079,21 @@ static inline bool regime_translation_disabled(CPUARMState *env,
                                                ARMMMUIdx mmu_idx)
 {
     if (arm_feature(env, ARM_FEATURE_M)) {
-        return !(env->v7m.mpu_ctrl & R_V7M_MPU_CTRL_ENABLE_MASK);
+        switch (env->v7m.mpu_ctrl &
+                (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
+        case R_V7M_MPU_CTRL_ENABLE_MASK:
+            /* Enabled, but not for HardFault and NMI */
+            return mmu_idx == ARMMMUIdx_MNegPri;
+        case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
+            /* Enabled for all cases */
+            return false;
+        case 0:
+        default:
+            /* HFNMIENA set and ENABLE clear is UNPREDICTABLE, but
+             * we warned about that in armv7m_nvic.c when the guest set it.
+             */
+            return true;
+        }
     }
 
     if (mmu_idx == ARMMMUIdx_S2NS) {
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ac905dd..ae6646c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -163,6 +163,7 @@ static inline int get_a32_user_mem_index(DisasContext *s)
         return arm_to_core_mmu_idx(ARMMMUIdx_S1SE0);
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MPriv:
+    case ARMMMUIdx_MNegPri:
         return arm_to_core_mmu_idx(ARMMMUIdx_MUser);
     case ARMMMUIdx_S2NS:
     default:
-- 
2.7.4
