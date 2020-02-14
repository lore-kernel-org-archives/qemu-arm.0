Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2199570lfp;
        Fri, 14 Feb 2020 09:52:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqypD2JQSGnp6woWgh2T+6kepGHEiT7qMij3BrxuI69PVhsdF2igj1ARWNUS8hvdHQEtYYhr
X-Received: by 2002:a05:620a:7f1:: with SMTP id k17mr3566836qkk.484.1581702727219;
        Fri, 14 Feb 2020 09:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702727; cv=none;
        d=google.com; s=arc-20160816;
        b=PM/sbLKzsDOSZmqxuj+VxZlomb0rE1wLv7E5RmXJU1gDut7SHJBh0OQO9kn/PI0jpw
         geyFJav/QIz434WNhCB+1CM9dIyaOlQ3Y9Tdfcl9sSX6j2wHU2ED8KZbsLV6PokyVpyV
         OSOCxhyP3a1kJYDrDP1Ik5Y26CCf0h9H9fHptPz2vhibKbIZdQ1nwvFTuWIY+hp2si8h
         XJxLhJwOW3qg0W8Y0ftGhOQT2ni9+v5gxeBVEjNtWCXfDvvBaG/WuWThTD048Dykdb37
         RT5VkbRnpBmO0E6XpGCWu7uj6od9Rue+VPmh/q3xgc6DZ3ZDgFcA5SB1AaZaDMt43AXZ
         dU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2XRfHOyhPSH4cYUDW/HDN1fLtRvOem+XGDBRyAVp+4g=;
        b=AX5toJVO3n83x+WZSTYHlZw6Xc6Vvy7vpBZXITz2YFKUaOT9JuiQpBXyaOCE6FCbM0
         NziJY8/sq5ci2wOpM+3q00sPwcu/V3lVsEDbAcV//JV9SAvw79Fxt1BfsUTAZY8MDd3T
         nm6mDcG4Hqqy5AhG306ORbDwt2VFRtjMn9bh4ol8rMkvP3NpiqM8/VkHIjikBFh/AKQp
         hB3njELkjiD2vCxUSpuVWTSvkLW5zx7nj6dNPtXkEP2gWZCqLQMSTBGMcX7JbZHNofSD
         xO9hKr2C1AzahUyJycJlnvk7lzLW8v8leHipoi7su+fJ4J34h8A47z/Bs1si0n5UtQpV
         3TXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=howWY4qz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si2862870qtj.342.2020.02.14.09.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:52:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=howWY4qz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2f8I-0006n2-JN
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7k-0005t8-AZ
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7i-0000jz-A8
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:32 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34448)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7h-0000iN-Te
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:30 -0500
Received: by mail-wm1-x342.google.com with SMTP id s144so2570551wme.1
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XRfHOyhPSH4cYUDW/HDN1fLtRvOem+XGDBRyAVp+4g=;
 b=howWY4qzlzNbFfxTLB4TSROv/wu5EMJngCO5FaSXYWex4j5cbNsJzbSpksLIV7GXoK
 CrZDi8ssBLeBwunKyQ2SUwk1F8gX2iv3TLEFO70EPXdjuJzO3kcfsYXaEHsOruWXBeMn
 DEiW3YyVvfXkaIzTnRSjE9avp1x1olpym1yEuZy/uzSqp1MK8hx5n6cYAXSq+eTJuHj+
 9Qkms5M8j2NERs+hxs6K2Ab8Zj9E9zbp3rP5F5iNjMEz039mer0LBeLWqVYldaSvgdGP
 3KAH0wtExQo/QjRJ8pwOxcf2641IKAcYd6wYlztH0uLqk0jhRa9n00iTWfYchjks31xB
 pr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2XRfHOyhPSH4cYUDW/HDN1fLtRvOem+XGDBRyAVp+4g=;
 b=dl5eR+hRiWbLBHRCgXm4aI4PjNa801eys9nfPfvxtL+e4eLBKCHoIj0JUAU178X+CX
 QbkA0+ZWfcxg6ELr+ZZKXJ19V0MfvrV1zH98g2vrU4yZVr3RNTznV9W4BdMCSlUZFi6+
 pLXwsyHTMqbo5PgU7kcakkz1PZTRNiVdL36J0KtHQahLcMEjz5+mL6k2Pa6QQF4P2O2A
 7i89I9gQMxG3aVPOzZoAae3klUMlkQ3DgokXSLUeSFK1jHK6ej1SzWOUsV+4z0mb2G4f
 3BgCKSMlpE7UtmMg/KKAwR018vnSdAaGYy4JhQgZRavGWROzVOprUYEe5J5A219S7Hhi
 jI8g==
