Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp105055wrp;
        Mon, 11 Feb 2019 15:56:17 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY0qW2tpKJ/gnVNdq4lEgom3IwIxuX13qK1koDharcPaBqAwEKSEo9daoKybLY7S59rW6lI
X-Received: by 2002:a25:6908:: with SMTP id e8mr681113ybc.324.1549929377319;
        Mon, 11 Feb 2019 15:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929377; cv=none;
        d=google.com; s=arc-20160816;
        b=x1iJLHUErnej5gbvzkG7D4HHAr7nFoVs6VnjB22aKOSdExixCbmwHngDghT61N32zq
         dmGsNLZiREVXZm3PHzX4h8tjztlhZr0O8MwcXvtRg8u4JZlObWuU55A1D2gdynvIcBe4
         Xu22S06iTPZGAidS1fkhRlU8fwZoWGJ9owhMzNH2PsHfBN9Ly0Z5Cj3U/iDSlLebXQMj
         hRQcppvQ+yFl78Ar2OKoX5C7W5/T+7NkIQbFn6PIaNraZCQfY3oH4QxAQYj5XYTNxGr6
         nHR71qe064wjy6OM6a/m+6PtwqqrHHmpoXZJ1m0+RMFlxw9HZJZnwgrVz09GGqj4Jf3B
         6IpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=jgJ81jFo+57U4jyJfgDBV2LiNCuhVeUeG3KxMuDrGGw=;
        b=Ot99Jshcl/jUNujbXKOklI6v/5R01EKgxFixglwMpnM2U5mQY06+n2TAV0A+zN7JCx
         PRTgiulOTZQTTJO2uNgeIkK6BHZalGMAzrh32bX9dRtBY1rjbP2W2Oh80DtsDxSR3ZwF
         r2v9fzQz4XExqrCvadx0zYP+asA5VchkWjNeQ4btWEwHci4Vpe2HxgimcEv/umwp5Kt0
         Lu0Ir4B7V9ibk/44DwBTJlM2JXZXZFI2FQ3o2cMdh760UPcWCqjRsORnvaL/8t13s9dB
         q5P+qFcI2d8qgkzTky1mZLm329vAdD9ACIk4tw0uhLGw0ZS2no+fQqc3t2x4Pv5FOISa
         Rk8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ahycaRHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206si6784808ywo.173.2019.02.11.15.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 15:56:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ahycaRHg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLQu-0007dI-Nd
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 18:56:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNw-000560-LH
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLNs-0004Mo-GZ
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:10 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLNs-0004LB-3W
	for qemu-arm@nongnu.org; Mon, 11 Feb 2019 18:53:08 -0500
Received: by mail-pf1-x441.google.com with SMTP id z9so344363pfi.2
	for <qemu-arm@nongnu.org>; Mon, 11 Feb 2019 15:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jgJ81jFo+57U4jyJfgDBV2LiNCuhVeUeG3KxMuDrGGw=;
	b=ahycaRHgNxdWoP+wdfzDaphNLCsZq3mrvMxJ/GqKiTseLTIbTIeJ6ZOoEc/kcPpNvG
	Tvdgqur7SYU1OMfu41TWmbIs4I7t/+TyOPHdukyfXv86AxtC743LbVZn6ZaTN17XlW06
	WFgh4czxuF/emNUczJtboIXs66vYNaYV8s6rA1zM4BagrBF8Ofdv17UiZ19IFNjSJq2g
	mrmho3UaUx3xtWHgniKV1s8JXhqeHmSPoSZ3qbDKaS4WHxZBk/63pjzI0EzH+J4kCVyH
	yImIdk1Em+EOyejrkXT38ru+zQqwn483pzFKPZnUoHdXXbrWj5pTz6RHgisv04FxFLh2
	3L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jgJ81jFo+57U4jyJfgDBV2LiNCuhVeUeG3KxMuDrGGw=;
	b=FW6L959GbAGJKc0AumZjy2yiuLZgFAPE/StWEoVZPFReNIBpzzlCT8BXO+jQ2oEohJ
	i/IybwHwRlZD+plSNsqOUrRsDZXMuTp3MODopu4fxSxvoFIc7tl4O3M8YeeePNk8nJDf
	LvbM+VKRHxLYfrIooHHH+okNulwjqsxyzvCWAFAtThznCEJMC9v5AiAv8eYfbUfZL2+Z
	2xuIiJEZg9JvB43W+6UJm4x1VrBP65k/LSqkdm0TZPrcjUPUYcI8eagUpN9oz3r7CrUJ
	y9/OHfRjRuDiU84eVHVxCC819Xw6XJzbEhmR9Q5FD4FRI5ABGa07QCSagMb8ME+2G5Fv
	B8bw==
X-Gm-Message-State: AHQUAuar3bJ2zO4BFwHQC0atfDcdjIxP+Le3RC0z/i3rNx6oWQP4f/k7
	Z2b+tHVN2HqkCQQLmIKivZcC6w==
X-Received: by 2002:a63:2501:: with SMTP id l1mr843637pgl.144.1549929186841;
	Mon, 11 Feb 2019 15:53:06 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:34 -0800
Message-Id: <20190211235258.542-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PATCH v3 04/28] target/arm: Add MTE_ACTIVE to tb_flags
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OBbSVjLmtHhW

When MTE is fully enabled, i.e. access to tags are enabled and
tag checks affect the PE, then arrange to perform the check
while stripping the TBI.

The check is not yet implemented, just the plumbing to that point.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Clean TBI bits exactly.
    Fix license to lgpl 2.1.
