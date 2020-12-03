Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp118450lfb;
        Thu, 3 Dec 2020 15:54:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUFiVTDvxB4JFNyPRS9NHQM2eiKLOdxEL8xi2BvDRUcBx68x0NAImQ/dfFMAiDOR+4cPh+
X-Received: by 2002:a25:d57:: with SMTP id 84mr2428561ybn.248.1607039663412;
        Thu, 03 Dec 2020 15:54:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607039663; cv=none;
        d=google.com; s=arc-20160816;
        b=NhxUHjKBaxeZRbTKxhs6SMQwQ3hjX7ocgbUzvi0D9aOFqC5da8bLH7haBLFr8wbjf3
         OggvabZ/QMIxwyyxeM/4ZHAZwzitijzh2Eg7vO84lbKK+QwhurUdNNdge7SKI1GTFc7g
         vhv3FZ3jyRfsiY/tuWxZ5G7DRw2tFHGbvk9Lk6+h8DRBriHTWpZI3ux9PHFlBgmBHv1B
         AVF4yhrPgkBCsUHd37w5LpknnlYZwriyuq1VqTU+6eEdrJI7gBcrj2utUI2PjK/g22mN
         SJlblhBrCKrzuD/eEXDPtpSqUVLAtXvU8fktV5Kk91opy7WpiOCUDpt0jJ/91FhcH6Li
         Z1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=0Fk57bnnopfloPCf1Ko85/uQ+VAPYtT2qABfgdhlCf4=;
        b=WhZwF5cxkPa2KMBRMFRpCe8/0jsT+tMjl8hOmggXY9pxkLP6BQwzjhGgymkC/dgVKN
         k2uzxlIraVqom5wHeT1IRV8TlDRwhI67Ctipag0apzxVvhX/RD/ebQ8a8Y7mP4yoIVBP
         uKGvg4JUKZUIYH40dKN2rjUZRYHIHB9fZfrVnsZ5ZJi+t+PRh+l0gdiFOUgX/GEsNOIz
         Qq0kYHvlYh6d/9ZxQFUsdpyz6G6U46TpOukUyGr4q4mU2kRF+yucDBE4NuzdIQBMtN4o
         yg8DeYZiNQHuoJ+6/tj+VWexJlkDr2yKjyUtpAunQyCC+Wv0UyJi8oBop5cntV+oF9Kf
         aLug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y64si261549yby.364.2020.12.03.15.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 15:54:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkyQY-0001pV-QO
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 18:54:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkyLX-0002dp-NE; Thu, 03 Dec 2020 18:49:11 -0500
Received: from mail.csgraf.de ([188.138.100.120]:57582
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkyLV-0003Q6-NE; Thu, 03 Dec 2020 18:49:11 -0500
Received: from localhost.localdomain
 (dynamic-077-002-092-143.77.2.pool.telefonica.de [77.2.92.143])
 by csgraf.de (Postfix) with ESMTPSA id BD6253900545;
 Fri,  4 Dec 2020 00:49:03 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/11] hvf: arm: Add support for GICv3
Date: Fri,  4 Dec 2020 00:48:56 +0100
Message-Id: <20201203234857.21051-11-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201203234857.21051-1-agraf@csgraf.de>
References: <20201203234857.21051-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fTEGRT6KUaYX

We currently only support GICv2 emulation. To also support GICv3, we will
need to pass a few system registers into their respective handler functions.

This patch adds handling for all of the required system registers, so that
we can run with more than 8 vCPUs.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 141 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 979008e188..bc955c097f 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -22,6 +22,7 @@
 
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
+#include "hw/intc/gicv3_internal.h"
 #include "qemu/main-loop.h"
 #include "sysemu/accel.h"
 #include "sysemu/cpus.h"
@@ -46,6 +47,33 @@
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 1, 14, 0)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 0, 9, 13)
 
