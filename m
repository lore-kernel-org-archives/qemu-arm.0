Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4234894lfb;
        Tue, 8 Dec 2020 10:04:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9cf6UH2xtK2kPPQlHNw7rvSDPT5IozPJeF5uv0QjdtXYxhJQZQEgBmqu1PCY/Uh1FcC4M
X-Received: by 2002:a25:dc8d:: with SMTP id y135mr31231698ybe.175.1607450698411;
        Tue, 08 Dec 2020 10:04:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607450698; cv=none;
        d=google.com; s=arc-20160816;
        b=rMOziGbBez80tvVJYRSegNuHcxG7kqMOR66WjGcUmR8b4R4RetoirU7us07ZcEIvbP
         iSlBbKOOz3l+Ly4g4zLqM4Vg6JN+12GQYfVjifrQjb64TqvU3uvanOQmVLkO2m8vZSUi
         67/H8gbjkrBD0xSTv+ZPDndYsjp99u2sURYS1bugMcgtW4MtXBIPqmGMFdeOVZFFggDB
         EOafZxqki1xC8sBP2Ps0fD+R9qWm9LV2S7gtFLQmK9SMkBsuRlKOYhNZJ2YS92a9nk6u
         A51MskVuEwJAt6CWM4HLX3cJ/JcttPWQBAgERni7CFKmemO4i50Cz4geKdXtecGgNYuV
         1FyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MdDu37ss80QY7DCisG0r9GlSmZqYdahSNVKXZieNIjo=;
        b=KWBgpmVX9N7Ax3J9V9RAyt19C1qBpNSo0iSHzYcnGyS2p34rSB5panGZromRkhyvZd
         565npR0Nd8nIM9aw1QRvjp0xG/e7vBnQkLcmecKsR+vQgPlgMfbM2ljaIB3QnIqFyHTW
         SnzCK9G35WwT4Ny8/Y38eflY91UnEP6V/f1RCBOTjMk5Flr3IuPC4nlBfSSi1akroTrB
         gZyR2upBXiCo9D8vAej5vOW8GtYkUgtgx9o6sDO0Po0hqxs1Wwh1xw2H9/35uf6xz8T1
         RecDjFkvJ92FXwiDPUK30Eu3phR1of6DOeqss7plIx+OzAMM8IKmvVmBDSnPLOOvHURY
         FZbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OD716RSD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si20487934ybg.360.2020.12.08.10.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OD716RSD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhM9-0001O8-PB
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIm-0007SU-0n
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:28 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIj-0006KO-QD
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:27 -0500
Received: by mail-oi1-x243.google.com with SMTP id p126so20306143oif.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MdDu37ss80QY7DCisG0r9GlSmZqYdahSNVKXZieNIjo=;
 b=OD716RSDs5Hl3rpUhzwnedKSPfBYZNEY2IcFOSPsmq1Z2wF7tjda0u3+rJ5E8YCwCn
 ObxrPgr5PQgavHRyK6gO3IerfWyXOkAHRPZ87ubktDhjnMy0NycgiCYElt+C75SbCvAt
 nUYrry7jQHVtN+GZif0uPe7qGE4dLPrKDd4aitX1emYtugDsqS3j7A2RnFYt+aHomuqG
 w9ChWVeJkGKUwUxS7RA3I7w2zGBGIkYtBsTrfytjJjPPys40r1VyYm79gSEPb1J26taU
 GWKWazWOH76GdoDVYoNb4BgX0USHLVHjxnpZX2rFwPv1ovEdyh1z4W4HUF1HDo5hoHF4
 XUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MdDu37ss80QY7DCisG0r9GlSmZqYdahSNVKXZieNIjo=;
 b=MFFU3EX8LouaOjrQpzdzvZPUXCkd5kUrZGM8lpuNzUS8tJ1SMluIkzmyCunWkZx+Ph
 +tWGqM/67TeJVQBnalIFggho7qqPZ+coFt7/jaKA4vOWq5ELXcT66km4UMaLPyqkUmgF
 0Uw1d0aJkKI4zUq31USbY2xoe1U9tfJE61QS0ZdUdN+x2+Nby0SVkMkbp41APgS5BKD6
 uRp1usPDr8pxnFko59+ghV4TxEjddJENBfOivXOG7uheTlbtZdZ/D5uQuuTtIj4EKmAx
 VX2ikYY04k4WNdZ04EPb3dDPCd306XdaVadslRsTIvjvMWbtRKrJ3D3H5uLYYuRU4lB+
 Sz8w==
X-Gm-Message-State: AOAM533bltMGRf8bcyI6tmMu8zT50nZejk0k7RyQjCU3S0XsK4su3JCt
 uk6SsyPQmREottJz1m95ALPChReAoD7sinlZ
X-Received: by 2002:aca:f289:: with SMTP id q131mr3589855oih.159.1607450483692; 
 Tue, 08 Dec 2020 10:01:23 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/24] target/arm: Add ALIGN_MEM to TBFLAG_ANY
