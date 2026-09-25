Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AE5C9832A
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:52:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADos-0008CK-Ty; Fri, 25 Sep 2026 17:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo8-0007lG-IY
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:22 -0400
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo2-0007l0-Le
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:13 -0400
Received: by mail-pz2-x0d.google.com with SMTP id
 d2e1a72fcca58-85469f20513so740224b3a.0
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373009; x=1790977809; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=tMmCze3sPkjcYyDerNEGCIJ6B0dT/d1kXK1wyuv2STI=;
 b=UBaEPMcR6brwWeQ72IchlW1/NeZeEHX9x9X5lB+fSCYFK2poxXC3TuESTTFZh5p4Ti
 GPtfv/5PbQ4pnCOMzBxJxfbvLO9wlbLhfTn2bFxIjbOjnXhFsIDFLIQQGMvP88Vb/DJd
 qX3DVz3sdw8KxnWE4ELOY01QI944ilLkESakXdX0SL6LfGwa8yOXXbHfbKPU3sHlbgKZ
 DAw8dhckubq9AKcl0xOjTGBrk2TrLlhbU6zCOXt+JOBov3NLB8W9NyWmfQt1/zV7OjXz
 X80UEosLAQg+p9kERFo9V9QplVX2CMd1bgAUVxemd4d2h2gAJe01EE8USh8UU7EkfmAC
 NQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373009; x=1790977809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tMmCze3sPkjcYyDerNEGCIJ6B0dT/d1kXK1wyuv2STI=;
 b=pgZJEEfz4GI9HYMFeEnQiFFUiKLljGYlJ0ILRT1+E6dljG/wkUHewzIVAfoFm1X9wz
 CvP5sHQISqGCfUO0ulesmN6IsTQkp9si4SFcKR+Qj9PocB+BjoTL6TT28HytnvlpZXe3
 2AexzwlrZB/4Iy1gnn14BQM4vMfxRxvVbllaLDndXrApCZQ9AGxpvL25WWMAv/Ie4ywk
 6UkvutSpFzStSXwc1437azn0oSxAoNyoDgzjLg2AXnYRQZBbXxVfSESQsdOyyDl4g12e
 JX7dsi8m81hpTTh7HDe4nqHqcEFXBQCIDgRN5sPSLcueWfhUxOjONuf29XFFCgm0BGS3
 2DIQ==
X-Gm-Message-State: AFuF++loTv4a7DoT67MZAin3vepJ6aYzS4E2DYXW6xPetxgGH6Wg1Ry/
 Xwz/+VSntzzkuN5n0+sQAOBZjYsDLgUeT8xCWCXZuP05plSALgLfBekmb/ad5v5ylbM=
X-Gm-Gg: AYBFou3D2TsAvZEeFK0/zm+xWPnalJRMpI1XYmOInAYy/C0Zual6musF/pDUmVn8m4A
 l4znyq2RHeSxRqaEnjUEmmG/Dc3Q2V00qrg4vdwEfYTOmbOszuYs0Gdz4CplEn/m1swnewLdCuJ
 0sBrVhq8MqWuwtNWbkolAepf4xggs02kS6rthLcBDgtXK/MLiV16j/FqAhABBSK6cblDH+1XRLo
 xMLSGviSORyX++3M7vMzomm0ny+T2MFD1hrmW/5zj9tDSBzEX/gLt0oWWmji57p8xycjheD0r3H
 np4jh6A9I2InHNz69iGUyZodrs5b5zvE3Y+oboEf0KeAIeS3okQu6WfKvR/UFY4GynUwfgW7CEO
 3yLGS2UBqXAkgTI2BFOe3wA1aVDb8jncVR1TOPDP9423LL7jHd3HnLAMqlrTcOeFG8S3RgqxZnx
 9pajM3iAf/IdXNl3d8lm7MOUS4JkVcnANpIoDcjh6TySznDTPysPgAudeqzCwkJRpiYr3+8q4m5
 ddSh0rbBP0GjEY54RxD7BSKs+5dkAM=
X-Received: by 2002:aa7:88ce:0:b0:874:32d1:d3d8 with SMTP id
 d2e1a72fcca58-87e99568188mr5692465b3a.21.1790373009056; 
 Fri, 25 Sep 2026 14:50:09 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 03/14] target/arm: Split out rebuild_hflags_common_aprofile
