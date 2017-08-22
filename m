Received: by 10.223.188.70 with SMTP id a6csp5087055wrh;
        Tue, 22 Aug 2017 08:30:03 -0700 (PDT)
X-Received: by 10.55.134.130 with SMTP id i124mr1582385qkd.92.1503415803343;
        Tue, 22 Aug 2017 08:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503415803; cv=none;
        d=google.com; s=arc-20160816;
        b=OXmlXQp+CjIr4TqVLl2LuSi4dOfqOKjOWef2uGWf2DgjO686THyGQ9njsN1gcaa7Hw
         qR6B7QZjXnIiys1x2panl6R9EKGs5HU7CRkSwQDw4z0oWApf+NG0bwIZEMW4voNwj906
         /r64JsN7BPI+qkNlFwXuAGYg8/V5BbhAeqLe46UFoe35CMfzuQVOm/I6zvXzX9wEcMOI
         uKhbNYH+JngmFu6BOmU1MoVBTBbzEjNds2PGdBsxjWzN514CZIJC55HsoDCwP2Awirfc
         vS2nIxGgHUU726OtO36RC49glTeOqQ/YJxh/WkzFCuhDu89dfd/L4VY0QHJ0JzsgxT/L
         4/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=YYRZSpsj3uNdOjUDvWjsGfuIWksSEvd8H/jt3PO9sNE=;
        b=vARCoIKDNwqqce0mhmiyJ7QeTqGg8LtMZ9OIqkGC35ixIZXyWfnwnXrKrrLyXW0Lkq
         orsTZD9pc0DoL7S8nIee3I+WVgLjTrDZgyp+zE+9kdI5lm33n5Ss9QQJBP02+vZjIwDu
         Y7fAI7zsaON69vn23yEjdHae4eRP7ZGoY1kujpeBpgPW6XrKqSbTCO0j/sNf8p257MY0
         frJ82pAsGouBM0/M73IWQvRnDfVtKyo2+7zVzQI9L6j3uDJQcVMKsBcktRP+fk3y4En/
         5zVPV3I/npcihrcnqpnJ92aKaMudCfxv3ETMwwOlOAKbBk7u1mkIDVmcDONTLLYrXx2r
         tjlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t5si13651500qtd.471.2017.08.22.08.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:30:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkB7w-0007cN-S2
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:30:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnn-0006No-Dq
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnl-0003C0-UV
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:11 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36974)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnl-0003Ah-LZ; Tue, 22 Aug 2017 11:09:09 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnk-0004jy-Mk; Tue, 22 Aug 2017 16:09:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:54 +0100
Message-Id: <1503414539-28762-16-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 15/20] target/arm: Make MPU_CTRL register banked
 for v8M
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
X-TUID: cpO5vJnv6Qlp

Make the MPU_CTRL register banked if v8M security extensions are
enabled.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 2 +-
 hw/intc/armv7m_nvic.c | 9 +++++----
 target/arm/helper.c   | 5 +++--
 target/arm/machine.c  | 3 ++-
 4 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 43d36d6..78cd3f0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -429,7 +429,7 @@ typedef struct CPUARMState {
         uint32_t dfsr; /* Debug Fault Status Register */
         uint32_t mmfar; /* MemManage Fault Address */
         uint32_t bfar; /* BusFault Address */
-        unsigned mpu_ctrl; /* MPU_CTRL */
+        unsigned mpu_ctrl[2]; /* MPU_CTRL */
         int exception;
         uint32_t primask[2];
         uint32_t faultmask[2];
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c3c214c..a4c298f 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -541,7 +541,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         return cpu->pmsav7_dregion << 8;
         break;
     case 0xd94: /* MPU_CTRL */
-        return cpu->env.v7m.mpu_ctrl;
+        return cpu->env.v7m.mpu_ctrl[attrs.secure];
     case 0xd98: /* MPU_RNR */
         return cpu->env.pmsav7.rnr[attrs.secure];
     case 0xd9c: /* MPU_RBAR */
@@ -720,9 +720,10 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
             qemu_log_mask(LOG_GUEST_ERROR, "MPU_CTRL: HFNMIENA and !ENABLE is "
                           "UNPREDICTABLE\n");
         }
-        cpu->env.v7m.mpu_ctrl = value & (R_V7M_MPU_CTRL_ENABLE_MASK |
-                                         R_V7M_MPU_CTRL_HFNMIENA_MASK |
-                                         R_V7M_MPU_CTRL_PRIVDEFENA_MASK);
+        cpu->env.v7m.mpu_ctrl[attrs.secure]
+            = value & (R_V7M_MPU_CTRL_ENABLE_MASK |
+                       R_V7M_MPU_CTRL_HFNMIENA_MASK |
+                       R_V7M_MPU_CTRL_PRIVDEFENA_MASK);
         tlb_flush(CPU(cpu));
         break;
     case 0xd98: /* MPU_RNR */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 48e0fc6..4a2148c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7096,7 +7096,7 @@ static inline bool regime_translation_disabled(CPUARMState *env,
                                                ARMMMUIdx mmu_idx)
 {
     if (arm_feature(env, ARM_FEATURE_M)) {
-        switch (env->v7m.mpu_ctrl &
+        switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
         case R_V7M_MPU_CTRL_ENABLE_MASK:
             /* Enabled, but not for HardFault and NMI */
@@ -8256,7 +8256,8 @@ static bool pmsav7_use_background_region(ARMCPU *cpu,
     }
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        return env->v7m.mpu_ctrl & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
+            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
     } else {
         return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6941e35..5cc95e8 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -123,7 +123,7 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.dfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),
         VMSTATE_UINT32(env.v7m.bfar, ARMCPU),
-        VMSTATE_UINT32(env.v7m.mpu_ctrl, ARMCPU),
+        VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_NS], ARMCPU),
         VMSTATE_INT32(env.v7m.exception, ARMCPU),
         VMSTATE_END_OF_LIST()
     },
@@ -270,6 +270,7 @@ static const VMStateDescription vmstate_m_security = {
                               0, vmstate_info_uint32, uint32_t),
         VMSTATE_UINT32(env.pmsav7.rnr[M_REG_S], ARMCPU),
         VMSTATE_VALIDATE("secure MPU_RNR is valid", s_rnr_vmstate_validate),
+        VMSTATE_UINT32(env.v7m.mpu_ctrl[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

