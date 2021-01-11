Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2923897lfq;
        Mon, 11 Jan 2021 11:10:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNyX3gMYIte0Zgcz9h3JgifC0cwJmkZ7AuOhtbiRRvFNW24tJdGmNIbdTi3wWBkw2Oc8Cb
X-Received: by 2002:a25:d44:: with SMTP id 65mr1784748ybn.260.1610392248577;
        Mon, 11 Jan 2021 11:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610392248; cv=none;
        d=google.com; s=arc-20160816;
        b=FLwFkv4khQ01icMBvrMyK88ElGLj1uZDwEjfzd1rZGR1DWfjChW0km5K63Mi0x0Khi
         tBIWWpe3RHI71wRlNk7MImIk2NpYM61uCSyCFbuc4Ih3guuWmUq3jd3KDi1PoP2k67se
         VBVxQ9ple0Gfx8SOFBhTgY5DMG9fhwSexS4WrkE2as1nb5eCd0AU07j1MAg15Hx9zzDY
         6/6eMFFyoWyMCR7TZgT0lsGhqUJa065V+zQcYdZfAY0UJfDnQotQEE8T6WFbfAQrpS8t
         7eCaIEOMbuTnLaMkmhvzgm3yCYSjFCRdgav3nOZXXKa8UYI+p2j5COF5zkEEaaofh89D
         QFQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5Gp5YJhUdu7O2iWG1ZDTCi/OY2TUbd2kY+8E+Hd/FJ4=;
        b=qaEAAGwIQPzWpqxn96NPckcafW7PdHy8wfKEJQ6+r1XJ3BUcRFz7+p0PoRkwv4pj8M
         G1PvyJLDLn9PMcf/6z3a6g7EM+Pgocq64l3JxFUAQ3nd4UvyDclstQkwjBYEUR89xg/3
         36C3zJhqCJiXxv3MOJ858C17xLM3S0XarMUFnpNMDGf6boIRjZ9CWVqwcj/ixfucXP3M
         S8BHDSGY5WalcLtreN2Hn8ldIPwRkw/nfsnJDc82O1RDfa5MgsL+3s/6hwkOq2x7f4QE
         pCS1xamjyPEFH17wIfr1ko3NZhAZjLL4/o34l77Jh9aBCTHkZcCnMg5H3naETpFUXfrm
         6tlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hrwh+m3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si618429ybl.257.2021.01.11.11.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 11:10:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Hrwh+m3a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz2aV-0006JN-Ak
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 14:10:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rb-00062b-9F
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:35 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2RZ-0006Qh-Cy
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 14:01:34 -0500
Received: by mail-pj1-x102b.google.com with SMTP id y12so102542pji.1
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 11:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Gp5YJhUdu7O2iWG1ZDTCi/OY2TUbd2kY+8E+Hd/FJ4=;
 b=Hrwh+m3ahWF0A68aHzHCSsJcTJ2MdggXky1MWjQ8UbK/3xzqALsVjPcGEb6ua3AvAB
 mkEdcSaZFJI8+9YmuHmTtwWz5S55vTvRCH9MfmbMQ7El26sfzx1Gszl2WOItWlokFJkM
 efliDgDbuiJvMzT/CzUtCMDDTplqzw7Q0Sx1loMVYXRu0lXpZzsQJ28i5jdB9kEzCh3N
 Ab8GChSy/af0ly3xPFkw6o3AONctV2VgcnQ0kEm3kNxWZBVBk6b7s3z350QVihXBbXrb
 zUR/TZHkQkc5OIL3M3PF/+YdKl1QtFOHPMe9j6dMQtsnDUP7jOGHIsyRT2pR4KW6Tr9v
 wEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Gp5YJhUdu7O2iWG1ZDTCi/OY2TUbd2kY+8E+Hd/FJ4=;
 b=LvIteszH2Ms2HtrAowSpHCw8C0oxh3iqWmlpjIvo7cD2ThO6DSUxfY8XrNbaAHTTw5
 r5/oimS8qa87iPFsdGb++V/wAySJ8++nCgoXl9REMa48XwiqyqTaOD8FarUvJmM+AXlJ
 umda6/qK3pau7JzrXRHfznr8ponWn+Ch80uXrXT83a0iD6QEd6zbpEDDhLjzVe71Qocj
 G4DFdC8u0I0hnpsb8S413ZSI102vCDD3qHrhBXnBKT1dVdEKwPmg5uMHp5r8Az/wEeDT
 Exlm+rsyTsOYna0dU+JhwlR7Qul25UBlvykkfw+yZnGNwXP7VKcuI6eMkoXEOPkvXBgF
 9n8g==
