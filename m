Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F91CC9830E
	for <qemu-arm@archiver.kernel.org>; Fri, 25 Sep 2026 21:51:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xADoo-00084A-RN; Fri, 25 Sep 2026 17:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo8-0007lI-JG
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:24 -0400
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xADo1-0007ii-KZ
 for qemu-arm@nongnu.org; Fri, 25 Sep 2026 17:50:13 -0400
Received: by mail-pz2-x0e.google.com with SMTP id
 d2e1a72fcca58-86efece610cso742197b3a.0
 for <qemu-arm@nongnu.org>; Fri, 25 Sep 2026 14:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790373008; x=1790977808; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qQqLleq9jFwQAu2DlMr3Yg7KtY0N4jXoARR7q/EhAVQ=;
 b=DWH6TFGz5/fsvKuZjxY5iOs+43+idhOVmI2br4ebOQ+VrcCgXLCPGIf6Y48jHfLpVV
 LqonrOgffIz+MBJJH2pBjg5TVOguFLGua/FEPCoX00QQ0bNRB7c4+a0L/+4chduGgfIy
 2xgqO6KVcKm/4VTE2iLsTaV2XUgJ3H7eSiwD7T2KI+UrQxGsELroh6QWzpj9kDiuAb+A
 eWFxAiPIJaHoscpELq+tQWB+hw1JE05cv8jkmatWDIQA/KAQ3Frx6xflB02zwUOIwKdU
 X6u1NL119OPF6DsRLF6W6+dMd5Kd5J58J+mY4XZXDNkSs6G5ROSyr1qAVVN80kQlMEuN
 zHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790373008; x=1790977808;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qQqLleq9jFwQAu2DlMr3Yg7KtY0N4jXoARR7q/EhAVQ=;
 b=ytDKof6PUNvoZeuXIcPDD+8HlZaKgdNh32EvAj3bfvAGon4tny3t8dauSUvbJC+KLX
 AzKHi+OwalF29e4q0olZAwsFKrY33iNjQi8iBw2QcbbgTmIJvKa5hSpXq6meMKg2UHcq
 o/cNU7CPI43p7JWo3NI9cBwqoWbkMEStrslPFT3IV02Vgr5pXro1lOwjlbGsfulvB0kN
 HANb0McxE5KOrFQfCCt/q9Xj1ITJC63Y+12KkAlhSllVp4GR5e86b9Vu5fMbq7g9gZf3
 os0c0C1DzafAgGVswMBZcqTEsGd20jKTulMmrVjokuG+1NL3sRAPn0PQe+poawXxVqXL
 iJvg==
X-Gm-Message-State: AFuF++ml2JljvszP5g4q4UENpORDIzyiI0ONTnRcwlenmYIIBS3Gy6LO
 5sz8SuB+4RE2C1FbYKZEvYrFvh43DgthNd4m1fsmEU1Ma4pLHFF0QnVqL0MRAyIETMVQ0WIpntQ
 EMecR
X-Gm-Gg: AYBFou3eDLb35syksIvW2joeIgU96Ngel/ZPMBP5xO31aW9P7GESXwLOS5+utnifan8
 1YaSkRknBIiMUw6JMHvbZ56Lf/9ekbwQm1pOZ8k6gRuhfbzkgeVqSuftrsZiJrgKVBZXMM2mpLz
 SZ4d0kBKmN5b5enXm+wfe40tVjZvfSUnzZeHJLGUSd7M/J+1mnTOHBJC1P+dFDXiscxYoh5a2Tk
 xkoyQ18jtQo/kdrv6SRHzCqe0Zgd7iiHPcYp6fiPP8A0ksI71W2YzCZS/tbNnY9MdXbAq1YUA8J
 hhb4iBhlfno2U5f89YP/yiHjGPOeZOekQuYaj6xXjctu9Aag4lkme/NmKt9BvSjvoxy6NSHnQzD
 9HUPSCFLbSMX0GkDG57BWEClggH0vryO5ubYq1zHf25Pm7C9rXWK+sbB7zckcjio9D4m9neYvCQ
 i13zz3jQoChuUAN5xymnlRGpFqXeq+oJlkF7PPtJGmUgr1xSrmSrCZnlzO3iLedfWbQOOJq9fSO
 bXOCh32jr2kLstEfiNZ+kKj29wj/g==
X-Received: by 2002:a05:6a00:761b:b0:880:d865:dbb8 with SMTP id
 d2e1a72fcca58-880d865e130mr1304507b3a.7.1790373008178; 
 Fri, 25 Sep 2026 14:50:08 -0700 (PDT)
