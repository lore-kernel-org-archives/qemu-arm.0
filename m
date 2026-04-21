Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9474FEA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:20:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3S0-0008KZ-El; Tue, 21 Apr 2026 01:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RH-0007yW-Rm
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:32 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RG-0006R4-66
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:23 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ad9a9be502so23862435ad.0
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748461; x=1777353261; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V7aV4/ccpJY3oIK25szkraYIxGpm+6Rk3RJv/5vVfmY=;
 b=Qh2QXm0C8UpS2Cqpe1vzaqkknNeNTMzJsxdEka0SQxLCj7AfTGeGOwp9ZEQ7+H5RpD
 UATes9YDY0hUlXtfjSTg6emiShsHfrtBf6RIPSfD9FtVBrk/ViRAp7E93pSrnByezl9x
 7Vq8/SpzKDNu3afED0cSYNfhT/CgE8ioKbtFOuAos2G8XlIOMCkm2gtkxeSo1nrHeUfE
 yhGtIF53kbMZZSA4tSaPQhkX9CYdMYybhc42YMiDHw/bscMR1g8EYwBTw08VAvVkzv3B
 hhdm1enVtraIHiD3F9WuSU9VsBkmqjBVtV93UUzA2zyfSFxeNj027a9EaHVztAKmqeou
 pAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748461; x=1777353261;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=V7aV4/ccpJY3oIK25szkraYIxGpm+6Rk3RJv/5vVfmY=;
 b=gr90/9sWMSp9a4CaOZ1sXhVugJpf90RAiqhIUMlByJCxVcMqXcgy1hML/2eSggrE4E
 k1AztTKz5GJ2aI8a1f+HMWetcFyikMxOA4qibHiuDpQ/mJkFPcBEgA1L18ncDlmFLXWL
 TPVpcNTfK7MaxxDuaxnwddeGLZZcmE/znkJvwRutgZXV009ZsBUt9cA3kATLByotap2F
 s2DQNU678Lrm83NpgsyrDG0oCwdfuqDGWllsjZfslC3vfV4FlsZYfDywFu5YG3Ti9rid
 jcMmbDCnavOgr5EXe+oInywLlEwwnu+gseNp8hvS172qbs9yTQXz9CcEUa3R62BWAvGq
 3aAA==
X-Gm-Message-State: AOJu0Yx2gZPjNTyfKhrqrLMJUKcooBknZL36xo36NJSoDGFSsdfPVebv
 C+R7gdJ7h4vbI5nVecazWB/YXbxB8j5rWXw7NbhSdUgxEyB+n0PKMmrYBMGBYVK2aQZRJPSg/cR
 xU5j/owA=
X-Gm-Gg: AeBDiesoQt8y3lcY6Xl5xty80+f8Fd1J0EOw37OtVX7GJQfWzCA9sCiQ1s2iLrYwGVM
 AigpvjnRMT07VBjgKdjyjs9n9CyK6VHr1jI5HRTEtspItZdBep0VOamOhTw8s9piVw9wqmpp1ac
 W4IIL0T3H5YrmP9RyOwZDJdaHqCQoyR0B8CBm0osyGJV4UOOJAACxb50bQAaKi1H3PQ5S2C3sVX
 TgkhpVxSr4k6wD28mAydoz4l3gcmuVkl59FNegHXNd6EQCOYz/kNIXm54Ff3PvdMCDh/ej/otSM
 yiWZI9FeZupl1V/N5Cc3IJW/C/Q6NShEAltYr/YSS/SpiWMKdutsuZ1IvBEkWtauxAu2GbP3c+X
 tGEDYdQWnBSZ30MwMinoMPAKUgU+vmcyrnkZ6I7jxjiueHul7TWt4cyOIEXEoF54Tzc39NuwXT2
 H0cYt0JaAVYBKselGQx08nz6JH3hyHzHfJ0QFk4FjP
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id
 d9443c01a7336-2b5f9f3a802mr183683845ad.27.1776748460518; 
 Mon, 20 Apr 2026 22:14:20 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/37] target/arm: Add FPMR_EL to TBFLAGS
Date: Tue, 21 Apr 2026 15:13:21 +1000
Message-ID: <20260421051346.41106-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Prepare to perform access checks for direct and
indirect uses of FPMR.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  1 +
 target/arm/tcg/translate.h     |  2 ++
 target/arm/tcg/hflags.c        | 41 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c |  1 +
 4 files changed, 45 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index deab811ba4..e78bc1737d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2536,6 +2536,7 @@ FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
 FIELD(TBFLAG_A64, GCS_EN, 41, 1)
 FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
 FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
+FIELD(TBFLAG_A64, FPMR_EL, 45, 2)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3e3094a463..4001f2fc36 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -199,6 +199,8 @@ typedef struct DisasContext {
     uint8_t gm_blocksize;
     /* True if the current insn_start has been updated. */
     bool insn_start_updated;
+    /* FMPR exception EL or 0 if enabled. */
+    uint8_t fpmr_el;
     /* Offset from VNCR_EL2 when FEAT_NV2 redirects this reg to memory */
     uint32_t nv2_redirect_offset;
 } DisasContext;
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 7e6f8d3647..6759b36f28 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -237,6 +237,43 @@ static int zt0_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
+/*
+ * Return the exception level to which exceptions should be taken for FPMR.
+ * C.f. the ARM pseudocode function CheckFPMREnabled.
+ */
+static int fpmr_exception_el(CPUARMState *env, int el)
+{
+    switch (el) {
+    case 0:
+        if (el_is_in_host(env, el)) {
+            if (!(env->cp15.sctlr_el[2] & SCTLR_EnFPM)) {
+                return 2;
+            }
+            break;
+        }
+        if (!(env->cp15.sctlr_el[1] & SCTLR_EnFPM)) {
+            return 1;
+        }
+        /* fall through */
+    case 1:
+        if (!(arm_hcrx_el2_eff(env) & HCRX_ENFPM)) {
+            return 2;
+        }
+        break;
+    case 2:
+        break;
+    case 3:
+        return 0;
+    default:
+        g_assert_not_reached();
+    }
+    if (arm_feature(env, ARM_FEATURE_EL3)
+        && !(env->cp15.scr_el3 & SCR_ENFPM)) {
+        return 3;
+    }
+    return 0;
+}
+
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
@@ -500,6 +537,10 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
+    if (cpu_isar_feature(aa64_fpmr, env_archcpu(env))) {
+        DP_TBFLAG_A64(flags, FPMR_EL, fpmr_exception_el(env, el));
+    }
+
     return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
 }
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9f375b05ca..ef6038e98b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10725,6 +10725,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->gcs_en = EX_TBFLAG_A64(tb_flags, GCS_EN);
     dc->gcs_rvcen = EX_TBFLAG_A64(tb_flags, GCS_RVCEN);
     dc->gcsstr_el = EX_TBFLAG_A64(tb_flags, GCSSTR_EL);
+    dc->fpmr_el = EX_TBFLAG_A64(tb_flags, FPMR_EL);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.43.0


