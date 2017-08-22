Received: by 10.223.188.70 with SMTP id a6csp5092885wrh;
        Tue, 22 Aug 2017 08:35:09 -0700 (PDT)
X-Received: by 10.237.42.60 with SMTP id c57mr1474668qtd.266.1503416109604;
        Tue, 22 Aug 2017 08:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416109; cv=none;
        d=google.com; s=arc-20160816;
        b=oshg1JmwgNbmBrw9pacS0IKbPkPKUiqBnYjzgxQSW70cjsvwMRzOKxxgDvnpSeucRY
         Bn/43DzJ6K8XMsHCi9txv8CVQsiKBRmj0/C4wh9R8geBHSaGnnALE7HixEVyxfrdIF2B
         2D7xCM9gH2UoewnkTwPSzm2ess+LvxVdzIkML3v7PTcZ7q0UQljBimi93/MigqkuNvB7
         kEJEVfALz41O/xsClTZ2yoDzmcacxgpFwyCSagT/fyX+DwGjH6l3oNYoDJz4R6GpxgdI
         hC6iI20bQ8frYAJ9NTmoJ62HgGCXDbkQ+bpl4Q3Wyo7a4qLY2KwppL55TOGx8ka20Zzg
         497g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=RiLW8AiQpZF6iGJrbmrjYOdePG5Q8A6d2/D4E66B4xE=;
        b=j6HyXfx1RVtPz3dC8SFtt3deWyjh08U0TKNwELBzZToWDBt8YgLB2iN3Obnx3els9g
         0dMnTMytBbo/MLQ0cwwymXi/37Kmqi2DISl8bRceMj7aTsZbcknHdTK3K+iXh6s/rrxT
         zE4WBDzuKL4Dt5x9ldZejtvVMYPRakp00++mvyGt8wPPPYNIUcETlGf5qGW0wnaXVq/o
         008JUi4EifKWMxOTE25uQjkG/brziy2B8ik6R9FPdYvQGUjvMyrpzMScS8tdO+Bb4UKm
         skFpE7J229d+e0qCDiA2pmOyF3VkfXRy1rwR+4J3SKbjc5qVLhT4puvUPDcSsYtNqp6Y
         ULaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j185si14115219qkc.438.2017.08.22.08.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBCt-0003Pv-5j
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:35:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnl-0006Lh-T3
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnk-0003A9-Cu
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnk-00039F-2M; Tue, 22 Aug 2017 11:09:08 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnj-0004j5-52; Tue, 22 Aug 2017 16:09:07 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:52 +0100
Message-Id: <1503414539-28762-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 13/20] target/arm: Make MPU_RBAR,
 MPU_RLAR banked for v8M
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
X-TUID: ERkLUMVNzxKZ

Make the MPU registers MPU_MAIR0 and MPU_MAIR1 banked if v8M security
extensions are enabled.

We can freely add more items to vmstate_m_security without
breaking migration compatibility, because no CPU currently
has the ARM_FEATURE_M_SECURITY bit enabled and so this
subsection is not yet used by anything.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  4 ++--
 hw/intc/armv7m_nvic.c |  8 ++++----
 target/arm/cpu.c      | 26 ++++++++++++++++++++------
 target/arm/helper.c   | 11 ++++++-----
 target/arm/machine.c  | 12 ++++++++----
 5 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2f59828..12fa95e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -543,8 +543,8 @@ typedef struct CPUARMState {
          *  pmsav7.rnr (region number register)
          *  pmsav7_dregion (number of configured regions)
          */
-        uint32_t *rbar;
-        uint32_t *rlar;
+        uint32_t *rbar[2];
+        uint32_t *rlar[2];
         uint32_t mair0[2];
         uint32_t mair1[2];
     } pmsav8;
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index e98eb95..9ced7af 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -564,7 +564,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             if (region >= cpu->pmsav7_dregion) {
                 return 0;
             }
-            return cpu->env.pmsav8.rbar[region];
+            return cpu->env.pmsav8.rbar[attrs.secure][region];
         }
 
         if (region >= cpu->pmsav7_dregion) {
@@ -591,7 +591,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             if (region >= cpu->pmsav7_dregion) {
                 return 0;
             }
-            return cpu->env.pmsav8.rlar[region];
+            return cpu->env.pmsav8.rlar[attrs.secure][region];
         }
 
         if (region >= cpu->pmsav7_dregion) {
@@ -756,7 +756,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
             if (region >= cpu->pmsav7_dregion) {
                 return;
             }
-            cpu->env.pmsav8.rbar[region] = value;
+            cpu->env.pmsav8.rbar[attrs.secure][region] = value;
             tlb_flush(CPU(cpu));
             return;
         }
@@ -806,7 +806,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
             if (region >= cpu->pmsav7_dregion) {
                 return;
             }
