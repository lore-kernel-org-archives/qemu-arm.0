Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CD4CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:02:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cBH-0005FI-IE; Wed, 08 Oct 2025 17:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cAS-0004Rm-Ft
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:54 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9H-0006jv-7d
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:52 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-27c369f8986so2542755ad.3
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960595; x=1760565395; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMk8zdLebXgz2q5eQ22qMhBeUAIlZk56wd1eur3ogN0=;
 b=b3SV6KkZoAwH+TOpzrs8GnaUyxDFuqqkQrhmXYGnFGOXFiezYdQ7EGQEOuKeyytigh
 bsXi6SQAXvQSYGkTjhi4tKJcxKyBN174qrVH/UKHttjeuvKE02Vdw8qd59LDZhNlNStK
 mCyjRbYEthFD+66Gjjd4Lz7er4kNpliqGuiU0UJJEh5S3wsbM1475qGsSY8FleO4odmW
 xGj7kB9xjsL3OWsDvFSIJ4puvg1Dlr3NZ9vEzNS9E7q5yrlzFp211qjqSGS2yPDK8yGF
 WHLgUYKnjArZN+shtBYm55VBWsjenXL0JyqfTddl2aN69LkCYjpkWMcS7sdh6vUGOf/P
 QC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960595; x=1760565395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xMk8zdLebXgz2q5eQ22qMhBeUAIlZk56wd1eur3ogN0=;
 b=asrnyYgLI2lsYve7Pv8ZVpsU3hR0Q2qy1S5coL5dBCKdElWcxgau6yxtryJeIh3u2W
 H7gVfH2xhOkWJEz4Wx/TsKJwdQ66X/lCrqG47bkWiv8UQqxfCZJhiSfLokGxZgudzSqw
 Oj0Fr5gIzHCWFKRWrdxQ0EOk0txHAZy5h0mpvfwnz2hjbK2Hz0QObSanAFreJHBHXPbG
 JCXM+c0WDM2hsiO97Fg7mq3JVRZJ4xfwWwmAOW6YbL2D2snwckoi0r+WMKQvIXwnejW5
 ut5cHra+ktr2PjhMZq8FPY572LKntLY5OjWKWjxCl2YQ2i3zymDPEwrkx5Uw4OgBma8P
 JHpA==
X-Gm-Message-State: AOJu0YxGxs8pfG8ILbhQTNpHtbncIti2Qg5FrwWxUb34LrovJk9bYoEP
 VUuvr/bz0jStxLQr+vi1Ax7L1nxgCaCq3Blm5WtyM+Nool+kBdbSfLp6pu/H4EUSZvo=
X-Gm-Gg: ASbGncurIcLUJRanM+wm9oL/wVyPn70OkUTuuFUGaJH1NCNM+ksDUyad4RJjCKCzuMv
 7RgVwn+fSZ0GJ5E0I60PUhSsUWWGOnbldndAEfltL3zNsBGOS0x6Tqu0buOYi7FFMT1t5lXrnTs
 P4ZDrlikLhkfF3G8oFRwAruZX0TUnN613De3G1cGnr7pMPoymf98MyuIK4RZzDlqkDSgKTmReW4
 iJlagx6X7ufbtY80kBF7rg2z5f+PtdReHczNRYSNm7taykn0If0Bun674O+i8lcpbSq5zn+fUTi
 jnQ9z5231udfQaM32QIKUtM8rMizDm2E69U338lu2HRq8Aykva9fzjKeqRmJttWpB9htkAvrjRy
 C87INFcNii2u6MwqtCJr4BObrpKCCOzbPO/B1LJA7YdqabchrB2jFBZyCnHu4PvBuDKA=
X-Google-Smtp-Source: AGHT+IGgjBhu6r/Szg6nQjSyhxxrjs3NIwH/Ipuztt2HqwoEs6qY46r4FIg/VrWqWYMNIiqzfSdaRw==
X-Received: by 2002:a17:903:298c:b0:265:982a:d450 with SMTP id
 d9443c01a7336-290273ffbf1mr65301245ad.40.1759960595234; 
 Wed, 08 Oct 2025 14:56:35 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 32/73] target/arm: Add GCS enable and trap levels to
 DisasContext