Date: Fri, 25 Sep 2026 14:49:53 -0700
Message-ID: <20260925215004.456336-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Alignment, FGT, and IL are common to a32 and a64, though the
latter comes from different places.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/hflags.c | 65 +++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 35 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index eb1aff91d5f..8da02ae1ecf 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -114,6 +114,24 @@ static void rebuild_hflags_common_32(CPUARMTBFlags *flags, CPUARMState *env)
     DP_TBFLAG_A32(*flags, NS, !access_secure_reg(env));
 }
 
+static void rebuild_hflags_common_aprofile(CPUARMTBFlags *flags,
+                                           CPUARMState *env, int el,
+                                           uint64_t sctlr, bool il)
+{
+    if (il) {
+        DP_TBFLAG_ANY(*flags, PSTATE__IL, 1);
+    }
+    if (aprofile_require_alignment(env, el, sctlr)) {
+        DP_TBFLAG_ANY(*flags, ALIGN_MEM, 1);
+    }
+    if (arm_fgt_active(env, el)) {
+        DP_TBFLAG_ANY(*flags, FGT_ACTIVE, 1);
+        if (fgt_svc(env, el)) {
+            DP_TBFLAG_ANY(*flags, FGT_SVC, 1);
+        }
+    }
+}
+
 static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
@@ -284,9 +302,8 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 
     el = arm_current_el(env);
     sctlr = arm_sctlr(env, el);
-    if (aprofile_require_alignment(env, el, sctlr)) {
-        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
-    }
+    rebuild_hflags_common_aprofile(&flags, env, el, sctlr,
+                                   env->uncached_cpsr & CPSR_IL);
 
     if (arm_el_is_aa64(env, 1)) {
         DP_TBFLAG_A32(flags, VFPEN, 1);
@@ -297,17 +314,6 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
         DP_TBFLAG_A32(flags, HSTR_ACTIVE, 1);
     }
 
-    if (arm_fgt_active(env, el)) {
-        DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
-        if (fgt_svc(env, el)) {
-            DP_TBFLAG_ANY(flags, FGT_SVC, 1);
-        }
-    }
-
-    if (env->uncached_cpsr & CPSR_IL) {
-        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
-    }
-
     /*
      * The SME exception we are testing for is raised via
      * AArch64.CheckFPAdvSIMDEnabled(), as called from
@@ -397,14 +403,17 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 {
     CPUARMTBFlags flags = rebuild_hflags_common(env, fp_el, mmu_idx);
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
-    uint64_t tcr = regime_tcr(env, mmu_idx);
-    uint64_t hcr = arm_hcr_el2_eff(env);
-    uint64_t sctlr;
+    uint64_t sctlr = regime_sctlr(env, stage1);
+    uint64_t tcr, hcr;
     int tbii, tbid, mtx;
 
+    rebuild_hflags_common_aprofile(&flags, env, el, sctlr,
+                                   env->pstate & PSTATE_IL);
+
     DP_TBFLAG_ANY(flags, AARCH64_STATE, 1);
 
     /* Get control bits for tagged addresses.  */
+    tcr = regime_tcr(env, mmu_idx);
     tbid = aa64_va_parameter_tbi(tcr, mmu_idx);
     tbii = tbid & ~aa64_va_parameter_tbid(tcr, mmu_idx);
     mtx = cpu_isar_feature(aa64_mte_mtx, env_archcpu(env)) ?
@@ -415,6 +424,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     DP_TBFLAG_A64(flags, TBID, tbid);
 
     /* E2H is used by both VHE and NV2. */
+    hcr = arm_hcr_el2_eff(env);
     if (hcr & HCR_E2H) {
         DP_TBFLAG_A64(flags, E2H, 1);
     }
@@ -465,12 +475,6 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
-    sctlr = regime_sctlr(env, stage1);
-
-    if (aprofile_require_alignment(env, el, sctlr)) {
-        DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
-    }
-
     if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
         DP_TBFLAG_ANY(flags, BE_DATA, 1);
     }
@@ -525,18 +529,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
-    if (env->pstate & PSTATE_IL) {
-        DP_TBFLAG_ANY(flags, PSTATE__IL, 1);
-    }
-
-    if (arm_fgt_active(env, el)) {
-        DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
-        if (FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, ERET)) {
-            DP_TBFLAG_A64(flags, TRAP_ERET, 1);
-        }
-        if (fgt_svc(env, el)) {
-            DP_TBFLAG_ANY(flags, FGT_SVC, 1);
-        }
+    if (EX_TBFLAG_ANY(flags, FGT_ACTIVE) &&
+        FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, ERET)) {
+        DP_TBFLAG_A64(flags, TRAP_ERET, 1);
     }
 
     /*
-- 
2.53.0


