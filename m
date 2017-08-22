Received: by 10.223.188.70 with SMTP id a6csp5101067wrh;
        Tue, 22 Aug 2017 08:42:18 -0700 (PDT)
X-Received: by 10.200.45.71 with SMTP id o7mr592617qta.200.1503416537913;
        Tue, 22 Aug 2017 08:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416537; cv=none;
        d=google.com; s=arc-20160816;
        b=njve4WhvE4OcNrOJISMP19VFDJEHF/q4ZCiSJluS07wric5oZLIL+7MTMYIuzUPHqM
         C2tmbPfjHQM6vPgASjzBcYpT9TWXWqWokZOB6cAQStAfSSf0cZ0gMRNYEf1sqtUTvb8X
         hu5E0W2RTnFpncDHF3ywPqc1GoDq4wOMHJyU15Kg6zXgcnY51Bd+9h7XMLasgV8aQMgu
         nch+yO3sq06eD00AggjnXl+3vuiabqfPxZI99NIRy4YmuACYiFloDAAWFuYTbr6ye2rT
         U80L3LnLeIw++2RuDudOZG7K6z9Y8sXIj3iI14yanDCpDjOTIk+knDMCQpB5a5dTOzED
         0msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=l/YvvVFTwLMlIyHgBdBo3E+YymElFbZynGjTEMD1rN8=;
        b=bEOERuPcYgztyjoGzdF0EltCeio3oaHa4lmcYMlTdqhm8J9tZENBHszBXq6Q+f8nMy
         IouBDlm5uvN6jyZCxrZlDgJUg62mw4l+uvq14jpdhEmkUJ4Lu4e0qw8H0RLz/0nT0+gZ
         iw6YLue+LoXqbfj74UQY09Kcwn/D2KiUnuZi9P3VFr7S9p6wOk1TevDHluHO+kXnd2dG
         sZIInj7f1Ewn0Pq8qo7Rtjgbr5FEgPlMPyLqG8VrpAFGch+i2fNG1sN5RhYl11xyleg2
         hi19h1uB6Wz7VVu5HBYph3PnSPmBJy87OlKYmFMTtOxgEubvrzv640XxXsa3L+aAMLJA
         a5Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o128si13935263qka.497.2017.08.22.08.42.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:42:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBJn-0003MW-Cw
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:42:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53453)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnr-0006Vo-P3
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnl-0003BD-Cf
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:15 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnl-00039F-5Y; Tue, 22 Aug 2017 11:09:09 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnc-0004fF-RV; Tue, 22 Aug 2017 16:09:00 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:44 +0100
Message-Id: <1503414539-28762-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 05/20] target/arm: Add MMU indexes for secure v8M
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sl8HtqfhEW2d

Now that MPU lookups can return different results for v8M
when the CPU is in secure vs non-secure state, we need to
have separate MMU indexes; add the secure counterparts
to the existing three M profile MMU indexes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 19 +++++++++++++++++--
 target/arm/helper.c |  9 ++++++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 24666baa..436ca0d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2104,6 +2104,10 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
  *  Execution priority negative (this is like privileged, but the
  *  MPU HFNMIENA bit means that it may have different access permission
  *  check results to normal privileged code, so can't share a TLB).
+ * If the CPU supports the v8M Security Extension then there are also:
+ *  Secure User
+ *  Secure Privileged
+ *  Secure, execution priority negative
  *
  * The ARMMMUIdx and the mmu index value used by the core QEMU TLB code
  * are not quite the same -- different CPU types (most notably M profile
@@ -2141,6 +2145,9 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_MUser = 0 | ARM_MMU_IDX_M,
     ARMMMUIdx_MPriv = 1 | ARM_MMU_IDX_M,
     ARMMMUIdx_MNegPri = 2 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MSUser = 3 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MSPriv = 4 | ARM_MMU_IDX_M,
+    ARMMMUIdx_MSNegPri = 5 | ARM_MMU_IDX_M,
     /* Indexes below here don't have TLBs and are used only for AT system
      * instructions or for the first stage of an S12 page table walk.
      */
@@ -2162,6 +2169,9 @@ typedef enum ARMMMUIdxBit {
     ARMMMUIdxBit_MUser = 1 << 0,
     ARMMMUIdxBit_MPriv = 1 << 1,
     ARMMMUIdxBit_MNegPri = 1 << 2,
+    ARMMMUIdxBit_MSUser = 1 << 3,
+    ARMMMUIdxBit_MSPriv = 1 << 4,
+    ARMMMUIdxBit_MSNegPri = 1 << 5,
 } ARMMMUIdxBit;
 
 #define MMU_USER_IDX 0
@@ -2187,7 +2197,8 @@ static inline int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     case ARM_MMU_IDX_A:
         return mmu_idx & 3;
     case ARM_MMU_IDX_M:
-        return mmu_idx == ARMMMUIdx_MUser ? 0 : 1;
+        return (mmu_idx == ARMMMUIdx_MUser || mmu_idx == ARMMMUIdx_MSUser)
+            ? 0 : 1;
     default:
         g_assert_not_reached();
     }
@@ -2206,7 +2217,11 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
          */
         if ((env->v7m.exception > 0 && env->v7m.exception <= 3)
             || env->v7m.faultmask) {
-            return arm_to_core_mmu_idx(ARMMMUIdx_MNegPri);
+            mmu_idx = ARMMMUIdx_MNegPri;
+        }
+
+        if (env->v7m.secure) {
+            mmu_idx += ARMMMUIdx_MSUser;
         }
 
         return arm_to_core_mmu_idx(mmu_idx);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 887490a..1debebc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7037,6 +7037,9 @@ static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_MPriv:
     case ARMMMUIdx_MNegPri:
     case ARMMMUIdx_MUser:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSNegPri:
+    case ARMMMUIdx_MSUser:
         return 1;
     default:
         g_assert_not_reached();
@@ -7060,6 +7063,9 @@ static inline bool regime_is_secure(CPUARMState *env, ARMMMUIdx mmu_idx)
     case ARMMMUIdx_S1E3:
     case ARMMMUIdx_S1SE0:
     case ARMMMUIdx_S1SE1:
+    case ARMMMUIdx_MSPriv:
+    case ARMMMUIdx_MSNegPri:
+    case ARMMMUIdx_MSUser:
         return true;
     default:
         g_assert_not_reached();
@@ -7081,7 +7087,8 @@ static inline bool regime_translation_disabled(CPUARMState *env,
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
         case R_V7M_MPU_CTRL_ENABLE_MASK:
             /* Enabled, but not for HardFault and NMI */
-            return mmu_idx == ARMMMUIdx_MNegPri;
+            return mmu_idx == ARMMMUIdx_MNegPri ||
+                mmu_idx == ARMMMUIdx_MSNegPri;
         case R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK:
             /* Enabled for all cases */
             return false;
-- 
2.7.4

