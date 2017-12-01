Received: by 10.223.159.82 with SMTP id f18csp1519240wrg;
        Fri, 1 Dec 2017 10:44:43 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa6IEf1DQZ9FNmbeHxxQSEJ5T3UXl1isDShEPsVXCSGkyGrXE1osW8o4UmdEcgHAtdddLrj
X-Received: by 10.28.2.198 with SMTP id 189mr1987703wmc.69.1512153883498;
        Fri, 01 Dec 2017 10:44:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512153883; cv=none;
        d=google.com; s=arc-20160816;
        b=gsf+ylXJZh5V1uOAXOj22YalHXcYeMm+Kj4xnUQ1JXflXhJ4XTllKLchkS5bUNai9F
         bTm0oONNDFnguLxHeK203Z8uyczmWVZrrTXiiX/MRxVkNMSMzTZNnx8tpXt6aGgsI91J
         RD4PEoC3g+c8l81nxvXyrhtbVd6ibSGL4tLUSbpi12kROL/LIPD3JJ7Kf6V8ooTD0Sbl
         RqMl4Csa+VOcS4nNNyzmwnVBPsgXElVnxX8VRqCRUG44R9CmB/t86oQbU8Y9M9PChDNw
         M8wuhYQIKcrvWS+xi17FsjHYESAycIgN9e9F0K8W1+9wp2qVeYcUOaDxdu/TOllcx+JH
         um3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=Zi5h2dOlhwLUQ3TbFPIepvXOptb83pvTUnKKvtAvZQU=;
        b=F79zmN4mxNaSwjH17ndGQlTuptzO866gW1J6VXK0mupGkx6IicFEVjQuJrBEwT54Bd
         1B9Z1M8bwTzv85DMRLewuDe8o4cr6XGCySmMpiZsc76DAjkwbOKxnqVdSZvqJeKBhgRn
         8DO6t9343OO49m7TjEbGh0x5y4DHysSZ2EUUxLpum77ZUo+yoDoEZN3+XRl1X/8vG+7O
         HHO6P69mxiSu2dqpigxvxaCZT0gU4wP8pUwe5ziwe48kOzcZn0JPvKpI62mwaNVTEqNY
         ZcTKeq4EninSMXiLb8hiXc/nkKcCo9dPaf8bRnm/I2jITs2fg6a+B+bLUO3PHsH9TX8v
         2WEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 71si1102608wma.109.2017.12.01.10.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Dec 2017 10:44:43 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eKqIk-00077x-Vc; Fri, 01 Dec 2017 18:44:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/7] target/arm: Split M profile MNegPri mmu index into user and priv
Date: Fri,  1 Dec 2017 18:44:36 +0000
Message-Id: <1512153879-5291-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
X-TUID: wLGPSwzVPbxC

For M profile, we currently have an mmu index MNegPri for
"requested execution priority negative". This fails to
distinguish "requested execution priority negative, privileged"
from "requested execution priority negative, usermode", but
the two can return different results for MPU lookups. Fix this
by splitting MNegPri into MNegPriPriv and MNegPriUser, and
similarly for the Secure equivalent MSNegPri.

This takes us from 6 M profile MMU modes to 8, which means
we need to bump NB_MMU_MODES; this is OK since the point
where we are forced to reduce TLB sizes is 9 MMU modes.

