Received: by 10.25.44.15 with SMTP id s15csp1870935lfs;
        Thu, 27 Jul 2017 04:01:39 -0700 (PDT)
X-Received: by 10.55.43.78 with SMTP id r75mr4802948qkh.358.1501153299282;
        Thu, 27 Jul 2017 04:01:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501153299; cv=none;
        d=google.com; s=arc-20160816;
        b=Fw4keuHLLSyB+PZ9JsZgcjW4xv6XuV2U8vY9MkQ8W/hM0X35OZXC6yy5z+/5pyb7Jk
         Mje051sWqSW5UEz0k6WRbw83mfG8tyfTl/H9NXwmE571Bm7DIORk7PPuMb5Aw1NMKMxu
         1Vp6c2wniyH+5SdSMDa4hBUaA7SebwDCpaUUdszOQuYXItf0p31q0/v7KwxMPrwzWwK/
         ibHcS+Rnndq3rf41wjLPFojIfZt8RkxSUeaLlXq5RjD3XjeJ/IgZLF+cBpD5uV8aIqge
         j55Q19c9XnXJUMGUPO8wyoom9i78F6lCUQpIXVF+bb2qjx5u80VEMzHKj5FfR166Hsf7
         1gwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=zt/8kxgBhjA3toh1wxHarX252O4VJlbq0uEHbdjfoc4=;
        b=urv5190E3wrhR1w1inVwL/9fK3JFukpsbfdgGo+oW02ToPGBkfobYWPOXafn3Be8Xs
         1ZExONEcjYRbVkkUIoUKEElO0yy6cUUW6F2vRwowVYipQojVvIK6Z3ll2KXXqe9++V5g
         yC+Qdu1oep3p/o4RMAEbTrhC4HLm35mVDiUsQhQyT601MW7YM3ToAhkUYv4v4YYdwbNi
         +5IUOeymip6kR19nQlX0W0L0uJlW4W5C6+mo5+064ro/U/XgdbhSpXJkMiBEvbIZdaYq
         84iYOFVaYxFzzSVVIw61/RUg7w08XI0mg5AxaeFHI1jIzCftkHfGaRsnvGMb0ZBaBbCK
         kxdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12si9472831qtd.334.2017.07.27.04.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 04:01:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dagXw-00087z-Gl
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 07:01:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVm-0006Hb-D8
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dagVl-0000Gb-HT
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 06:59:22 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37719)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dagVl-0008P0-Al; Thu, 27 Jul 2017 06:59:21 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dagVc-0003lx-OO; Thu, 27 Jul 2017 11:59:12 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 27 Jul 2017 11:59:08 +0100
Message-Id: <1501153150-19984-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.10 3/5] target/arm: Rename cp15.c6_rgnr to
 pmsav7.rnr
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
X-TUID: Iccj+7yOdOfd

Almost all of the PMSAv7 state is in the pmsav7 substruct of
the ARM CPU state structure. The exception is the region
number register, which is in cp15.c6_rgnr. This exception
is a bit odd for M profile, which otherwise generally does
not store state in the cp15 substruct.

Rename cp15.c6_rgnr to pmsav7.rnr accordingly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 14 +++++++-------
 target/arm/cpu.h      |  3 +--
 target/arm/helper.c   |  6 +++---
 target/arm/machine.c  |  2 +-
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 26a4b2d..323e2d4 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -536,13 +536,13 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
     case 0xd94: /* MPU_CTRL */
         return cpu->env.v7m.mpu_ctrl;
     case 0xd98: /* MPU_RNR */
-        return cpu->env.cp15.c6_rgnr;
+        return cpu->env.pmsav7.rnr;
     case 0xd9c: /* MPU_RBAR */
     case 0xda4: /* MPU_RBAR_A1 */
     case 0xdac: /* MPU_RBAR_A2 */
     case 0xdb4: /* MPU_RBAR_A3 */
     {
-        int region = cpu->env.cp15.c6_rgnr;
+        int region = cpu->env.pmsav7.rnr;
 
         if (region >= cpu->pmsav7_dregion) {
             return 0;
@@ -554,7 +554,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
     case 0xdb0: /* MPU_RASR_A2 */
     case 0xdb8: /* MPU_RASR_A3 */
     {
-        int region = cpu->env.cp15.c6_rgnr;
+        int region = cpu->env.pmsav7.rnr;
 
         if (region >= cpu->pmsav7_dregion) {
             return 0;
@@ -681,7 +681,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
                           PRIu32 "/%" PRIu32 "\n",
                           value, cpu->pmsav7_dregion);
         } else {
-            cpu->env.cp15.c6_rgnr = value;
+            cpu->env.pmsav7.rnr = value;
         }
         break;
     case 0xd9c: /* MPU_RBAR */
@@ -702,9 +702,9 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
                               region, cpu->pmsav7_dregion);
                 return;
             }
-            cpu->env.cp15.c6_rgnr = region;
+            cpu->env.pmsav7.rnr = region;
         } else {
-            region = cpu->env.cp15.c6_rgnr;
+            region = cpu->env.pmsav7.rnr;
         }
 
         if (region >= cpu->pmsav7_dregion) {
@@ -720,7 +720,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
     case 0xdb0: /* MPU_RASR_A2 */
     case 0xdb8: /* MPU_RASR_A3 */
     {
-        int region = cpu->env.cp15.c6_rgnr;
+        int region = cpu->env.pmsav7.rnr;
 
         if (region >= cpu->pmsav7_dregion) {
             return;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 102c58a..b39d64a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -305,8 +305,6 @@ typedef struct CPUARMState {
             uint64_t par_el[4];
         };
 
-        uint32_t c6_rgnr;
-
         uint32_t c9_insn; /* Cache lockdown registers.  */
         uint32_t c9_data;
         uint64_t c9_pmcr; /* performance monitor control register */
@@ -519,6 +517,7 @@ typedef struct CPUARMState {
         uint32_t *drbar;
         uint32_t *drsr;
         uint32_t *dracr;
+        uint32_t rnr;
     } pmsav7;
 
     void *nvic;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 169c361..63187de 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2385,7 +2385,7 @@ static uint64_t pmsav7_read(CPUARMState *env, const ARMCPRegInfo *ri)
         return 0;
     }
 
-    u32p += env->cp15.c6_rgnr;
+    u32p += env->pmsav7.rnr;
     return *u32p;
 }
 
@@ -2399,7 +2399,7 @@ static void pmsav7_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    u32p += env->cp15.c6_rgnr;
+    u32p += env->pmsav7.rnr;
     tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
     *u32p = value;
 }
@@ -2447,7 +2447,7 @@ static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
       .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = pmsav7_reset },
     { .name = "RGNR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 2, .opc2 = 0,
       .access = PL1_RW,
-      .fieldoffset = offsetof(CPUARMState, cp15.c6_rgnr),
+      .fieldoffset = offsetof(CPUARMState, pmsav7.rnr),
       .writefn = pmsav7_rgnr_write },
     REGINFO_SENTINEL
 };
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 1a40469..93c1a78 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -151,7 +151,7 @@ static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_id)
 {
     ARMCPU *cpu = opaque;
 
-    return cpu->env.cp15.c6_rgnr < cpu->pmsav7_dregion;
+    return cpu->env.pmsav7.rnr < cpu->pmsav7_dregion;
 }
 
 static const VMStateDescription vmstate_pmsav7 = {
-- 
2.7.4