X-Gm-Message-State: APjAAAV+tUkIjqPY+JGhefuhqCycc/auRr+VEBUArsBAPbxPZxOSrRdB
 hpYuDFeb0ayZ5O6+kKsDHwaVqrukT2w=
X-Received: by 2002:a1c:e483:: with SMTP id b125mr5869729wmh.187.1581702687425; 
 Fri, 14 Feb 2020 09:51:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/21] target/arm: Factor out PMU register definitions
Date: Fri, 14 Feb 2020 17:51:00 +0000
Message-Id: <20200214175116.9164-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O7SuwXDOMh2x

Pull the code that defines the various PMU registers out
into its own function, matching the pattern we have
already for the debug registers.

Apart from one style fix to a multi-line comment, this
is purely movement of code with no changes to it.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 158 +++++++++++++++++++++++---------------------
 1 file changed, 82 insertions(+), 76 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b3ced7f78ba..c53d6406474 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6317,6 +6317,87 @@ static void define_debug_regs(ARMCPU *cpu)
     }
 }
 
+static void define_pmu_regs(ARMCPU *cpu)
+{
+    /*
+     * v7 performance monitor control register: same implementor
+     * field as main ID register, and we implement four counters in
+     * addition to the cycle count register.
+     */
+    unsigned int i, pmcrn = 4;
+    ARMCPRegInfo pmcr = {
+        .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
+        .access = PL0_RW,
+        .type = ARM_CP_IO | ARM_CP_ALIAS,
+        .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcr),
+        .accessfn = pmreg_access, .writefn = pmcr_write,
+        .raw_writefn = raw_write,
+    };
+    ARMCPRegInfo pmcr64 = {
+        .name = "PMCR_EL0", .state = ARM_CP_STATE_AA64,
+        .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 0,
+        .access = PL0_RW, .accessfn = pmreg_access,
+        .type = ARM_CP_IO,
+        .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
+        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT),
+        .writefn = pmcr_write, .raw_writefn = raw_write,
+    };
+    define_one_arm_cp_reg(cpu, &pmcr);
+    define_one_arm_cp_reg(cpu, &pmcr64);
+    for (i = 0; i < pmcrn; i++) {
+        char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
+        char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
+        char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
+        char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
+        ARMCPRegInfo pmev_regs[] = {
+            { .name = pmevcntr_name, .cp = 15, .crn = 14,
+              .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
+              .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
+              .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
+              .accessfn = pmreg_access },
+            { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 8 | (3 & (i >> 3)),
+              .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+              .type = ARM_CP_IO,
+              .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
+              .raw_readfn = pmevcntr_rawread,
+              .raw_writefn = pmevcntr_rawwrite },
+            { .name = pmevtyper_name, .cp = 15, .crn = 14,
+              .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
+              .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
+              .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
+              .accessfn = pmreg_access },
+            { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
+              .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 12 | (3 & (i >> 3)),
+              .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+              .type = ARM_CP_IO,
+              .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
+              .raw_writefn = pmevtyper_rawwrite },
+            REGINFO_SENTINEL
+        };
+        define_arm_cp_regs(cpu, pmev_regs);
+        g_free(pmevcntr_name);
+        g_free(pmevcntr_el0_name);
+        g_free(pmevtyper_name);
+        g_free(pmevtyper_el0_name);
+    }
+    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
+            FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) != 0xf) {
+        ARMCPRegInfo v81_pmu_regs[] = {
+            { .name = "PMCEID2", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 4,
+              .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+              .resetvalue = extract64(cpu->pmceid0, 32, 32) },
+            { .name = "PMCEID3", .state = ARM_CP_STATE_AA32,
+              .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 5,
+              .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
+              .resetvalue = extract64(cpu->pmceid1, 32, 32) },
+            REGINFO_SENTINEL
+        };
+        define_arm_cp_regs(cpu, v81_pmu_regs);
+    }
+}
+
 /* We don't know until after realize whether there's a GICv3
  * attached, and that is what registers the gicv3 sysregs.
  * So we have to fill in the GIC fields in ID_PFR/ID_PFR1_EL1/ID_AA64PFR0_EL1
@@ -6859,67 +6940,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, pmovsset_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
-        /* v7 performance monitor control register: same implementor
-         * field as main ID register, and we implement four counters in
-         * addition to the cycle count register.
-         */
-        unsigned int i, pmcrn = 4;
-        ARMCPRegInfo pmcr = {
-            .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
-            .access = PL0_RW,
-            .type = ARM_CP_IO | ARM_CP_ALIAS,
-            .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmcr),
-            .accessfn = pmreg_access, .writefn = pmcr_write,
-            .raw_writefn = raw_write,
-        };
-        ARMCPRegInfo pmcr64 = {
-            .name = "PMCR_EL0", .state = ARM_CP_STATE_AA64,
-            .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 0,
-            .access = PL0_RW, .accessfn = pmreg_access,
-            .type = ARM_CP_IO,
-            .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-            .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT),
-            .writefn = pmcr_write, .raw_writefn = raw_write,
-        };
-        define_one_arm_cp_reg(cpu, &pmcr);
-        define_one_arm_cp_reg(cpu, &pmcr64);
-        for (i = 0; i < pmcrn; i++) {
-            char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
-            char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
-            char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
-            char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
-            ARMCPRegInfo pmev_regs[] = {
-                { .name = pmevcntr_name, .cp = 15, .crn = 14,
-                  .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
-                  .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
-                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
-                  .accessfn = pmreg_access },
-                { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
-                  .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 8 | (3 & (i >> 3)),
-                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
-                  .type = ARM_CP_IO,
-                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
-                  .raw_readfn = pmevcntr_rawread,
-                  .raw_writefn = pmevcntr_rawwrite },
-                { .name = pmevtyper_name, .cp = 15, .crn = 14,
-                  .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
-                  .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
-                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
-                  .accessfn = pmreg_access },
-                { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
-                  .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 12 | (3 & (i >> 3)),
-                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
-                  .type = ARM_CP_IO,
-                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
-                  .raw_writefn = pmevtyper_rawwrite },
-                REGINFO_SENTINEL
-            };
-            define_arm_cp_regs(cpu, pmev_regs);
-            g_free(pmevcntr_name);
-            g_free(pmevcntr_el0_name);
-            g_free(pmevtyper_name);
-            g_free(pmevtyper_el0_name);
-        }
         ARMCPRegInfo clidr = {
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 1, .opc2 = 1,
@@ -6930,24 +6950,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &clidr);
         define_arm_cp_regs(cpu, v7_cp_reginfo);
         define_debug_regs(cpu);
+        define_pmu_regs(cpu);
     } else {
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
     }
-    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
-            FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) != 0xf) {
-        ARMCPRegInfo v81_pmu_regs[] = {
-            { .name = "PMCEID2", .state = ARM_CP_STATE_AA32,
-              .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 4,
-              .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
-              .resetvalue = extract64(cpu->pmceid0, 32, 32) },
-            { .name = "PMCEID3", .state = ARM_CP_STATE_AA32,
-              .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 5,
-              .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,
-              .resetvalue = extract64(cpu->pmceid1, 32, 32) },
-            REGINFO_SENTINEL
-        };
-        define_arm_cp_regs(cpu, v81_pmu_regs);
-    }
     if (arm_feature(env, ARM_FEATURE_V8)) {
         /* AArch64 ID registers, which all have impdef reset values.
          * Note that within the ID register ranges the unused slots
-- 
2.20.1