Date: Wed,  8 Oct 2025 14:55:32 -0700
Message-ID: <20251008215613.300150-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Pipe GCSEnabled, GCSReturnValueCheckEnabled, and CheckGCSSTREnabled
through hflags to the translator.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h               |  3 +++
 target/arm/tcg/translate.h     |  6 ++++++
 target/arm/tcg/hflags.c        | 38 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c |  3 +++
 4 files changed, 50 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e55524ae10..775219364f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2475,6 +2475,9 @@ FIELD(TBFLAG_A64, NV2_MEM_BE, 36, 1)
 FIELD(TBFLAG_A64, AH, 37, 1)   /* FPCR.AH */
 FIELD(TBFLAG_A64, NEP, 38, 1)   /* FPCR.NEP */
 FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
+FIELD(TBFLAG_A64, GCS_EN, 41, 1)
+FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
+FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
 
 /*
  * Helpers for using the above. Note that only the A64 accessors use
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index f1a6e5e2b6..761edded52 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -166,6 +166,12 @@ typedef struct DisasContext {
     bool fpcr_ah;
     /* True if FPCR.NEP is 1 (FEAT_AFP scalar upper-element result handling) */
     bool fpcr_nep;
+    /* True if GCSEnabled. */
+    bool gcs_en;
+    /* True if GCSReturnValueCheckEnabled. */
+    bool gcs_rvcen;
+    /* GCSSTR exception EL or 0 if enabled */
+    uint8_t gcsstr_el;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/tcg/hflags.c b/target/arm/tcg/hflags.c
index 17f83f13a4..5c9b9bec3b 100644
--- a/target/arm/tcg/hflags.c
+++ b/target/arm/tcg/hflags.c
@@ -451,6 +451,44 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         DP_TBFLAG_A64(flags, TCMA, aa64_va_parameter_tcma(tcr, mmu_idx));
     }
 
+    if (cpu_isar_feature(aa64_gcs, env_archcpu(env))) {
+        /* C.f. GCSEnabled */
+        if (env->cp15.gcscr_el[el] & GCSCR_PCRSEL) {
+            switch (el) {
+            default:
+                if (!el_is_in_host(env, el)
+                    && !(arm_hcrx_el2_eff(env) & HCRX_GCSEN)) {
+                    break;
+                }
+                /* fall through */
+            case 2:
+                if (arm_feature(env, ARM_FEATURE_EL3)
+                    && !(env->cp15.scr_el3 & SCR_GCSEN)) {
+                    break;
+                }
+                /* fall through */
+            case 3:
+                DP_TBFLAG_A64(flags, GCS_EN, 1);
+                break;
+            }
+        }
+
+        /* C.f. GCSReturnValueCheckEnabled */
+        if (env->cp15.gcscr_el[el] & GCSCR_RVCHKEN) {
+            DP_TBFLAG_A64(flags, GCS_RVCEN, 1);
+        }
+
+        /* C.f. CheckGCSSTREnabled */
+        if (!(env->cp15.gcscr_el[el] & GCSCR_STREN)) {
+            DP_TBFLAG_A64(flags, GCSSTR_EL, el ? el : 1);
+        } else if (el == 1
+                   && EX_TBFLAG_ANY(flags, FGT_ACTIVE)
+                   && !FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR],
+                                  HFGITR_EL2, NGCSSTR_EL1)) {
+            DP_TBFLAG_A64(flags, GCSSTR_EL, 2);
+        }
+    }
+
     if (env->vfp.fpcr & FPCR_AH) {
         DP_TBFLAG_A64(flags, AH, 1);
     }
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index a0e3300231..693eab1c01 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10344,6 +10344,9 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->nv2_mem_be = EX_TBFLAG_A64(tb_flags, NV2_MEM_BE);
     dc->fpcr_ah = EX_TBFLAG_A64(tb_flags, AH);
     dc->fpcr_nep = EX_TBFLAG_A64(tb_flags, NEP);
+    dc->gcs_en = EX_TBFLAG_A64(tb_flags, GCS_EN);
+    dc->gcs_rvcen = EX_TBFLAG_A64(tb_flags, GCS_RVCEN);
+    dc->gcsstr_el = EX_TBFLAG_A64(tb_flags, GCSSTR_EL);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.43.0


