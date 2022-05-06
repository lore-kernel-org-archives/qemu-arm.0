Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1985313lfj;
        Fri, 6 May 2022 11:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsQHRSR5m6yJuCP5ZyAog6tr2wy30TZVCE6Bg0cn+UTlRnpcL5f5H1bjgeyHFdZWUGIeqh
X-Received: by 2002:a05:6214:1c85:b0:443:8347:d7a5 with SMTP id ib5-20020a0562141c8500b004438347d7a5mr3778514qvb.11.1651861263910;
        Fri, 06 May 2022 11:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651861263; cv=none;
        d=google.com; s=arc-20160816;
        b=fPrLGklDhGpROpcvubhY0AcApfvLrutYGKI30u++vaVLaGIGWiwqhFMAg4r0HD/vzq
         BEXFyK69yCa9nIGQ1HJ+VybHR3qhFyVRLoa0UXvjmZ/66/71sMufQrX79R3jXIZkuye5
         9r3ltvkTeQcnynee6LOsSMvUQmt2rg0H7Hyky1IqrQhmE8+loqOXkLvhTSWzgHud5Jf3
         D+7vIhYcC+w7O2EhIyH5NbNWOx6hB0lphsE1K2xGY2/k/AJlnjA0yGdrbiihi/X6Lln6
         AQ3ipfIuwcaXNj5Ul4M4g2frG6RdAp81ZYhai7KCyZRYgamhRQzwKmQbXYPtdZTeOvDs
         r0RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CWNgNfzUCSh/G2d5uhrXTyqZyH2sX5sogtnqRYbuI1s=;
        b=Ytg6ZoQKnf0gQ6EGyfgaYXyd8PIzszw9SWYHuWa5Bta/NYs/9kbtQ++FMZK8BAZHHh
         nb/Ch/b9vxTLv3hvyu0lApQoYM038lTG1ReiRbPukrEH4trI1mUpyN52PeKrvCuc52bc
         o40lXd3CP8d9ncypMU6jrOs/5dKo2mS1OjdYn2t+mMqj9/luh1cZ1NoyhpYrTaCwtnAz
         KtyO9ZtYK6z696fazNRr0zH5y3TmB8q5H0C44tGb/NFs3A5n4SthCfGKbZzqIZSPcrwX
         ABLEdOGAU8Vj5y6hT4W6jrNqQfFubLMqTBNctaUqIiXpXcqwVBNEOVqgAr8Q384WGne5
         SREw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FRuz+Jbg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05620a284b00b0069fbc0a454dsi2809795qkp.127.2022.05.06.11.21.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:21:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FRuz+Jbg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2Zb-0004Sn-C0
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IW-00063x-3S
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:24 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:46604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IT-0003ty-JZ
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:03:23 -0400
Received: by mail-oi1-x22d.google.com with SMTP id q8so8277255oif.13
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CWNgNfzUCSh/G2d5uhrXTyqZyH2sX5sogtnqRYbuI1s=;
 b=FRuz+JbgpPsLrYgiUxEgipO9c0Y6osor3Ociv3saDj5daaAEqV3RPqSHn3XyNwEEaV
 APDovkEXfnI/hL15/8GBF9l0I8qZB68TTl7BcWE9EvCNt+w/cQNHt36J3nDjZBLf7mdJ
 b4vJQtCM0eyPAwNCBcMOdGONxsw57wiJVxcZn5fZLHyU40W5/Ek/2PbamKOy5FsIgFfb
 VEnsoOmhwAKh06A/0MDNp4/HKmtC/rryLIfF6VzJdKa9Va2O+9LgiWJqZMajeps3gaD+
 UHR6NXehc6A1NzKOPiP6rswBhAORGg9cSCt3hMPKPkD1MyBAD6UO+4o0E3bqK4Lor6dv
 20WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CWNgNfzUCSh/G2d5uhrXTyqZyH2sX5sogtnqRYbuI1s=;
 b=VzBqhQjTeUX2hb6Z8+JfZaIYzzHgMPUcYA8VwyULDZfaomsU8YqrnFEShXwWGvEx/q
 dXgN8TdrrjW/LQYotT3yaoLID/tEHqdoVI/XDLvNPSIjEAtRx6DaleMWbLsyBF2UxJH7
 g2us4Yrm3LPlaGKD40H4AuNubTkt6qU2qZrzebrfPTmJylhG+ubqOh1P3xAu8T2yAko5
 eVzxleVyefQ14mCUf4SOqYmuCa8IhT2sv6ZuOMGR30EkY8g4OgqBeca1EBrrrIZmdORY
 4hZIMKuUoWwptmA0kPTkwNcikZWy/g90LMkyTIbg4XMhtYFSQBylM7Y8hhooNeW3xQIG
 ZM+A==
X-Gm-Message-State: AOAM532iEH/02aJ+WRcbJfq6Iojc+gjRPeJiJFDy+utgtz8WsxWhpvpM
 lYxVYyEwmxIG6owrBVNNAtNbvoPSsvJUGXch
X-Received: by 2002:a05:6808:238a:b0:326:955e:f21 with SMTP id
 bp10-20020a056808238a00b00326955e0f21mr1531913oib.118.1651860198713; 
 Fri, 06 May 2022 11:03:18 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 20/24] target/arm: Enable FEAT_CSV2_2 for -cpu max
Date: Fri,  6 May 2022 13:02:38 -0500
Message-Id: <20220506180242.216785-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ujQhGdcdkHRB