X-Gm-Message-State: AOAM53159d1dpGkKwdolHL3HQFbRC8KTWVILbSpELzGMQbyw3kgHRPXP
 ovf9Gjxo/vmdnXo4O9EHl+hMbej817YckQ==
X-Received: by 2002:a17:90a:d70e:: with SMTP id y14mr288483pju.9.1610391692145; 
 Mon, 11 Jan 2021 11:01:32 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/30] target/arm: Add ALIGN_MEM to TBFLAG_ANY
Date: Mon, 11 Jan 2021 09:00:52 -1000
Message-Id: <20210111190113.303726-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iSAvUMy2xIb6

Use this to signal when memory access alignment is required.
This value comes from the CCR register for M-profile, and
from the SCTLR register for A-profile.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  2 ++
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        | 19 +++++++++++++++++--
 target/arm/translate-a64.c |  1 +
 target/arm/translate.c     |  7 +++----
 5 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index aa2f2d3a04..4adac2f193 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3284,6 +3284,8 @@ FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 /* For A-profile only, target EL for debug exceptions.  */
 FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
+/* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
+FIELD(TBFLAG_ANY, ALIGN_MEM, 12, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 50c2aba066..b185c14a03 100644
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
index 0d7c8817b6..fc38cc58aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12777,6 +12777,12 @@ static CPUARMTBFlags
 rebuild_hflags_m32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
 {
     CPUARMTBFlags flags = {};
+    uint32_t ccr = env->v7m.ccr[env->v7m.secure];
+
+    /* Without HaveMainExt, CCR.UNALIGN_TRP is RES1. */
+    if (ccr & R_V7M_CCR_UNALIGN_TRP_MASK) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
 
     if (arm_v7m_is_handler_mode(env)) {
         DP_TBFLAG_M32(flags, HANDLER, 1);
@@ -12789,7 +12795,7 @@ rebuild_hflags_m32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
      */
     if (arm_feature(env, ARM_FEATURE_V8) &&
         !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
-          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
+          (ccr & R_V7M_CCR_STKOFHFNMIGN_MASK))) {
         DP_TBFLAG_M32(flags, STACKCHECK, 1);
     }
 
@@ -12809,12 +12815,17 @@ static CPUARMTBFlags
 rebuild_hflags_a32(CPUARMState *env, int fp_el, ARMMMUIdx mmu_idx)
 {
     CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
+    int el = arm_current_el(env);
+
+    if (arm_sctlr(env, el) & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
 
     if (arm_el_is_aa64(env, 1)) {
         DP_TBFLAG_A32(flags, VFPEN, 1);
     }
 
-    if (arm_current_el(env) < 2 && env->cp15.hstr_el2 &&
+    if (el < 2 && env->cp15.hstr_el2 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
@@ -12859,6 +12870,10 @@ rebuild_hflags_a64(CPUARMState *env, int el, int fp_el, ARMMMUIdx mmu_idx)
 
     sctlr = regime_sctlr(env, stage1);
 
+    if (sctlr & SCTLR_A) {
+        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
+    }
+
     if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
         DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 010e81e0b4..69d401da21 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14712,6 +14712,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->user = (dc->current_el == 0);
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 189b2ee3cb..3fc058e8d0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -933,8 +933,7 @@ static void gen_aa32_ld_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
 {
     TCGv addr;
 
-    if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        !arm_dc_feature(s, ARM_FEATURE_M_MAIN)) {
+    if (s->align_mem) {
         opc |= MO_ALIGN;
     }
 
@@ -948,8 +947,7 @@ static void gen_aa32_st_i32(DisasContext *s, TCGv_i32 val, TCGv_i32 a32,
 {
     TCGv addr;
 
-    if (arm_dc_feature(s, ARM_FEATURE_M) &&
-        !arm_dc_feature(s, ARM_FEATURE_M_MAIN)) {
+    if (s->align_mem) {
         opc |= MO_ALIGN;
     }
 
@@ -8824,6 +8822,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->user = (dc->current_el == 0);
 #endif
     dc->fp_excp_el = EX_TBFLAG_ANY(tb_flags, FPEXC_EL);
+    dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-- 
2.25.1