v3: Remove stub helper_mte_check; moved to a later patch.
---
 target/arm/cpu.h           | 12 +++++++++
 target/arm/internals.h     | 18 ++++++++++++++
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        | 51 ++++++++++++++++++++++++++++++--------
 target/arm/translate-a64.c |  1 +
 5 files changed, 73 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 20be9fb53a..2776df6981 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1215,6 +1215,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
+#define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
@@ -3071,6 +3072,7 @@ FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
 FIELD(TBFLAG_A64, BTYPE, 10, 2)
 FIELD(TBFLAG_A64, TBID, 12, 2)
+FIELD(TBFLAG_A64, MTE_ACTIVE, 14, 1)
 
 static inline bool bswap_code(bool sctlr_b)
 {
@@ -3361,6 +3363,16 @@ static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
 }
 
+static inline bool isar_feature_aa64_mte_insn_reg(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) != 0;
+}
+
+static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 587a1ddf58..6c018e773c 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -983,4 +983,22 @@ static inline int exception_target_el(CPUARMState *env)
     return target_el;
 }
 
+/* Determine if allocation tags are available.  */
+static inline bool allocation_tag_access_enabled(CPUARMState *env, int el,
+                                                 uint64_t sctlr)
+{
+    if (el < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ATA)) {
+        return false;
+    }
+    if (el < 2
+        && arm_feature(env, ARM_FEATURE_EL2)
+        && !(arm_hcr_el2_eff(env) & HCR_ATA)) {
+        return false;
+    }
+    sctlr &= (el == 0 ? SCTLR_ATA0 : SCTLR_ATA);
+    return sctlr != 0;
+}
+
 #endif
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 33af50a13f..5a101e1c6d 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -70,6 +70,8 @@ typedef struct DisasContext {
     bool ss_same_el;
     /* True if v8.3-PAuth is active.  */
     bool pauth_active;
+    /* True if v8.5-MTE tag checks affect the PE.  */
+    bool mte_active;
     /* True with v8.5-BTI and SCTLR_ELx.BT* set.  */
     bool bt;
     /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d4abbb5076..e73bdbf041 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1862,6 +1862,9 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         valid_mask |= SCR_API | SCR_APK;
     }
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        valid_mask |= SCR_ATA;
+    }
 
     /* Clear all-context RES0 bits.  */
     value &= valid_mask;
@@ -4056,22 +4059,31 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
 
-    if (raw_read(env, ri) == value) {
-        /* Skip the TLB flush if nothing actually changed; Linux likes
-         * to do a lot of pointless SCTLR writes.
-         */
-        return;
-    }
-
     if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
         /* M bit is RAZ/WI for PMSA with no MPU implemented */
         value &= ~SCTLR_M;
     }
 
-    raw_write(env, ri, value);
+    if (!cpu_isar_feature(aa64_mte, cpu)) {
+        if (ri->opc1 == 6) { /* SCTLR_EL3 */
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
+        } else {
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
+                       SCTLR_ATA0 | SCTLR_ATA);
+        }
+    }
+
     /* ??? Lots of these bits are not implemented.  */
-    /* This may enable/disable the MMU, so do a TLB flush.  */
-    tlb_flush(CPU(cpu));
+
+    if (raw_read(env, ri) != value) {
+        /*
+         * This may enable/disable the MMU, so do a TLB flush.
+         * Skip the TLB flush if nothing actually changed;
+         * Linux likes to do a lot of pointless SCTLR writes.
+         */
+        raw_write(env, ri, value);
+        tlb_flush(CPU(cpu));
+    }
 }
 
 static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -4564,6 +4576,9 @@ static void hcr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
     if (cpu_isar_feature(aa64_pauth, cpu)) {
         valid_mask |= HCR_API | HCR_APK;
     }
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        valid_mask |= HCR_ATA;
+    }
 
     /* Clear RES0 bits.  */
     value &= valid_mask;
@@ -13756,6 +13771,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     if (is_a64(env)) {
         ARMCPU *cpu = arm_env_get_cpu(env);
         uint64_t sctlr;
+        int tbid;
 
         *pc = env->pc;
         flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
@@ -13764,7 +13780,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         {
             ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
             ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
-            int tbii, tbid;
+            int tbii;
 
             /* FIXME: ARMv8.1-VHE S2 translation regime.  */
             if (regime_el(env, stage1) < 2) {
@@ -13817,6 +13833,19 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
             }
             flags = FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
         }
+
+        /*
+         * If MTE is enabled, and tag checks affect the PE,
+         * then we check the tag as we strip the TBI field.
+         * Note that if TBI is disabled, all accesses are unchecked.
+         */
+        if (tbid
+            && cpu_isar_feature(aa64_mte, cpu)
+            && allocation_tag_access_enabled(env, current_el, sctlr)
+            && !(env->pstate & PSTATE_TCO)
+            && (sctlr & (current_el == 0 ? SCTLR_TCF0 : SCTLR_TCF))) {
+            flags = FIELD_DP32(flags, TBFLAG_A64, MTE_ACTIVE, 1);
+        }
     } else {
         *pc = env->regs[15];
         flags = FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ba139bba26..3950067b79 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14041,6 +14041,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->pauth_active = FIELD_EX32(tb_flags, TBFLAG_A64, PAUTH_ACTIVE);
     dc->bt = FIELD_EX32(tb_flags, TBFLAG_A64, BT);
     dc->btype = FIELD_EX32(tb_flags, TBFLAG_A64, BTYPE);
+    dc->mte_active = FIELD_EX32(tb_flags, TBFLAG_A64, MTE_ACTIVE);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.17.2