-            cpu->env.pmsav8.rlar[region] = value;
+            cpu->env.pmsav8.rlar[attrs.secure][region] = value;
             tlb_flush(CPU(cpu));
             return;
         }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae8af19..333029c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -235,10 +235,20 @@ static void arm_cpu_reset(CPUState *s)
     if (arm_feature(env, ARM_FEATURE_PMSA)) {
         if (cpu->pmsav7_dregion > 0) {
             if (arm_feature(env, ARM_FEATURE_V8)) {
-                memset(env->pmsav8.rbar, 0,
-                       sizeof(*env->pmsav8.rbar) * cpu->pmsav7_dregion);
-                memset(env->pmsav8.rlar, 0,
-                       sizeof(*env->pmsav8.rlar) * cpu->pmsav7_dregion);
+                memset(env->pmsav8.rbar[M_REG_NS], 0,
+                       sizeof(*env->pmsav8.rbar[M_REG_NS])
+                       * cpu->pmsav7_dregion);
+                memset(env->pmsav8.rlar[M_REG_NS], 0,
+                       sizeof(*env->pmsav8.rlar[M_REG_NS])
+                       * cpu->pmsav7_dregion);
+                if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+                    memset(env->pmsav8.rbar[M_REG_S], 0,
+                           sizeof(*env->pmsav8.rbar[M_REG_S])
+                           * cpu->pmsav7_dregion);
+                    memset(env->pmsav8.rlar[M_REG_S], 0,
+                           sizeof(*env->pmsav8.rlar[M_REG_S])
+                           * cpu->pmsav7_dregion);
+                }
             } else if (arm_feature(env, ARM_FEATURE_V7)) {
                 memset(env->pmsav7.drbar, 0,
                        sizeof(*env->pmsav7.drbar) * cpu->pmsav7_dregion);
@@ -823,8 +833,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         if (nr) {
             if (arm_feature(env, ARM_FEATURE_V8)) {
                 /* PMSAv8 */
-                env->pmsav8.rbar = g_new0(uint32_t, nr);
-                env->pmsav8.rlar = g_new0(uint32_t, nr);
+                env->pmsav8.rbar[M_REG_NS] = g_new0(uint32_t, nr);
+                env->pmsav8.rlar[M_REG_NS] = g_new0(uint32_t, nr);
+                if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+                    env->pmsav8.rbar[M_REG_S] = g_new0(uint32_t, nr);
+                    env->pmsav8.rlar[M_REG_S] = g_new0(uint32_t, nr);
+                }
             } else {
                 env->pmsav7.drbar = g_new0(uint32_t, nr);
                 env->pmsav7.drsr = g_new0(uint32_t, nr);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b1bb507..5394cef 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8442,6 +8442,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
     bool is_user = regime_is_user(env, mmu_idx);
+    uint32_t secure = regime_is_secure(env, mmu_idx);
     int n;
     int matchregion = -1;
     bool hit = false;
@@ -8468,10 +8469,10 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              * with bits [4:0] all zeroes, but the limit address is bits
              * [31:5] from the register with bits [4:0] all ones.
              */
-            uint32_t base = env->pmsav8.rbar[n] & ~0x1f;
-            uint32_t limit = env->pmsav8.rlar[n] | 0x1f;
+            uint32_t base = env->pmsav8.rbar[secure][n] & ~0x1f;
+            uint32_t limit = env->pmsav8.rlar[secure][n] | 0x1f;
 
-            if (!(env->pmsav8.rlar[n] & 0x1)) {
+            if (!(env->pmsav8.rlar[secure][n] & 0x1)) {
                 /* Region disabled */
                 continue;
             }
@@ -8520,8 +8521,8 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
         /* hit using the background region */
         get_phys_addr_pmsav7_default(env, mmu_idx, address, prot);
     } else {
-        uint32_t ap = extract32(env->pmsav8.rbar[matchregion], 1, 2);
-        uint32_t xn = extract32(env->pmsav8.rbar[matchregion], 0, 1);
+        uint32_t ap = extract32(env->pmsav8.rbar[secure][matchregion], 1, 2);
+        uint32_t xn = extract32(env->pmsav8.rbar[secure][matchregion], 0, 1);
 
         if (m_is_system_region(env, address)) {
             /* System space is always execute never */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 414a879..05c6c7a 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -225,10 +225,10 @@ static const VMStateDescription vmstate_pmsav8 = {
     .minimum_version_id = 1,
     .needed = pmsav8_needed,
     .fields = (VMStateField[]) {
-        VMSTATE_VARRAY_UINT32(env.pmsav8.rbar, ARMCPU, pmsav7_dregion, 0,
-                              vmstate_info_uint32, uint32_t),
-        VMSTATE_VARRAY_UINT32(env.pmsav8.rlar, ARMCPU, pmsav7_dregion, 0,
-                              vmstate_info_uint32, uint32_t),
+        VMSTATE_VARRAY_UINT32(env.pmsav8.rbar[M_REG_NS], ARMCPU, pmsav7_dregion,
+                              0, vmstate_info_uint32, uint32_t),
+        VMSTATE_VARRAY_UINT32(env.pmsav8.rlar[M_REG_NS], ARMCPU, pmsav7_dregion,
+                              0, vmstate_info_uint32, uint32_t),
         VMSTATE_UINT32(env.pmsav8.mair0[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.pmsav8.mair1[M_REG_NS], ARMCPU),
         VMSTATE_END_OF_LIST()
@@ -257,6 +257,10 @@ static const VMStateDescription vmstate_m_security = {
         VMSTATE_UINT32(env.v7m.vecbase[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.pmsav8.mair0[M_REG_S], ARMCPU),
         VMSTATE_UINT32(env.pmsav8.mair1[M_REG_S], ARMCPU),
+        VMSTATE_VARRAY_UINT32(env.pmsav8.rbar[M_REG_S], ARMCPU, pmsav7_dregion,
+                              0, vmstate_info_uint32, uint32_t),
+        VMSTATE_VARRAY_UINT32(env.pmsav8.rlar[M_REG_S], ARMCPU, pmsav7_dregion,
+                              0, vmstate_info_uint32, uint32_t),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

