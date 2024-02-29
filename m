Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp374882eja;
        Thu, 29 Feb 2024 05:14:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXR/Nvi4Hg1FFTM3Fz13MyxtwN/sJCzhksedRLMoIfqdo3TJoSwWMMOfo7tU/TmfEtvIYNijnXSQ0TFfOpuZKz8z/rU4S5j
X-Google-Smtp-Source: AGHT+IGOBxSRmrV47904xPrNJ9bzCD5t4usd1ms7EwuxQsFeWJewSdjVli52kTagNtuJJfnVAzKT
X-Received: by 2002:a05:620a:470d:b0:787:ffa9:ba59 with SMTP id bs13-20020a05620a470d00b00787ffa9ba59mr1043737qkb.54.1709212467334;
        Thu, 29 Feb 2024 05:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709212467; cv=none;
        d=google.com; s=arc-20160816;
        b=0cKUklo/W9V4P7n1JNCZ1dJcgi2NFFvjQCe1Z0WabqVlYzBUeeHMRkO/yiE5sfM7MA
         czeqh2MDeTHaQ0nRDpNa6RGvXJHVywnfOw/mG7oeK0FIDFPPx9wShmnvH+nqDqU/e0mb
         bVhkE2H3PLsp3ipl22dzIQLBIbhl5VpRmWj6IFEuU1rO5P8rAejOqhgNh2DLWM1b5ry1
         WnJeER+oK1arwRCGcVzr09l0lNYObMZovqx+1erflflqUhpcbk0d0Mn3ZbFPGD9QdW5F
         RAP+k/mZzxQsf4gCTifdacAoelxDVkf0iY0ekY7tplIq1rCst+898BkuLKN1/jcL9k0z
         7ICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=wFbNyKhjb6YfhNlAuZT+r+iZx6/59moLgXDd3sjnPTw=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=AhfvYJT0AUGxYFk3Qb09VUimCZ1eezX+bLuOthoThQMEmvpj3Kzx4BP/8iMHLF0WFK
         X4i8qnkjLzYoWAMTtsYCG80d00ue5GuAMgMTbbC9qUAEUZWJjwWSRA+YqPNniirTmOkQ
         cSm/kBRpZ8WXpzCj5zNMTsq3wu6BNCnTBz/VRp6RKRDQsT7xm5oc9S57KZaaLWy/8Jt8
         8f2I1a4PIZ6JyE3lAgNE7u/wJqCZ8AuhQ4JJiB6mKsf5NsCXfr3sfUto78LqhSUTNWke
         MveyjgPktNXj7lqAGhqNCueMuqHUyTNU2DCk62MckWCGBh5B4HqxVG+RvvkUXN6ryOJf
         LcBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s1-20020a05620a16a100b007879038b456si1319838qkj.196.2024.02.29.05.14.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Feb 2024 05:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rfgDG-0006Nk-1t; Thu, 29 Feb 2024 08:12:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCk-0005lB-2E; Thu, 29 Feb 2024 08:12:07 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfgCg-0002j3-TS; Thu, 29 Feb 2024 08:12:05 -0500
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Tls543WYDz1h13w;
 Thu, 29 Feb 2024 21:09:44 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 43B7814037D;
 Thu, 29 Feb 2024 21:12:00 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 21:11:54 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v5 17/22] hw/intc/arm_gicv3: Add NMI handling CPU
 interface registers
Date: Thu, 29 Feb 2024 13:10:34 +0000
Message-ID: <20240229131039.1868904-18-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229131039.1868904-1-ruanjinjie@huawei.com>
References: <20240229131039.1868904-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=ruanjinjie@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EKBXUAPyluOr

Add the NMIAR CPU interface registers which deal with acknowledging NMI.

When introduce NMI interrupt, there are some updates to the semantics for the
register ICC_IAR1_EL1 and ICC_HPPIR1_EL1. For ICC_IAR1_EL1 register, it
should return 1022 if the intid has super priority. And for ICC_NMIAR1_EL1
register, it should return 1023 if the intid do not have super priority.
Howerever, these are not necessary for ICC_HPPIR1_EL1 register.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v4:
- Define ICC_NMIAR1_EL1 only if FEAT_GICv3_NMI is implemented.
- Check sctrl_elx.SCTLR_NMI to return 1022 for icc_iar1_read().
- Add gicv3_icc_nmiar1_read() trace event.
- Do not check icc_hppi_can_preempt() for icc_nmiar1_read().
- Add icv_nmiar1_read() and call it when EL2Enabled() and HCR_EL2.IMO == '1'
---
 hw/intc/arm_gicv3_cpuif.c | 59 +++++++++++++++++++++++++++++++++++++--
 hw/intc/gicv3_internal.h  |  1 +
 hw/intc/trace-events      |  1 +
 3 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index e1a60d8c15..df82a413c6 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -795,6 +795,13 @@ static uint64_t icv_iar_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return intid;
 }
 
