Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1423170lfb;
        Wed, 2 Dec 2020 11:06:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWkqn+i8mJD6AAJjUUhJkRLj7YRg9aVPGBUB4TRqgVYc5AKyf6P6eTxoIAzH++n5/1DcCh
X-Received: by 2002:a25:318b:: with SMTP id x133mr5814782ybx.201.1606935969712;
        Wed, 02 Dec 2020 11:06:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606935969; cv=none;
        d=google.com; s=arc-20160816;
        b=GwvUhpu55u7Tx4XE1NAN0lIBTHXAD9XaGo4C92UPRhuPDnm9h19BQ9TW2hWZXA6/hD
         ROWKBEONrTAiDfREkCxmgmXNO1KObV92ViiDvf3hHo6sQ51mLdJItskteuXLFlUkrVCs
         DiBU/b2Ibp0M0NdKCscO+IiHsiAQGtDa+pnCnwSoHo6YWmXhYN3XpOl2QNfgvVkksYIf
         MtydTGz3MEGBJVbmwizgChXF2igrz7WrS7W40smXVxCoVfQM7mCuIg1xXcTstvlAMaOX
         LQsNhtlxxtUH6hypWJoeAf0rzCysyWz0DmfRhAHsGEXqQQDWbXIajww0uoQW0EtBB9C4
         WYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=BDAhTSb/joRX8a5QdpkDYN2fIvfqRnrY13VoSt9Mwzw=;
        b=Ak7zTxmkonzFbaPi4Pr+LuQCqckU2kJcqmVRj3ubT9AaqdjlCEwHcCQ5AyIQsFE9Wv
         4h6dQwBB/nZEuWG+pxTf6DP0uWp0RaxCZIk3DVqXus43B43yyXBczdWWKJFTPaGRCZdL
         G49jSSpsLaQdhqTvyvuU3VHm3DbvFywvlVouHzshisTn5jptpliSFoIVfTPgwvY8VTNK
         WqpEsfcntwwIC3F0sbGmbGjOfnLAi/mWMRYa0GFGJ24VNyqba0dSQWOtKYxsmI6vrpKo
         mRhiGLhb+pxSKhiG7V2y2xZdGFM4liy24tY9Xq8HShP2rHRWFIxprCo3nB7aiAL9VVNQ
         Jq1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si2569375ybb.193.2020.12.02.11.06.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 11:06:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkXS5-0003qc-1r
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 14:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkXQT-0003L5-VP; Wed, 02 Dec 2020 14:04:29 -0500
Received: from mail.csgraf.de ([188.138.100.120]:56516
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkXQO-0005Hb-5m; Wed, 02 Dec 2020 14:04:29 -0500
Received: from localhost.localdomain
 (dynamic-077-007-031-140.77.7.pool.telefonica.de [77.7.31.140])
 by csgraf.de (Postfix) with ESMTPSA id A173939004F5;
 Wed,  2 Dec 2020 20:04:19 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/10] hvf: arm: Add support for GICv3
Date: Wed,  2 Dec 2020 20:04:07 +0100
Message-Id: <20201202190408.2041-10-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201202190408.2041-1-agraf@csgraf.de>
References: <20201202190408.2041-1-agraf@csgraf.de>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EqFNtfJv1b0N

We currently only support GICv2 emulation. To also support GICv3, we will
need to pass a few system registers into their respective handler functions.

This patch adds handling for all of the required system registers, so that
we can run with more than 8 vCPUs.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 141 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 79aeeb237b..dfdf0827e4 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -23,6 +23,7 @@
 
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
+#include "hw/intc/gicv3_internal.h"
 #include "qemu/main-loop.h"
 #include "sysemu/accel.h"
 #include "sysemu/cpus.h"
@@ -47,6 +48,33 @@
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
@@ -419,6 +447,38 @@ void hvf_kick_vcpu_thread(CPUState *cpu)
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
@@ -432,6 +492,39 @@ static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
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
@@ -443,6 +536,24 @@ static uint64_t hvf_sysreg_read(CPUState *cpu, uint32_t reg)
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
@@ -450,6 +561,36 @@ static void hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
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

