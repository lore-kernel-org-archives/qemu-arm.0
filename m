Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2530635wrt;
        Sun, 13 Jan 2019 17:12:12 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5A3Tu1/6QCQGHRFEXe9chzcBTgThuyT0RNwSnWnIQxRqa1+O6nnOCRtYIT8e4HIkVgs+uu
X-Received: by 2002:a1c:7ec4:: with SMTP id z187mr9603158wmc.43.1547428332393;
        Sun, 13 Jan 2019 17:12:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547428332; cv=none;
        d=google.com; s=arc-20160816;
        b=T7cjCkbOOv76TU2QHMYCn2keXx1tToUjdv7DJub0O4aVKfT+/dxiJTvMEm7gAhkRbA
         QPLcizJxxffFTTSLaBQIEW7PPe1cy4Pw9GxdiPPehlpcIGKJ6bRJpEZJvTnkoPDwWDkc
         b4EGsAE1wfWoULNFUwWGg5632V/QvBXjpaI9YA/ZYd6rmTWlv83edbJlahkRGes7qn2w
         0gXAUsazeIRx53puYhLgNcT93SJA//PzF/a4wnfC/i3UeEfDAZH69QD62BguWiIVfs72
         UUEkNN83jT+A1k1lU1ta8yBHy5ebV8HzRA0YHLzkIf1ozEyckud/caUaZuNgwgujLZ0b
         fkcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=GKYYcx9lSQNdeFnnHFD9RFAln0nkgQrJyU8WcGcjUB4=;
        b=0JB5lS/w+a7VmxxyUe41Vrk6qtf/PmjinrLAz2COlmTppjbrvM8gx0cUAgTjOAZZ8n
         dwZx1G4msERbxxCrpqr8Rcapwod6UlgBxFR3CA/Qk1lonk6sn9BvVL/9XdaScmWduzyj
         CUIwkU4DGENf3ZOJI7UAsXwSyWZzDGHHf1fFXssdCfc6IOJBAbiKMf2Ls1RIch5QEBT5
         R4tmNumT8+rvPAkYKj7wgFZ9PyJL3OldjMVB1dfaGYZQwgJ+bJzz9aD7GkO9zzvmTBTY
         s2rJ9nTnLm47QyzAWell7w7lw4H/qIU0612dRdVYDagyg0Y2Xm4eZextE0yoRUqWHfca
         gDDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aU1oABrw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si50128396wrv.45.2019.01.13.17.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Jan 2019 17:12:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aU1oABrw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1giqnT-0005Sv-9b
	for alex.bennee@linaro.org; Sun, 13 Jan 2019 20:12:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqmx-0005Qm-63
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1giqmv-0000jl-Dm
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:39 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33754)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1giqmv-0000jB-69
	for qemu-devel@nongnu.org; Sun, 13 Jan 2019 20:11:37 -0500
Received: by mail-pf1-x431.google.com with SMTP id c123so9556077pfb.0
	for <qemu-devel@nongnu.org>; Sun, 13 Jan 2019 17:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GKYYcx9lSQNdeFnnHFD9RFAln0nkgQrJyU8WcGcjUB4=;
	b=aU1oABrwydreQQTjx40Yb83hek+ISO4l0JipnPnTpP7mR5az/F58sRoQ1AgfppwJoD
	C3lBrzOrNKxBA8EUagRvnGM+E+TeOAvtRlWg80/PsyZ/tKnXRd5BbM4AGLAHIZCSX7sr
	TeLOubu03fNB1MSV2S3NiSU1H0/z95W5AUbqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GKYYcx9lSQNdeFnnHFD9RFAln0nkgQrJyU8WcGcjUB4=;
	b=opD1Ok5Le2CwajAMXTky9sk1hpMh5gzWVz61eUCOvLKh4U7i3O08dcTvJYf0Zn7FwD
	AGHGCgG/1hI0x9Pn1b+20OMSSw5rHOTona/5FAsS9/U4Suv32hzM6VlfQA2Ja4FyA0Dj
	hcSQzfk4ujstzRlYusIx3mEwJoiFEw76Bl7wOyIjIAK9EPOWSggZ4LF0EmLPwy15d2O1
	aQHVrHEpqHzDLvABqFIh8mk+1K0Zl2ef9pIsVM106PLs3lbTM+eGYtmaWDPYPh1IKMWK
	DeOs8KGtgAA189gczyQKSgAlE4/QSTcUeOKgxwiM1ENbgNcLUvWwkHMDZ5ixQtuWEHK1
	FGaQ==
X-Gm-Message-State: AJcUukf7giZ6XFLJfuLKBRY2aAB1vC+DUWeyJggFuhzA8kLRIa60lDdo
	p+k9nkt4Y2JZ5VKSqCCMPoQUkwZk5B3vAg==
X-Received: by 2002:a62:da5a:: with SMTP id w26mr23334590pfl.106.1547428295676;
	Sun, 13 Jan 2019 17:11:35 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:1064:7600:4085:6ae6:1bde:1c45])
	by smtp.gmail.com with ESMTPSA id
	5sm159602229pfz.149.2019.01.13.17.11.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 13 Jan 2019 17:11:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 12:11:06 +1100