+#define SYSREG_ICC_AP0R0_EL1     SYSREG(3, 0, 4, 12, 8)
+#define SYSREG_ICC_AP0R1_EL1     SYSREG(3, 0, 5, 12, 8)
+#define SYSREG_ICC_AP0R2_EL1     SYSREG(3, 0, 6, 12, 8)
+#define SYSREG_ICC_AP0R3_EL1     SYSREG(3, 0, 7, 12, 8)
+#define SYSREG_ICC_AP1R0_EL1     SYSREG(3, 0, 0, 12, 9)
+#define SYSREG_ICC_AP1R1_EL1     SYSREG(3, 0, 1, 12, 9)
+#define SYSREG_ICC_AP1R2_EL1     SYSREG(3, 0, 2, 12, 9)
+#define SYSREG_ICC_AP1R3_EL1     SYSREG(3, 0, 3, 12, 9)
+#define SYSREG_ICC_ASGI1R_EL1    SYSREG(3, 0, 6, 12, 11)
+#define SYSREG_ICC_BPR0_EL1      SYSREG(3, 0, 3, 12, 8)
+#define SYSREG_ICC_BPR1_EL1      SYSREG(3, 0, 3, 12, 12)
+#define SYSREG_ICC_CTLR_EL1      SYSREG(3, 0, 4, 12, 12)
+#define SYSREG_ICC_DIR_EL1       SYSREG(3, 0, 1, 12, 11)
+#define SYSREG_ICC_EOIR0_EL1     SYSREG(3, 0, 1, 12, 8)
+#define SYSREG_ICC_EOIR1_EL1     SYSREG(3, 0, 1, 12, 12)
+#define SYSREG_ICC_HPPIR0_EL1    SYSREG(3, 0, 2, 12, 8)
+#define SYSREG_ICC_HPPIR1_EL1    SYSREG(3, 0, 2, 12, 12)
+#define SYSREG_ICC_IAR0_EL1      SYSREG(3, 0, 0, 12, 8)
+#define SYSREG_ICC_IAR1_EL1      SYSREG(3, 0, 0, 12, 12)
+#define SYSREG_ICC_IGRPEN0_EL1   SYSREG(3, 0, 6, 12, 12)
+#define SYSREG_ICC_IGRPEN1_EL1   SYSREG(3, 0, 7, 12, 12)
+#define SYSREG_ICC_PMR_EL1       SYSREG(3, 0, 0, 4, 6)
+#define SYSREG_ICC_RPR_EL1       SYSREG(3, 0, 3, 12, 11)
+#define SYSREG_ICC_SGI0R_EL1     SYSREG(3, 0, 7, 12, 11)
+#define SYSREG_ICC_SGI1R_EL1     SYSREG(3, 0, 5, 12, 11)
+#define SYSREG_ICC_SRE_EL1       SYSREG(3, 0, 5, 12, 12)
+
 #define WFX_IS_WFE (1 << 0)
 
 struct hvf_reg_match {
@@ -418,6 +446,38 @@ void hvf_kick_vcpu_thread(CPUState *cpu)
     hv_vcpus_exit(&cpu->hvf->fd, 1);
 }
 
+static uint32_t hvf_reg2cp_reg(uint32_t reg)
+{
+    return ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP,
+                              (reg >> 10) & 0xf,
+                              (reg >> 1) & 0xf,
+                              (reg >> 20) & 0x3,
+                              (reg >> 14) & 0x7,
+                              (reg >> 17) & 0x7);
+}
+
+static uint64_t hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    const ARMCPRegInfo *ri;
+    uint64_t val = 0;
+
+    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
+    if (ri) {
+        if (ri->type & ARM_CP_CONST) {
+            val = ri->resetvalue;
+        } else if (ri->readfn) {
+            val = ri->readfn(env, ri);
+        } else {
+            val = CPREG_FIELD64(env, ri);
+        }
+        DPRINTF("vgic read from %s [val=%016llx]", ri->name, val);
+    }
+
+    return val;
+}
+
 static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -431,6 +491,39 @@ static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
     case SYSREG_PMCCNTR_EL0:
         val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         break;