There is no branch prediction in TCG, therefore there is no
need to actually include the context number into the predictor.
Therefore all we need to do is add the state for SCXTNUM_ELx.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst; clear CSV2_FRAC; use decimal; tidy access_scxtnum.
v3: Rely on EL3-no-EL2 squashing during registration.
v5: Set SCTLR_EL1.TSCXT at user-only startup.
---
 docs/system/arm/emulation.rst |  3 ++
 target/arm/cpu.h              | 16 +++++++++
 target/arm/cpu.c              |  5 +++
 target/arm/cpu64.c            |  3 +-
 target/arm/helper.c           | 61 ++++++++++++++++++++++++++++++++++-
 5 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b2a3e2a437..9765ee3eaf 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -13,6 +13,9 @@ the following architecture extensions:
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
 - FEAT_CSV2 (Cache speculation variant 2)
+- FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
+- FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
+- FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index aade9237bd..18ca61e8e2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -688,6 +688,8 @@ typedef struct CPUArchState {
         ARMPACKey apdb;
         ARMPACKey apga;
     } keys;
+
+    uint64_t scxtnum_el[4];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
@@ -1211,6 +1213,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_WXN     (1U << 19)
 #define SCTLR_ST      (1U << 20) /* up to ??, RAZ in v6 */
 #define SCTLR_UWXN    (1U << 20) /* v7 onward, AArch32 only */
+#define SCTLR_TSCXT   (1U << 20) /* FEAT_CSV2_1p2, AArch64 only */
 #define SCTLR_FI      (1U << 21) /* up to v7, v8 RES0 */
 #define SCTLR_IESB    (1U << 21) /* v8.2-IESB, AArch64 only */
 #define SCTLR_U       (1U << 22) /* up to v6, RAO in v7 */
@@ -4022,6 +4025,19 @@ static inline bool isar_feature_aa64_dit(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, DIT) != 0;
 }
 
+static inline bool isar_feature_aa64_scxtnum(const ARMISARegisters *id)
+{
+    int key = FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, CSV2);
+    if (key >= 2) {
+        return true;      /* FEAT_CSV2_2 */
+    }
+    if (key == 1) {
+        key = FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, CSV2_FRAC);
+        return key >= 2;  /* FEAT_CSV2_1p2 */
+    }
+    return false;
+}
+
 static inline bool isar_feature_aa64_ssbs(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SSBS) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 652a84cf84..59df597e05 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -230,6 +230,11 @@ static void arm_cpu_reset(DeviceState *dev)
              */
             env->cp15.gcr_el1 = 0x1ffff;
         }
+        /*
+         * Disable access to SCXTNUM_EL0 from CSV2_1p2.
+         * This is not yet exposed from the Linux kernel in any way.
+         */
+        env->cp15.sctlr_el[1] |= SCTLR_TSCXT;
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 25fe74f928..07b44a62be 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -748,7 +748,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
-    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 2);      /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
@@ -760,6 +760,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
+    t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4857d2dbb8..432bd81919 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1770,6 +1770,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= SCR_ATA;
         }
+        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+            valid_mask |= SCR_ENSCXT;
+        }
     } else {
         valid_mask &= ~(SCR_RW | SCR_ST);
         if (cpu_isar_feature(aa32_ras, cpu)) {
@@ -5149,6 +5152,9 @@ static void do_hcr_write(CPUARMState *env, uint64_t value, uint64_t valid_mask)
         if (cpu_isar_feature(aa64_mte, cpu)) {
             valid_mask |= HCR_ATA | HCR_DCT | HCR_TID5;
         }
+        if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+            valid_mask |= HCR_ENSCXT;
+        }
     }
 
     /* Clear RES0 bits.  */
@@ -5800,6 +5806,10 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
           "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
 
+        { K(3, 0, 13, 0, 7), K(3, 4, 13, 0, 7), K(3, 5, 13, 0, 7),
+          "SCXTNUM_EL1", "SCXTNUM_EL2", "SCXTNUM_EL12",
+          isar_feature_aa64_scxtnum },
+
         /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
         /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
     };
@@ -7223,7 +7233,52 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     },
 };
 
-#endif
+static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
+                                     bool isread)
+{
+    uint64_t hcr = arm_hcr_el2_eff(env);
+    int el = arm_current_el(env);
+
+    if (el == 0 && !((hcr & HCR_E2H) && (hcr & HCR_TGE))) {
+        if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
+            if (hcr & HCR_TGE) {
+                return CP_ACCESS_TRAP_EL2;
+            }
+            return CP_ACCESS_TRAP;
+        }
+    } else if (el < 2 && (env->cp15.sctlr_el[2] & SCTLR_TSCXT)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 2 && arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ENSCXT)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static const ARMCPRegInfo scxtnum_reginfo[] = {
+    { .name = "SCXTNUM_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL0_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[0]) },
+    { .name = "SCXTNUM_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL1_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[1]) },
+    { .name = "SCXTNUM_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL2_RW, .accessfn = access_scxtnum,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[2]) },
+    { .name = "SCXTNUM_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 13, .crm = 0, .opc2 = 7,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, scxtnum_el[3]) },
+};
+#endif /* TARGET_AARCH64 */
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
@@ -8365,6 +8420,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
         define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
+
+    if (cpu_isar_feature(aa64_scxtnum, cpu)) {
+        define_arm_cp_regs(cpu, scxtnum_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
-- 
2.34.1