+static uint64_t icv_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* todo */
+    uint64_t intid = INTID_SPURIOUS;
+    return intid;
+}
+
 static uint32_t icc_fullprio_mask(GICv3CPUState *cs)
 {
     /*
@@ -1097,7 +1104,8 @@ static uint64_t icc_hppir0_value(GICv3CPUState *cs, CPUARMState *env)
     return cs->hppi.irq;
 }
 
-static uint64_t icc_hppir1_value(GICv3CPUState *cs, CPUARMState *env)
+static uint64_t icc_hppir1_value(GICv3CPUState *cs, CPUARMState *env,
+                                 bool is_nmi, bool is_hppi)
 {
     /* Return the highest priority pending interrupt register value
      * for group 1.
@@ -1108,6 +1116,19 @@ static uint64_t icc_hppir1_value(GICv3CPUState *cs, CPUARMState *env)
         return INTID_SPURIOUS;
     }
 
+    if (!is_hppi) {
+        int el = arm_current_el(env);
+
+        if (is_nmi && (!cs->hppi.superprio)) {
+            return INTID_SPURIOUS;
+        }
+
+        if ((!is_nmi) && cs->hppi.superprio
+            && env->cp15.sctlr_el[el] & SCTLR_NMI) {
+            return INTID_NMI;
+        }
+    }
+
     /* Check whether we can return the interrupt or if we should return
      * a special identifier, as per the CheckGroup1ForSpecialIdentifiers
      * pseudocode. (We can simplify a little because for us ICC_SRE_EL1.RM
@@ -1168,7 +1189,7 @@ static uint64_t icc_iar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     if (!icc_hppi_can_preempt(cs)) {
         intid = INTID_SPURIOUS;
     } else {
-        intid = icc_hppir1_value(cs, env);
+        intid = icc_hppir1_value(cs, env, false, false);
     }
 
     if (!gicv3_intid_is_special(intid)) {
@@ -1179,6 +1200,25 @@ static uint64_t icc_iar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return intid;
 }
 
+static uint64_t icc_nmiar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t intid;
+
+    if (icv_access(env, HCR_IMO)) {
+        return icv_nmiar1_read(env, ri);
+    }
+
+    intid = icc_hppir1_value(cs, env, true, false);
+
+    if (!gicv3_intid_is_special(intid)) {
+        icc_activate_irq(cs, intid);
+    }
+
+    trace_gicv3_icc_nmiar1_read(gicv3_redist_affid(cs), intid);
+    return intid;
+}
+
 static void icc_drop_prio(GICv3CPUState *cs, int grp)
 {
     /* Drop the priority of the currently active interrupt in
@@ -1555,7 +1595,7 @@ static uint64_t icc_hppir1_read(CPUARMState *env, const ARMCPRegInfo *ri)
         return icv_hppir_read(env, ri);
     }
 
-    value = icc_hppir1_value(cs, env);
+    value = icc_hppir1_value(cs, env, false, true);
     trace_gicv3_icc_hppir1_read(gicv3_redist_affid(cs), value);
     return value;
 }
@@ -2482,6 +2522,15 @@ static const ARMCPRegInfo gicv3_cpuif_icc_apxr23_reginfo[] = {
     },
 };
 
+static const ARMCPRegInfo gicv3_cpuif_gicv3_nmi_reginfo[] = {
+    { .name = "ICC_NMIAR1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 5,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_R, .accessfn = gicv3_irq_access,
+      .readfn = icc_nmiar1_read,
+    },
+};
+
 static uint64_t ich_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
@@ -2838,6 +2887,10 @@ void gicv3_init_cpuif(GICv3State *s)
          */
         define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
 
+        if (s->nmi_support) {
+            define_arm_cp_regs(cpu, gicv3_cpuif_gicv3_nmi_reginfo);
+        }
+
         /*
          * The CPU implementation specifies the number of supported
          * bits of physical priority. For backwards compatibility
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 8d793243f4..93e56b3726 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -511,6 +511,7 @@ FIELD(VTE, RDBASE, 42, RDBASE_PROCNUM_LENGTH)
 /* Special interrupt IDs */
 #define INTID_SECURE 1020
 #define INTID_NONSECURE 1021
+#define INTID_NMI 1022
 #define INTID_SPURIOUS 1023
 
 /* Functions internal to the emulated GICv3 */
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 1ef29d0256..94030550d5 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -116,6 +116,7 @@ gicv3_cpuif_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f
 gicv3_icc_generate_sgi(uint32_t cpuid, int irq, int irm, uint32_t aff, uint32_t targetlist) "GICv3 CPU i/f 0x%x generating SGI %d IRM %d target affinity 0x%xxx targetlist 0x%x"
 gicv3_icc_iar0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR0 read cpu 0x%x value 0x%" PRIx64
 gicv3_icc_iar1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR1 read cpu 0x%x value 0x%" PRIx64
+gicv3_icc_nmiar1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_NMIAR1 read cpu 0x%x value 0x%" PRIx64
 gicv3_icc_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_EOIR%d write cpu 0x%x value 0x%" PRIx64
 gicv3_icc_hppir0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR0 read cpu 0x%x value 0x%" PRIx64
 gicv3_icc_hppir1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR1 read cpu 0x%x value 0x%" PRIx64
-- 
2.34.1

