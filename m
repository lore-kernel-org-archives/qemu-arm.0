Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F37CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:34:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPY-0007mo-A1; Sat, 16 May 2026 20:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOi-0007DV-6r
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:31 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOb-0004yk-FP
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:20 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-8383fb7143aso435399b3a.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977816; x=1779582616; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2YowRxNRLBYS6ametaessFL4W/WU5kteC+kwFAECtE=;
 b=um51cJd3Y73i+vvlJlVYf9y8ZmlNRNBlRrpg3g2AtN0afBWXkOscMYBYQ2W6Lw4TN/
 qcgieTNCs3V9GVwVFv/9qvyXbCq+VMvdWfzECnVLHgqhdtgtzr5sif1z7kcSC7liHvMS
 fk2i/UZjAIjPmczmRdDH0Vp54zxnRJ1GxNZbdU9KfVw8J2IUCIXqyAg5YNgZQsbYHUAb
 uvZcIwkA4ZSuZle/QICT64PGz6eg3DEX0aQcSf2ES3Ur3ZM4ePyXy9WHIPte655xQfON
 cHAQdwmnrOj/dBBqQTUPXENjSsfZrhw65th2vRZ6MHKVnYftEGvrj+b9nzZ+5gWFFwDM
 1eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977816; x=1779582616;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P2YowRxNRLBYS6ametaessFL4W/WU5kteC+kwFAECtE=;
 b=d/yE0bJqUBrZ3I0q3tTLQQMEdeUOfXYrxubueiUit3U0UqVbM/PrtTyduVFy3mBfSM
 dw1+p/ANwH+W/BkH/PFZb6YnrKUIplGQuhnQ9yEfv+VI5Yg23+2q1dDoyKtSPqi+MLav
 X7pqakleO2gO+vmkQvWmQOo4NkAwy3Ljhv0Fp7ksJjkDVeml3CNy2/e7bfF96kDc21p9
 zn9IwUn8DO5mWAJPiQ7qmszMGT5HF4i0Q51Sdc1RdyHjbjWw+tB/1N9spfeYP3hqO8R0
 Vfz/NJ74emkDCt64R1XokPADhBF4oOOY4KP1twZWW7ToeBPidiOcBd/wIOXz1IsfH/p8
 js8A==
X-Gm-Message-State: AOJu0Yx7Y9bvk62TaUlm6JKkt6lKTdxLVRXXbVX1NVqn5XtK9ZyCJfb1
 k8QMRnp/G4lIzsDwRJhV05zwGc/i9S52jYXR1aFGAPLLVxhPl2RN9QZEsWFHLsiWHIjpbXHcMJY
 DPz+N
X-Gm-Gg: Acq92OGg84GB1dY7TVZvxivSqsG5hRmyc7jJjvn/uW4hUW4J6bU6ldchrth264ODDPf
 X7o1j2p3yVeqKHW1mGV22STbnZumhTZnL0zx9uElFFl6YVS2T2jhUJ2HqyZLd+k6rJJwHfNofny
 09L5Y2/dogo5GQSkwTzeqjoZL9+C3bfRKiiBJJI24sVImKjiFOm0X6xiszOBgey3cm1p2trhl4P
 wca1gRjnRCJcG/LnCmVegJn5W65YvkYxLhnewCcXlAQmOoNYwCSgoTdOJqRTYtoUASeXhxU39po
 ZZzdwEbqUDt50jnacT90ihzl3f0Mio2L07MHQGZG6LGbBrZAZeS1rrjGfG+hrAFjQ39h10oTHEX
 YNGiGWsvWoLjK1u8hKfK03SetEgZGNE50l7KQNVdfsI3FBAf+HT25DfofPbUYEfTIYEwLHkKT1X
 o/3mxpXHHrUFx/m//uqX+58vZlUnRI
X-Received: by 2002:a05:6a00:3005:b0:82f:6640:7229 with SMTP id
 d2e1a72fcca58-83f33d39f43mr10366946b3a.23.1778977815819; 
 Sat, 16 May 2026 17:30:15 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 13/63] target/arm: Add FPMR_EL to TBFLAGS
Date: Sat, 16 May 2026 17:29:12 -0700
Message-ID: <20260517003002.321430-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
index c114510446..9e637c1d80 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2567,6 +2567,7 @@ FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
 FIELD(TBFLAG_A64, GCS_EN, 41, 1)
 FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
 FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
+FIELD(TBFLAG_A64, FPMR_EL, 45, 2)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 77fdc5f3a1..1648c2c96f 100644
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
index 3c6559964b..b013dd51cb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10726,6 +10726,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->gcs_en = EX_TBFLAG_A64(tb_flags, GCS_EN);
     dc->gcs_rvcen = EX_TBFLAG_A64(tb_flags, GCS_RVCEN);
     dc->gcsstr_el = EX_TBFLAG_A64(tb_flags, GCSSTR_EL);
+    dc->fpmr_el = EX_TBFLAG_A64(tb_flags, FPMR_EL);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.43.0