Received: from stoup (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87fea1940ecsm1725256b3a.13.2026.09.25.14.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 14:50:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/14] target/arm: Reorg rebuild_hflags_common*
Date: Fri, 25 Sep 2026 14:49:52 -0700
Message-ID: <20260925215004.456336-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925215004.456336-1-richard.henderson@linaro.org>
References: <20260925215004.456336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Invert the call ordering of rebuild_hflags_common_32 and
rebuild_hflags_common vs the rest of the flags setting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/hflags.c | 44 +++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index c7739fc61b2..eb1aff91d5f 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -87,9 +87,10 @@ bool access_secure_reg(CPUARMState *env)
 }
 
 static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
-                                           ARMMMUIdx mmu_idx,
-                                           CPUARMTBFlags flags)
+                                           ARMMMUIdx mmu_idx)
 {
+    CPUARMTBFlags flags = {};
+
     DP_TBFLAG_ANY(flags, FPEXC_EL, fp_el);
     DP_TBFLAG_ANY(flags, MMUIDX, arm_to_core_mmu_idx(mmu_idx));
 
@@ -100,28 +101,27 @@ static CPUARMTBFlags rebuild_hflags_common(CPUARMState *env, int fp_el,
     return flags;
 }
 
-static CPUARMTBFlags rebuild_hflags_common_32(CPUARMState *env, int fp_el,
-                                              ARMMMUIdx mmu_idx,
-                                              CPUARMTBFlags flags)
+static void rebuild_hflags_common_32(CPUARMTBFlags *flags, CPUARMState *env)
 {
     bool sctlr_b = arm_sctlr_b(env);
 
     if (sctlr_b) {
-        DP_TBFLAG_A32(flags, SCTLR__B, 1);
+        DP_TBFLAG_A32(*flags, SCTLR__B, 1);
     }
     if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
-        DP_TBFLAG_ANY(flags, BE_DATA, 1);
+        DP_TBFLAG_ANY(*flags, BE_DATA, 1);
     }
-    DP_TBFLAG_A32(flags, NS, !access_secure_reg(env));
-
-    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+    DP_TBFLAG_A32(*flags, NS, !access_secure_reg(env));
 }
 
 static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = {};
-    uint32_t ccr = env->v7m.ccr[env->v7m.secure];
+    CPUARMTBFlags flags = rebuild_hflags_common(env, fp_el, mmu_idx);
+    uint32_t ccr;
+
+    rebuild_hflags_common_32(&flags, env);
+    ccr = env->v7m.ccr[env->v7m.secure];
 
     /* Without HaveMainExt, CCR.UNALIGN_TRP is RES1. */
     if (ccr & R_V7M_CCR_UNALIGN_TRP_MASK) {
@@ -146,8 +146,7 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
     if (arm_feature(env, ARM_FEATURE_M_SECURITY) && env->v7m.secure) {
         DP_TBFLAG_M32(flags, SECURE, 1);
     }
-
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+    return flags;
 }
 
 /* This corresponds to the ARM pseudocode function IsFullA64Enabled(). */
@@ -277,10 +276,14 @@ static bool arm_d32dis(CPUARMState *env, int cur_el)
 static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = {};
-    int el = arm_current_el(env);
-    uint64_t sctlr = arm_sctlr(env, el);
+    CPUARMTBFlags flags = rebuild_hflags_common(env, fp_el, mmu_idx);
+    int el;
+    uint64_t sctlr;
 
+    rebuild_hflags_common_32(&flags, env);
+
+    el = arm_current_el(env);
+    sctlr = arm_sctlr(env, el);
     if (aprofile_require_alignment(env, el, sctlr)) {
         DP_TBFLAG_ANY(flags, ALIGN_MEM, 1);
     }
@@ -323,7 +326,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 
     DP_TBFLAG_A32(flags, D32DIS, arm_d32dis(env, el));
 
-    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
+    return flags;
 }
 
 /*
@@ -392,7 +395,7 @@ static int fpmr_exception_el(CPUARMState *env, int el)
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = {};
+    CPUARMTBFlags flags = rebuild_hflags_common(env, fp_el, mmu_idx);
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     uint64_t tcr = regime_tcr(env, mmu_idx);
     uint64_t hcr = arm_hcr_el2_eff(env);
@@ -672,8 +675,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
     if (cpu_isar_feature(aa64_fpmr, env_archcpu(env))) {
         DP_TBFLAG_A64(flags, FPMR_EL, fpmr_exception_el(env, el));
     }
-
-    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
+    return flags;
 }
 
 static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
-- 
2.53.0