Message-Id: <20190114011122.5995-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::431
Subject: [Qemu-devel] [PATCH 01/17] target/arm: Add MTE_ACTIVE to tb_flags
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I3Km5XDST886

When MTE is fully enabled, i.e. access to tags are enabled and
tag checks affect the PE, then arrange to perform the check
while stripping the TBI.

The check is not yet implemented, just the plumbing to that point.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 13 +++++++++++
 target/arm/helper-a64.h    |  2 ++
 target/arm/internals.h     | 18 +++++++++++++++
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        | 45 ++++++++++++++++++++++++++++----------
 target/arm/mte_helper.c    | 32 +++++++++++++++++++++++++++
 target/arm/translate-a64.c |  9 +++++++-
 target/arm/Makefile.objs   |  2 +-
 8 files changed, 110 insertions(+), 13 deletions(-)
 create mode 100644 target/arm/mte_helper.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f2ff52f287..22163c9c3f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1164,6 +1164,7 @@ void pmccntr_sync(CPUARMState *env);
 #define PSTATE_BTYPE (3U << 10)
 #define PSTATE_IL (1U << 20)
 #define PSTATE_SS (1U << 21)
+#define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
@@ -1640,6 +1641,7 @@ FIELD(ID_AA64PFR0, SVE, 32, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
 FIELD(ID_AA64PFR1, SBSS, 4, 4)
+FIELD(ID_AA64PFR1, MTE, 8, 4)
 
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
@@ -3003,6 +3005,7 @@ FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
 FIELD(TBFLAG_A64, BTYPE, 10, 2)
 FIELD(TBFLAG_A64, TBID, 12, 2)
+FIELD(TBFLAG_A64, MTE_ACTIVE, 14, 1)
 
 static inline bool bswap_code(bool sctlr_b)
 {
@@ -3293,6 +3296,16 @@ static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
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
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index a915c1247f..fa4c371a47 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -102,3 +102,5 @@ DEF_HELPER_FLAGS_3(autda, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_3(autdb, TCG_CALL_NO_WG, i64, env, i64, i64)
 DEF_HELPER_FLAGS_2(xpaci, TCG_CALL_NO_RWG_SE, i64, env, i64)
 DEF_HELPER_FLAGS_2(xpacd, TCG_CALL_NO_RWG_SE, i64, env, i64)
+
+DEF_HELPER_FLAGS_2(mte_check, TCG_CALL_NO_WG, i64, env, i64)
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
index 6b7b639da5..038e52af4b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3465,22 +3465,31 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -13087,6 +13096,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     if (is_a64(env)) {
         ARMCPU *cpu = arm_env_get_cpu(env);
         uint64_t sctlr;
+        int tbid;
 
         *pc = env->pc;
         flags = FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
@@ -13095,7 +13105,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
         {
             ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
             ARMVAParameters p0 = aa64_va_parameters_both(env, 0, stage1);
-            int tbii, tbid;
+            int tbii;
 
             /* FIXME: ARMv8.1-VHE S2 translation regime.  */
             if (regime_el(env, stage1) < 2) {
@@ -13148,6 +13158,19 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
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
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
new file mode 100644
index 0000000000..a3226c44a4
--- /dev/null
+++ b/target/arm/mte_helper.c
@@ -0,0 +1,32 @@
+/*
+ * ARM v8.5-MemTag Operations
+ *
+ * Copyright (c) 2019 Linaro, Ltd.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/helper-proto.h"
+
+
+uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
+{
+    /* Only unchecked implemented so far.  */
+    return sextract64(ptr, 0, 55);
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ee6f71c98f..0286507bae 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -339,7 +339,13 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
 static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
-    gen_top_byte_ignore(s, clean, addr, s->tbid);
+
+    /* FIXME: SP+OFS is always unchecked.  */
+    if (s->tbid && s->mte_active) {
+        gen_helper_mte_check(clean, cpu_env, addr);
+    } else {
+        gen_top_byte_ignore(s, clean, addr, s->tbid);
+    }
     return clean;
 }
 
@@ -14000,6 +14006,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->pauth_active = FIELD_EX32(tb_flags, TBFLAG_A64, PAUTH_ACTIVE);
     dc->bt = FIELD_EX32(tb_flags, TBFLAG_A64, BT);
     dc->btype = FIELD_EX32(tb_flags, TBFLAG_A64, BTYPE);
+    dc->mte_active = FIELD_EX32(tb_flags, TBFLAG_A64, MTE_ACTIVE);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 1a4fc06448..c86cb1af5c 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -8,7 +8,7 @@ obj-y += translate.o op_helper.o helper.o cpu.o
 obj-y += neon_helper.o iwmmxt_helper.o vec_helper.o
 obj-y += gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
-obj-$(TARGET_AARCH64) += pauth_helper.o
+obj-$(TARGET_AARCH64) += pauth_helper.o mte_helper.o
 obj-y += crypto_helper.o
 obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
 
-- 
2.17.2

