Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp54739ejb;
        Sat, 28 Jan 2023 14:45:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/EHd7HxrWrR7NQYuhMKoDqpRZG2HbKYP3w5w56lCZ7vuAyCAIHA6YI6jhY9nMVcsO52awl
X-Received: by 2002:a05:622a:1b86:b0:3b8:5f26:e81f with SMTP id bp6-20020a05622a1b8600b003b85f26e81fmr1054104qtb.26.1674945943510;
        Sat, 28 Jan 2023 14:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674945943; cv=none;
        d=google.com; s=arc-20160816;
        b=JPqw64Kd7JrAxTqHRrgmP4sWSJ1HQU3IgP2IRMdJhDiY2zR8TVmP1bW1So9f22j6wo
         iapbrsU3SeGjM9roK6FmmrngZZzejPl7TbYa5Ej+OMYKXOSeM7RUvKn+a8kPnM8bYdj4
         ckHmnhW2sVFoCsLIkjX5RWHnciSV/gTImPLBfh8XOqV6zddiZu0UHdltJTcCWOtibugG
         zgI2EpMqCija2HoGDWLNEDjVJxLfuseRAxSLHD29KMeWgsIvP64sbwk5RTCLhCq2ZtnX
         s222dNKEsvBKBvJgdiKPLGHyAOsSsW0Sho9ODXuPa/uQcmrvV87GoX9rAFQE2ssAfWv+
         W5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=9QRpOkj0TeGY33mSU7KbFBaVFkMBuP1hgoXdGqOOk2M=;
        b=IeR1zlVWw109xg8oJh9QKhpO8P1W1VDown8zKRQ3Zr81wpJXB/9NBE1NTn53sT9Bta
         /XoKYScFCfe3Wx1ZfWRClYqqKVrlkAPbiddYUvpn4MVkw9TWFXOO+WVP0gGY589CfS9u
         asdSBh05c4fvYPjFhMzHZTBtnTPek5DS4aqtlChzrAJa8GwSWowiBV/qhPKyxTDQd6T0
         lH7yqOMsVtOiVStW7zbJ8n/oCu+11edlbS7ztNgdpkbTfVzP0kuJ65umi85lHkrtG+sR
         Kt/vmGgYCr+6CvclP01I3hNMHLLhpMhfSgwGll6t1I9H44q04/ZXfd5O7hH6eakGR2UB
         ff9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13-20020a05622a018d00b0039abe2daf39si1190538qtw.180.2023.01.28.14.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 14:45:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLtwg-0005fe-I0; Sat, 28 Jan 2023 17:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1pLtwY-0005fT-0n; Sat, 28 Jan 2023 17:45:06 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1pLtwV-0005VG-TL; Sat, 28 Jan 2023 17:45:05 -0500
Received: from localhost.localdomain (unknown [46.183.103.8])
 by csgraf.de (Postfix) with ESMTPSA id 067FB60801B9;
 Sat, 28 Jan 2023 23:45:01 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 osy <osy@turing.llc>
Subject: [PATCH v2] hvf: arm: Add support for GICv3
Date: Sat, 28 Jan 2023 23:44:59 +0100
Message-Id: <20230128224459.70676-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RA2tAxO2hdba

We currently only support GICv2 emulation. To also support GICv3, we will
need to pass a few system registers into their respective handler functions.

This patch adds support for HVF to call into the TCG callbacks for GICv3
system register handlers. This is safe because the GICv3 TCG code is generic
as long as we limit ourselves to EL0 and EL1 - which are the only modes
supported by HVF.

To make sure nobody trips over that, we also annotate callbacks that don't
work in HVF mode, such as EL state change hooks.

With GICv3 support in place, we can run with more than 8 vCPUs.

Signed-off-by: Alexander Graf <agraf@csgraf.de>

---

v1 -> v2:

  - assert when guest has EL2/EL3 and uses non-TCG GICv3
  - use defines for sysreg masks