+    case SYSREG_ICC_AP0R0_EL1:
+    case SYSREG_ICC_AP0R1_EL1:
+    case SYSREG_ICC_AP0R2_EL1:
+    case SYSREG_ICC_AP0R3_EL1:
+    case SYSREG_ICC_AP1R0_EL1:
+    case SYSREG_ICC_AP1R1_EL1:
+    case SYSREG_ICC_AP1R2_EL1:
+    case SYSREG_ICC_AP1R3_EL1:
+    case SYSREG_ICC_ASGI1R_EL1:
+    case SYSREG_ICC_BPR0_EL1:
+    case SYSREG_ICC_BPR1_EL1:
+    case SYSREG_ICC_DIR_EL1:
+    case SYSREG_ICC_EOIR0_EL1:
+    case SYSREG_ICC_EOIR1_EL1:
+    case SYSREG_ICC_HPPIR0_EL1:
+    case SYSREG_ICC_HPPIR1_EL1:
+    case SYSREG_ICC_IAR0_EL1:
+    case SYSREG_ICC_IAR1_EL1:
+    case SYSREG_ICC_IGRPEN0_EL1:
+    case SYSREG_ICC_IGRPEN1_EL1:
+    case SYSREG_ICC_PMR_EL1:
+    case SYSREG_ICC_SGI0R_EL1:
+    case SYSREG_ICC_SGI1R_EL1:
+    case SYSREG_ICC_SRE_EL1:
+        val = hvf_sysreg_read_cp(cpu, reg);
+        break;
+    case SYSREG_ICC_CTLR_EL1:
+        val = hvf_sysreg_read_cp(cpu, reg);
+
+        /* AP0R registers above 0 don't trap, expose less PRIs to fit */
+        val &= ~ICC_CTLR_EL1_PRIBITS_MASK;
+        val |= 4 << ICC_CTLR_EL1_PRIBITS_SHIFT;
+        break;
     default:
         DPRINTF("unhandled sysreg read %08x (op0=%d op1=%d op2=%d "
                 "crn=%d crm=%d)", reg, (reg >> 20) & 0x3,
@@ -442,6 +535,24 @@ static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
     return val;
 }
 
+static void hvf_sysreg_write_cp(CPUState *cpu, uint32_t reg, uint64_t val)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    const ARMCPRegInfo *ri;
+
+    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
+
+    if (ri) {
+        if (ri->writefn) {
+            ri->writefn(env, ri, val);
+        } else {
+            CPREG_FIELD64(env, ri) = val;
+        }
+        DPRINTF("vgic write to %s [val=%016llx]", ri->name, val);
+    }
+}
+
 static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -449,6 +560,36 @@ static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     switch (reg) {
     case SYSREG_CNTPCT_EL0:
         break;
+    case SYSREG_ICC_AP0R0_EL1:
+    case SYSREG_ICC_AP0R1_EL1:
+    case SYSREG_ICC_AP0R2_EL1:
+    case SYSREG_ICC_AP0R3_EL1:
+    case SYSREG_ICC_AP1R0_EL1:
+    case SYSREG_ICC_AP1R1_EL1:
+    case SYSREG_ICC_AP1R2_EL1:
+    case SYSREG_ICC_AP1R3_EL1:
+    case SYSREG_ICC_ASGI1R_EL1:
+    case SYSREG_ICC_BPR0_EL1:
+    case SYSREG_ICC_BPR1_EL1:
+    case SYSREG_ICC_CTLR_EL1:
+    case SYSREG_ICC_DIR_EL1:
+    case SYSREG_ICC_HPPIR0_EL1:
+    case SYSREG_ICC_HPPIR1_EL1:
+    case SYSREG_ICC_IAR0_EL1:
+    case SYSREG_ICC_IAR1_EL1:
+    case SYSREG_ICC_IGRPEN0_EL1:
+    case SYSREG_ICC_IGRPEN1_EL1:
+    case SYSREG_ICC_PMR_EL1:
+    case SYSREG_ICC_SGI0R_EL1:
+    case SYSREG_ICC_SGI1R_EL1:
+    case SYSREG_ICC_SRE_EL1:
+        hvf_sysreg_write_cp(cpu, reg, val);
+        break;
+    case SYSREG_ICC_EOIR0_EL1:
+    case SYSREG_ICC_EOIR1_EL1:
+        hvf_sysreg_write_cp(cpu, reg, val);
+        qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 0);
+        hv_vcpu_set_vtimer_mask(cpu->hvf->fd, false);
     default:
         DPRINTF("unhandled sysreg write %08x", reg);
         break;
-- 
2.24.3 (Apple Git-128)

