Received: by 10.182.158.201 with SMTP id ww9csp3416318obb;
        Wed, 2 Dec 2015 16:29:55 -0800 (PST)
X-Received: by 10.55.82.132 with SMTP id g126mr7477959qkb.63.1449102595521;
        Wed, 02 Dec 2015 16:29:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j133si2186738qhj.106.2015.12.02.16.29.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:29:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HmV-0007UB-1V
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:29:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcA-0004RD-7Q
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc6-00021q-Hz
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:34697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc6-00021e-DD; Wed, 02 Dec 2015 19:19:10 -0500
Received: by qkfo3 with SMTP id o3so23827117qkf.1;
	Wed, 02 Dec 2015 16:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ixXD7PRp0+1//pLCr1gsfjoynaeoSftwbn8DhzaYNVg=;
	b=EDZD9YGJuAiEpwH7LqJeFtePL2Mt4WPu6sAigCCbWuwchHfdHkTWJ5mxz/u/nDlijm
	bRuiH9RTOh7fw94HnVDN7wbGx9oDn0xpjAapedH2LY8G6cL1BSOxLmWXqIobiblopSGt
	i9rbmK4ttj/Xc5eyB4u+Z0ZOFnlqteRq8GJwIc6HIexmtTjjdxRLkeYVYZKFpkRmZLRe
	UfdvwZJiD2Y0ZZlhsjiRlXpXHwlsM8GVnqlOy+5t/ZGGkl2U/LRNUqIggJMzy1L29NdT
	yzlSwMQA6WXTSLISQAOQ1LJZg4dLEZiPWnsRC7/I0ErRG7dSb58EcOZJpBMWmcT3SOpK
	UOxA==
X-Received: by 10.55.217.147 with SMTP id q19mr7558096qkl.109.1449101950067;
	Wed, 02 Dec 2015 16:19:10 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:09 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:42 -0500
Message-Id: <1449101933-24928-16-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 15/26] armv7m: add MPU to cortex-m3 and
	cortex-m4
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 46e/T/5z6pbs

The M series MPU is almost the same as the already
implemented R series MPU.  So use the M series
and translate.

Primary difference is that a real v7-M MPU is has
much relaxed alignment and size requirements for MPU
regions (32 bytes) compared with the 1K page size
of the QEMU TLB which is shared with all ARM targets.

Add MPU feature flag to cortex-m3 and -m4.

The v7-R MPU registers don't have a place for HFNMIENA,
so add another v7m. field.
---
 hw/arm/stellaris.c    |  11 ++++
 hw/intc/armv7m_nvic.c | 163 ++++++++++++++++++++++++++++++++++++++++++++++++--
 target-arm/cpu.c      |   2 +
 target-arm/cpu.h      |   1 +
 target-arm/helper.c   |   6 ++
 target-arm/machine.c  |   1 +
 6 files changed, 179 insertions(+), 5 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 0114e0a..7e56f02 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1255,6 +1255,17 @@ static void stellaris_init(const char *kernel_filename, const char *cpu_model,
     qdev_connect_gpio_out_named(nvic, "SYSRESETREQ", 0,
                                 qemu_allocate_irq(&do_sys_reset, NULL, 0));
 
+    {
+        /* hack to change the number of MPU regions.
+         * Less of a hack than messing with cpu_model string.
+         * Safe as long as the number is being reduced.
+         */
+        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(0));
+        assert(cpu->pmsav7_dregion>=8);
+        cpu->pmsav7_dregion = 8;
+    }
+
+
     if (board->dc1 & (1 << 16)) {
         dev = sysbus_create_varargs(TYPE_STELLARIS_ADC, 0x40038000,
                                     qdev_get_gpio_in(nvic, 14),
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 5731146..2b42d9d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -595,8 +595,67 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
     case 0xd70: /* ISAR4.  */
         return 0x01310102;
     /* TODO: Implement debug registers.  */
+    case 0xd90: /* MPU_TYPE */
+        return cpu->has_mpu ? (cpu->pmsav7_dregion<<8) : 0;
+        break;
+    case 0xd94: /* MPU_CTRL */
+        val = 0;
+        /* We only use sctlr_el[1] since v7m has only two ELs unpriv. (0)
+         * and priv. (1).  The "controlling" EL is always priv.
+         */
+        if (cpu->env.cp15.sctlr_el[1] & SCTLR_M) {
+            val |= 1; /* ENABLE */
+        }
+        if (cpu->env.v7m.mpu_hfnmiena) {
+            val |= 2; /* HFNMIENA */
+        }
+        if (cpu->env.cp15.sctlr_el[1] & SCTLR_BR) {
+            val |= 4; /* PRIVDEFENA */
+        }
+        return val;
+    case 0xd98: /* MPU_RNR */
+        return cpu->env.cp15.c6_rgnr;
+    case 0xd9c: /* MPU_RBAR */
+    case 0xda4: /* MPU_RBAR_A1 */
+    case 0xdac: /* MPU_RBAR_A2 */
+    case 0xdb4: /* MPU_RBAR_A3 */
+    {
+        uint32_t range;
+        if (offset == 0xd9c) {
+            range = cpu->env.cp15.c6_rgnr;
+        } else {
+            range = (offset - 0xda4)/8;
+        }
+
+        if (range >= cpu->pmsav7_dregion) {
+            return 0;
+        } else {
+            return (cpu->env.pmsav7.drbar[range] & (0x1f)) | (range & 0xf);
+        }
+    }
+    case 0xda0: /* MPU_RASR */
+    case 0xda8: /* MPU_RASR_A1 */
+    case 0xdb0: /* MPU_RASR_A2 */
+    case 0xdb8: /* MPU_RASR_A3 */
+    {
+        uint32_t range;
+
+        if (offset == 0xda0) {
+            range = cpu->env.cp15.c6_rgnr;
+        } else {
+            range = (offset - 0xda8)/8;
+        }
+
+        if (range >= cpu->pmsav7_dregion) {
+            return 0;
+        } else {
+            return ((cpu->env.pmsav7.dracr[range] & 0xffff)<<16)
+                    | (cpu->env.pmsav7.drsr[range] & 0xffff);
+        }
+    }
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "NVIC: Bad read offset 0x%x\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "NVIC: Bad read offset 0x%x\n", offset);
         return 0;
     }
 }