---
 hw/intc/arm_gicv3_cpuif.c   |  15 +++-
 target/arm/hvf/hvf.c        | 151 ++++++++++++++++++++++++++++++++++++
 target/arm/hvf/trace-events |   2 +
 3 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index b17b29288c..c4ff595742 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -21,6 +21,7 @@
 #include "hw/irq.h"
 #include "cpu.h"
 #include "target/arm/cpregs.h"
+#include "sysemu/tcg.h"
 
 /*
  * Special case return value from hppvi_index(); must be larger than
@@ -2810,6 +2811,8 @@ void gicv3_init_cpuif(GICv3State *s)
          * which case we'd get the wrong value.
          * So instead we define the regs with no ri->opaque info, and
          * get back to the GICv3CPUState from the CPUARMState.
+         *
+         * These CP regs callbacks can be called from either TCG or HVF code.
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
 
@@ -2905,6 +2908,16 @@ void gicv3_init_cpuif(GICv3State *s)
                 define_arm_cp_regs(cpu, gicv3_cpuif_ich_apxr23_reginfo);
             }
         }
-        arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
+        if (tcg_enabled()) {
+            /*
+             * We can only trap EL changes with TCG. However the GIC interrupt
+             * state only changes on EL changes involving EL2 or EL3, so for
+             * the non-TCG case this is OK, as EL2 and EL3 can't exist.
+             */
+            arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
+        } else {
+            assert(!arm_feature(&cpu->env, ARM_FEATURE_EL2));
+            assert(!arm_feature(&cpu->env, ARM_FEATURE_EL3));
+        }
     }
 }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..ad65603445 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -80,6 +80,33 @@
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
 
+#define SYSREG_ICC_AP0R0_EL1     SYSREG(3, 0, 12, 8, 4)
+#define SYSREG_ICC_AP0R1_EL1     SYSREG(3, 0, 12, 8, 5)
+#define SYSREG_ICC_AP0R2_EL1     SYSREG(3, 0, 12, 8, 6)
+#define SYSREG_ICC_AP0R3_EL1     SYSREG(3, 0, 12, 8, 7)
+#define SYSREG_ICC_AP1R0_EL1     SYSREG(3, 0, 12, 9, 0)
+#define SYSREG_ICC_AP1R1_EL1     SYSREG(3, 0, 12, 9, 1)
+#define SYSREG_ICC_AP1R2_EL1     SYSREG(3, 0, 12, 9, 2)
+#define SYSREG_ICC_AP1R3_EL1     SYSREG(3, 0, 12, 9, 3)
+#define SYSREG_ICC_ASGI1R_EL1    SYSREG(3, 0, 12, 11, 6)
+#define SYSREG_ICC_BPR0_EL1      SYSREG(3, 0, 12, 8, 3)
+#define SYSREG_ICC_BPR1_EL1      SYSREG(3, 0, 12, 12, 3)
+#define SYSREG_ICC_CTLR_EL1      SYSREG(3, 0, 12, 12, 4)
+#define SYSREG_ICC_DIR_EL1       SYSREG(3, 0, 12, 11, 1)
+#define SYSREG_ICC_EOIR0_EL1     SYSREG(3, 0, 12, 8, 1)
+#define SYSREG_ICC_EOIR1_EL1     SYSREG(3, 0, 12, 12, 1)
+#define SYSREG_ICC_HPPIR0_EL1    SYSREG(3, 0, 12, 8, 2)
+#define SYSREG_ICC_HPPIR1_EL1    SYSREG(3, 0, 12, 12, 2)
+#define SYSREG_ICC_IAR0_EL1      SYSREG(3, 0, 12, 8, 0)
+#define SYSREG_ICC_IAR1_EL1      SYSREG(3, 0, 12, 12, 0)
+#define SYSREG_ICC_IGRPEN0_EL1   SYSREG(3, 0, 12, 12, 6)
+#define SYSREG_ICC_IGRPEN1_EL1   SYSREG(3, 0, 12, 12, 7)
+#define SYSREG_ICC_PMR_EL1       SYSREG(3, 0, 4, 6, 0)
+#define SYSREG_ICC_RPR_EL1       SYSREG(3, 0, 12, 11, 3)
+#define SYSREG_ICC_SGI0R_EL1     SYSREG(3, 0, 12, 11, 7)
+#define SYSREG_ICC_SGI1R_EL1     SYSREG(3, 0, 12, 11, 5)
+#define SYSREG_ICC_SRE_EL1       SYSREG(3, 0, 12, 12, 5)
+
 #define WFX_IS_WFE (1 << 0)
 
 #define TMR_CTL_ENABLE  (1 << 0)