(It would in theory be possible to stick with 6 MMU indexes:
{mpu-disabled,user,privileged} x {secure,nonsecure} since
in the MPU-disabled case the result of an MPU lookup is
always the same for both user and privileged code. However
we would then need to rework the TB flags handling to put
user/priv into the TB flags separately from the mmuidx.
Adding an extra couple of mmu indexes is simpler.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 49 ++++++++++++++++++++++++++++---------------------
 target/arm/internals.h |  6 ++++--
 target/arm/helper.c    | 14 ++++++++++----
 target/arm/translate.c |  8 ++++++--
 4 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 89d49cd..d228fe6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -112,7 +112,7 @@ enum {
 #define ARM_CPU_VIRQ 2
 #define ARM_CPU_VFIQ 3
 
-#define NB_MMU_MODES 7
+#define NB_MMU_MODES 8
 /* ARM-specific extra insn start words:
  * 1: Conditional execution bits
  * 2: Partial exception syndrome for data aborts
@@ -2226,13 +2226,13 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  * They have the following different MMU indexes:
  *  User
  *  Privileged
- *  Execution priority negative (this is like privileged, but the
- *  MPU HFNMIENA bit means that it may have different access permission
- *  check results to normal privileged code, so can't share a TLB).
+ *  User, execution priority negative (ie the MPU HFNMIENA bit may apply)
+ *  Privileged, execution priority negative (ditto)
  * If the CPU supports the v8M Security Extension then there are also:
  *  Secure User
  *  Secure Privileged
- *  Secure, execution priority negative
+ *  Secure User, execution priority negative
+ *  Secure Privileged, execution priority negative
  *
  * The ARMMMUIdx and the mmu index value used by the core QEMU TLB code
  * are not quite the same -- different CPU types (most notably M profile
@@ -2251,6 +2251,8 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  * The constant names here are patterned after the general style of the names
  * of the AT/ATS operations.
  * The values used are carefully arranged to make mmu_idx => EL lookup easy.
+ * For M profile we arrange them to have a bit for priv, a bit for negpri
+ * and a bit for secure.
  */
 #define ARM_MMU_IDX_A 0x10 /* A profile */
 #define ARM_MMU_IDX_NOTLB 0x20 /* does not have a TLB */
@@ -2269,10 +2271,12 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_S2NS = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_MUser = 0 | ARM_MMU_IDX_M,
     ARMMMUIdx_MPriv = 1 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MNegPri = 2 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSUser = 3 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSPriv = 4 | ARM_MMU_IDX_M,
-    ARMMMUIdx_MSNegPri = 5 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MUserNegPri = 2 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MPrivNegPri = 3 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MSUser = 4 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MSPriv = 5 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MSUserNegPri = 6 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MSPrivNegPri = 7 | ARM_MMU_IDX_M,
     /* Indexes below here don't have TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
      */
@@ -2293,10 +2297,12 @@ typedef enum ARMMMUIdxBit {
     ARMMMUIdxBit_S2NS = 1 << 6,
     ARMMMUIdxBit_MUser = 1 << 0,
     ARMMMUIdxBit_MPriv = 1 << 1,
-    ARMMMUIdxBit_MNegPri = 1 << 2,
-    ARMMMUIdxBit_MSUser = 1 << 3,
-    ARMMMUIdxBit_MSPriv = 1 << 4,
-    ARMMMUIdxBit_MSNegPri = 1 << 5,
+    ARMMMUIdxBit_MUserNegPri = 1 << 2,
+    ARMMMUIdxBit_MPrivNegPri = 1 << 3,
+    ARMMMUIdxBit_MSUser = 1 << 4,
+    ARMMMUIdxBit_MSPriv = 1 << 5,
+    ARMMMUIdxBit_MSUserNegPri = 1 << 6,
+    ARMMMUIdxBit_MSPrivNegPri = 1 << 7,
 } ARMMMUIdxBit;
 
 #define MMU_USER_IDX 0
@@ -2322,8 +2328,7 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     case ARM_MMU_IDX_A:
         return mmu_idx & 3;
     case ARM_MMU_IDX_M:
-        return (mmu_idx == ARMMMUIdx_MUser || mmu_idx == ARMMMUIdx_MSUser)
-            ? 0 : 1;
+        return mmu_idx & 1;
     default:
         g_assert_not_reached();
     }
@@ -2334,16 +2339,18 @@ static inline ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env,
                                                      bool secstate)
 {
     int el = arm_current_el(env);
-    ARMMMUIdx mmu_idx;
+    ARMMMUIdx mmu_idx = ARM_MMU_IDX_M;
 
-    if (el == 0) {
-        mmu_idx = secstate ? ARMMMUIdx_MSUser : ARMMMUIdx_MUser;
-    } else {
-        mmu_idx = secstate ? ARMMMUIdx_MSPriv : ARMMMUIdx_MPriv;
+    if (el != 0) {
+        mmu_idx |= 1;
     }
 
     if (armv7m_nvic_neg_prio_requested(env->nvic, secstate)) {
-        mmu_idx = secstate ? ARMMMUIdx_MSNegPri : ARMMMUIdx_MNegPri;
+        mmu_idx |= 2;
+    }
+
+    if (secstate) {
+        mmu_idx |= 4;
     }
 
     return mmu_idx;
diff --git a/target/arm/internals.h b/target/arm/internals.h
index d9cc75e..aa9c91b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -544,15 +544,17 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1NSE1:
     case ARMMMUIdx_S1E2:
     case ARMMMUIdx_S2NS:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MNegPri:
     case ARMMMUIdx_MUser:
         return false;
     case ARMMMUIdx_S1E3:
     case ARMMMUIdx_S1SE0:
     case ARMMMUIdx_S1SE1:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSNegPri:
     case ARMMMUIdx_MSUser:
         return true;
     default:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c4c8d5a..14ab1f4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7856,11 +7856,13 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1SE1:
     case ARMMMUIdx_S1NSE0:
     case ARMMMUIdx_S1NSE1:
+    case ARMMMUIdx_MPrivNegPri:
+    case ARMMMUIdx_MUserNegPri:
     case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MNegPri:
     case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSPrivNegPri:
+    case ARMMMUIdx_MSUserNegPri:
     case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSNegPri:
     case ARMMMUIdx_MSUser:
         return 1;
     default:
@@ -7883,8 +7885,10 @@ static inline bool regime_translation_disabled(CPUARMState *env,
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
         case R_V7M_MPU_CTRL_ENABLE_MASK:
             /* Enabled, but not for HardFault and NMI */
-            return mmu_idx == ARMMMUIdx_MNegPri ||
-                mmu_idx == ARMMMUIdx_MSNegPri;
+            return mmu_idx == ARMMMUIdx_MUserNegPri ||
+                mmu_idx == ARMMMUIdx_MPrivNegPri ||
+                mmu_idx == ARMMMUIdx_MSUserNegPri ||
+                mmu_idx == ARMMMUIdx_MSPrivNegPri;
         case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
             /* Enabled for all cases */
             return false;
@@ -8017,6 +8021,8 @@ static inline bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1NSE0:
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MSUser:
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MSUserNegPri:
         return true;
     default:
         return false;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4afb0c8..6df4d90 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -159,12 +159,16 @@ static inline int get_a32_user_mem_index(DisasContext *s)
         return arm_to_core_mmu_idx(ARMMMUIdx_S1SE0);
     case ARMMMUIdx_MUser:
     case ARMMMUIdx_MPriv:
-    case ARMMMUIdx_MNegPri:
         return arm_to_core_mmu_idx(ARMMMUIdx_MUser);
+    case ARMMMUIdx_MUserNegPri:
+    case ARMMMUIdx_MPrivNegPri:
+        return arm_to_core_mmu_idx(ARMMMUIdx_MUserNegPri);
     case ARMMMUIdx_MSUser:
     case ARMMMUIdx_MSPriv:
-    case ARMMMUIdx_MSNegPri:
         return arm_to_core_mmu_idx(ARMMMUIdx_MSUser);
+    case ARMMMUIdx_MSUserNegPri:
+    case ARMMMUIdx_MSPrivNegPri:
+        return arm_to_core_mmu_idx(ARMMMUIdx_MSUserNegPri);
     case ARMMMUIdx_S2NS:
     default:
         g_assert_not_reached();
-- 
2.7.4