@@ -726,11 +785,105 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
         qemu_log_mask(LOG_UNIMP,
                       "NVIC: Aux fault status registers unimplemented\n");
         break;
+    case 0xd90: /* MPU_TYPE (0xe000ed90) */
+        return; /* RO */
+    case 0xd94: /* MPU_CTRL */
+    {
+        if ((value & 3) == 2) {
+            qemu_log_mask(LOG_GUEST_ERROR, "MPU_CTRL: HFNMIENA and !ENABLE is "
+                          "UNPREDICTABLE\n");
+            /* we choice to ignore HFNMIENA when the MPU
+             * is not enabled.
+             */
+            value &= ~2;
+        }
+        if (value & 1) {
+            cpu->env.cp15.sctlr_el[1] |= SCTLR_M;
+        } else {
+            cpu->env.cp15.sctlr_el[1] &= ~SCTLR_M;
+        }
+        cpu->env.v7m.mpu_hfnmiena = !!(value & 2);
+        if (value & 4) {
+            cpu->env.cp15.sctlr_el[1] |= SCTLR_BR;
+        } else {
+            cpu->env.cp15.sctlr_el[1] &= ~SCTLR_BR;
+        }
+        tlb_flush(CPU(cpu), 1);
+    }
+        break;
+    case 0xd98: /* MPU_RNR */
+        if (value >= cpu->pmsav7_dregion) {
+            qemu_log_mask(LOG_GUEST_ERROR, "MPU region out of range %u/%u\n",
+                          (unsigned)value, (unsigned)cpu->pmsav7_dregion);
+        } else {
+            cpu->env.cp15.c6_rgnr = value;
+            DPRINTF(0, "MPU -> RGNR = %u\n", (unsigned)value);
+        }
+        tlb_flush(CPU(cpu), 1); /* necessary? */
+        break;
+    case 0xd9c: /* MPU_RBAR */
+    case 0xda4: /* MPU_RBAR_A1 */
+    case 0xdac: /* MPU_RBAR_A2 */
+    case 0xdb4: /* MPU_RBAR_A3 */
+    {
+        uint32_t range;
+        uint32_t base = value;
+
+        if (offset == 0xd9c) {
+            range = cpu->env.cp15.c6_rgnr;
+        } else {
+            range = (offset - 0xda4)/8;
+        }
+
+        if (value & (1<<4)) {
+            range = value & 0xf;
+
+            if (range >= cpu->pmsav7_dregion) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "MPU region out of range %u/%u\n",
+                              (unsigned)range,
+                              (unsigned)cpu->pmsav7_dregion);
+                return;
+            }
+            cpu->env.cp15.c6_rgnr = range;
+            base &= ~0x1f;
+
+        } else if (range >= cpu->pmsav7_dregion) {
+            return;
+        }
+
+        cpu->env.pmsav7.drbar[range] = base & ~0x3;
+        DPRINTF(0, "MPU -> DRBAR[%u] = %08x\n", range,
+                cpu->env.pmsav7.drbar[range]);
+    }
+        tlb_flush(CPU(cpu), 1);
+        break;
+    case 0xda0: /* MPU_RASR */
+    case 0xda8: /* MPU_RASR_A1 */
+    case 0xdb0: /* MPU_RASR_A2 */
+    case 0xdb8: /* MPU_RASR_A3 */
+    {
+        uint32_t range;
+
+        if (offset == 0xda0) {
+            range = cpu->env.cp15.c6_rgnr;
+        } else {
+            range = (offset-0xda8)/8;
+        }
+
+        cpu->env.pmsav7.drsr[range] = value & 0xff3f;
+        cpu->env.pmsav7.dracr[range] = (value>>16) & 0x173f;
+        DPRINTF(0, "MPU -> DRSR[%u] = %08x DRACR[%u] = %08x\n",
+                range, cpu->env.pmsav7.drsr[range],
+                range, cpu->env.pmsav7.dracr[range]);
+    }
+        tlb_flush(CPU(cpu), 1);
+        break;
     case 0xf00: /* Software Triggered Interrupt Register */
         /* STIR write allowed if privlaged or USERSETMPEND set */
         if ((arm_current_el(&cpu->env) || (cpu->env.v7m.ccr & 2))
             && ((value & 0x1ff) < NVIC_MAX_IRQ)) {
-            armv7m_nvic_set_pending(s, (value&0x1ff)+16);
+            armv7m_nvic_set_pending(s, (value & 0x1ff)+16);
         }
         break;
     default:
@@ -841,7 +994,7 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
         offset = offset-0x180+16; /* vector # */
 
         for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
-            if (value&(1<<i)) {
+            if (value & (1<<i)) {
                 s->vectors[offset+i].enabled = setval;
             }
         }
@@ -858,7 +1011,7 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
         offset = offset-0x280+16; /* vector # */
 
         for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
-            if (value&(1<<i)) {
+            if (value & (1<<i)) {
                 s->vectors[offset+i].pending = setval;
             }
         }
@@ -870,7 +1023,7 @@ static void nvic_sysreg_write(void *opaque, hwaddr addr,
         offset = offset-0x400+16; /* vector # */
 
         for (i = 0; i < size; i++) {
-            set_prio(s, offset+i, (value>>(i*8))&0xff);
+            set_prio(s, offset+i, (value>>(i*8)) & 0xff);
         }
         nvic_irq_update(s);
         s->cpu->env.v7m.exception_prio = armv7m_nvic_get_active_prio(s);
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 6e3b251..1fa1f96 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -896,6 +896,7 @@ static void cortex_m3_initfn(Object *obj)
     ARMCPU *cpu = ARM_CPU(obj);
     set_feature(&cpu->env, ARM_FEATURE_V7);
     set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_MPU);
     cpu->midr = 0x410fc231;
 }
 
@@ -905,6 +906,7 @@ static void cortex_m4_initfn(Object *obj)
 
     set_feature(&cpu->env, ARM_FEATURE_V7);
     set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_MPU);
     set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
     cpu->midr = 0x410fc240; /* r0p0 */
 }
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 4e1b8cf..b93f8ae 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -401,6 +401,7 @@ typedef struct CPUARMState {
         uint32_t hfsr; /* HardFault Status */
         uint32_t mmfar; /* MemManage Fault Address */
         uint32_t bfar; /* BusFault Address */
+        unsigned mpu_hfnmiena; /* MPU_CTRL not mappable into SCTLR */
         int current_sp;
         int exception;
         int exception_prio;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 17d1ca0..589aa54 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6060,6 +6060,12 @@ static inline bool regime_translation_disabled(CPUARMState *env,
     if (mmu_idx == ARMMMUIdx_S2NS) {
         return (env->cp15.hcr_el2 & HCR_VM) == 0;
     }
+    if (IS_M(env) && !env->v7m.mpu_hfnmiena &&
+            ((env->v7m.exception > 0 && env->v7m.exception <= 3)
+             || (env->daif & PSTATE_F)))
+    {
+        return 1;
+    }
     return (regime_sctlr(env, mmu_idx) & SCTLR_M) == 0;
 }
 
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 7aee41e..8852410 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -106,6 +106,7 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),
         VMSTATE_UINT32(env.v7m.bfar, ARMCPU),
         VMSTATE_INT32(env.v7m.current_sp, ARMCPU),
+        VMSTATE_UINT32(env.v7m.mpu_hfnmiena, ARMCPU),
         VMSTATE_INT32(env.v7m.exception, ARMCPU),
         VMSTATE_END_OF_LIST()
     }
-- 
2.1.4