@@ -788,6 +815,43 @@ static bool is_id_sysreg(uint32_t reg)
            SYSREG_CRM(reg) < 8;
 }
 
+static uint32_t hvf_reg2cp_reg(uint32_t reg)
+{
+    return ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP,
+                              (reg >> SYSREG_CRN_SHIFT) & SYSREG_CRN_MASK,
+                              (reg >> SYSREG_CRM_SHIFT) & SYSREG_CRM_MASK,
+                              (reg >> SYSREG_OP0_SHIFT) & SYSREG_OP0_MASK,
+                              (reg >> SYSREG_OP1_SHIFT) & SYSREG_OP1_MASK,
+                              (reg >> SYSREG_OP2_SHIFT) & SYSREG_OP2_MASK);
+}
+
+static bool hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg, uint64_t *val)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    const ARMCPRegInfo *ri;
+
+    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
+    if (ri) {
+        if (ri->accessfn) {
+            if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
+                return false;
+            }
+        }
+        if (ri->type & ARM_CP_CONST) {
+            *val = ri->resetvalue;
+        } else if (ri->readfn) {
+            *val = ri->readfn(env, ri);
+        } else {
+            *val = CPREG_FIELD64(env, ri);
+        }
+        trace_hvf_vgic_read(ri->name, *val);
+        return true;
+    }
+
+    return false;
+}
+
 static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -839,6 +903,36 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
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
+    case SYSREG_ICC_CTLR_EL1:
+        /* Call the TCG sysreg handler. This is only safe for GICv3 regs. */
+        if (!hvf_sysreg_read_cp(cpu, reg, &val)) {
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        }
+        break;
     default:
         if (is_id_sysreg(reg)) {
             /* ID system registers read as RES0 */
@@ -944,6 +1038,33 @@ static void pmswinc_write(CPUARMState *env, uint64_t value)
     }
 }
 
+static bool hvf_sysreg_write_cp(CPUState *cpu, uint32_t reg, uint64_t val)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    const ARMCPRegInfo *ri;
+
+    ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
+
+    if (ri) {
+        if (ri->accessfn) {
+            if (ri->accessfn(env, ri, false) != CP_ACCESS_OK) {
+                return false;
+            }
+        }
+        if (ri->writefn) {
+            ri->writefn(env, ri, val);
+        } else {
+            CPREG_FIELD64(env, ri) = val;
+        }
+
+        trace_hvf_vgic_write(ri->name, val);
+        return true;
+    }
+
+    return false;
+}
+
 static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
@@ -1021,6 +1142,36 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
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
+        /* Call the TCG sysreg handler. This is only safe for GICv3 regs. */
+        if (!hvf_sysreg_write_cp(cpu, reg, val)) {
+            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
+        }
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
diff --git a/target/arm/hvf/trace-events b/target/arm/hvf/trace-events
index 820e8e0297..4fbbe4b45e 100644
--- a/target/arm/hvf/trace-events
+++ b/target/arm/hvf/trace-events
@@ -9,3 +9,5 @@ hvf_unknown_hvc(uint64_t x0) "unknown HVC! 0x%016"PRIx64
 hvf_unknown_smc(uint64_t x0) "unknown SMC! 0x%016"PRIx64
 hvf_exit(uint64_t syndrome, uint32_t ec, uint64_t pc) "exit: 0x%"PRIx64" [ec=0x%x pc=0x%"PRIx64"]"
 hvf_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpu=0x%x"
+hvf_vgic_write(const char *name, uint64_t val) "vgic write to %s [val=0x%016"PRIx64"]"
+hvf_vgic_read(const char *name, uint64_t val) "vgic read from %s [val=0x%016"PRIx64"]"
-- 
2.37.1 (Apple Git-137.1)