Date: Tue,  8 Dec 2020 12:00:56 -0600
Message-Id: <20201208180118.157911-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uAf1QQjs9IQ7

Use this to signal when memory access alignment is required.
This value comes from the CCR register for M-profile, and
from the SCTLR register for A-profile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 20 +++++++++++---------
 target/arm/translate.h |  2 ++
 target/arm/helper.c    | 19 +++++++++++++++++--
 target/arm/translate.c |  7 +++----
 4 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e5514c8286..e074055a94 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3220,15 +3220,15 @@ typedef ARMCPU ArchCPU;
  * We put flags which are shared between 32 and 64 bit mode at the top
  * of the word, and flags which apply to only one mode at the bottom.
  *
- *  31          20    18    14          9              0
- * +--------------+-----+-----+----------+--------------+
- * |              |     |   TBFLAG_A32   |              |
- * |              |     +-----+----------+  TBFLAG_AM32 |
- * |  TBFLAG_ANY  |           |TBFLAG_M32|              |
- * |              +-----------+----------+--------------|
- * |              |            TBFLAG_A64               |
- * +--------------+-------------------------------------+
- *  31          20                                     0
+ *  31          19  18    14          9              0
+ * +--------------+---+-----+----------+--------------+
+ * |              |   |   TBFLAG_A32   |              |
+ * |              |   +-----+----------+  TBFLAG_AM32 |
+ * |  TBFLAG_ANY  |         |TBFLAG_M32|              |
+ * |              +---------+----------+--------------|
+ * |              |          TBFLAG_A64               |
+ * +--------------+-----------------------------------+
+ *  31          19                                   0
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
@@ -3241,6 +3241,8 @@ FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
 FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
 /* For A-profile only, target EL for debug exceptions.  */
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
+/* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
+FIELD(TBFLAG_ANY, ALIGN_MEM, 19, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 423b0e08df..fb66b4d8a0 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -87,6 +87,8 @@ typedef struct DisasContext {
     bool bt;
     /* True if any CP15 access is trapped by HSTR_EL2 */
     bool hstr_active;
+    /* True if memory operations require alignment */
+    bool align_mem;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 38cd35c049..a5b237ac92 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12775,6 +12775,12 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
     uint32_t flags = 0;
+    uint32_t ccr = env->v7m.ccr[env->v7m.secure];
+
+    /* Without HaveMainExt, CCR.UNALIGN_TRP is RES1. */
+    if (ccr & R_V7M_CCR_UNALIGN_TRP_MASK) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, ALIGN_MEM, 1);
+    }
 
     if (arm_v7m_is_handler_mode(env)) {
         flags = FIELD_DP32(flags, TBFLAG_M32, HANDLER, 1);
@@ -12787,7 +12793,7 @@ static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
      */
     if (arm_feature(env, ARM_FEATURE_V8) &&
         !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
-          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
         flags = FIELD_DP32(flags, TBFLAG_M32, STACKCHECK, 1);
     }
 
@@ -12807,12 +12813,17 @@ static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                    ARMMMUIdx mmu_idx)
 {
     uint32_t flags = rebuild_hflags_aprofile(env);
+    int el = arm_current_el(env);
+
+    if (arm_sctlr(env, el) & SCTLR_A) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, ALIGN_MEM, 1);
+    }
 
     if (arm_el_is_aa64(env, 1)) {
         flags = FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
     }
 
-    if (arm_current_el(env) < 2 && env->cp15.hstr_el2 &&
+    if (el < 2 && env->cp15.hstr_el2 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         flags = FIELD_DP32(flags, TBFLAG_A32, HSTR_ACTIVE, 1);
     }
@@ -12857,6 +12868,10 @@ static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     sctlr = regime_sctlr(env, stage1);
 
+    if (sctlr & SCTLR_A) {
+        flags = FIELD_DP32(flags, TBFLAG_ANY, ALIGN_MEM, 1);
+    }
+
     if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
         flags = FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 6d04ca3a8a..4bd93e66c8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -900,8 +900,7 @@ static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
 {
     TCGv addr;
 
-    if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        !arm_dc_feature(s, ARM_FEATURE_M_MAIN)) {
+    if (s->align_mem) {
         opc |= MO_ALIGN;
     }
 
@@ -915,8 +914,7 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
 {
     TCGv addr;
 
-    if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        !arm_dc_feature(s, ARM_FEATURE_M_MAIN)) {
+    if (s->align_mem) {
         opc |= MO_ALIGN;
     }
 
@@ -8779,6 +8777,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->user = (dc->current_el == 0);
 #endif
     dc->fp_excp_el = FIELD_EX32(tb_flags, TBFLAG_ANY, FPEXC_EL);
+    dc->align_mem = FIELD_EX32(tb_flags, TBFLAG_ANY, ALIGN_MEM);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.25.1

