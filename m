Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE099CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:19:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jK6-0004ua-Mz; Fri, 03 Oct 2025 13:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jIa-0002jD-CP
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:30 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGq-0006K1-3L
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:27 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-28e7cd34047so23990615ad.2
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511310; x=1760116110; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RolyaUUHIHIR5Zu1tP7hN36Gr1zykkwKEbs2fOqoBG8=;
 b=RcQ28blROAGzJuukC3tuXUUf3G0LN7bjTmei3hJKOZAZiV38anatcTgVBwpTaSylBp
 Oyed4YJ53dURrW+6c2RCEZaeLqi8qYsoC6bSn8quvvH/B4OnDNqaWPDi1mxzwXU+iun0
 sPL6CsEz2rUY0Pe8KKc87ixD/DokHcjQEQT5cFUL17SV7G6r8kbAeMtAL6Ea4s9CrRKq
 p9V6O2TA4B6zxxJC2S0Fv/9/8PJopaoRq2ihgSELTjPJAKNUXlvYNN5Dq9fjCsS+vK5N
 h6nHvZZJL3gGfiw91rV+IbBkn7O8xxWPShwAaBpRVIWRcOSyxWKYugxY9oUhPYaKxM02
 JJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511310; x=1760116110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RolyaUUHIHIR5Zu1tP7hN36Gr1zykkwKEbs2fOqoBG8=;
 b=YQhDvnWGEN6EBrLOy7Epcim5+EgXmR0tcUynqCRAFQlq928KeCV/so8WUZWC2aGqWs
 72VFjJqtO04UOXQIflxxNm2o+hnKFuZ3E4DUk0smt4fB7dZHgTanLXjJUu2TfkfGxX/p
 Pppc8Xvl1O5k0cM52qc/B7e5IOcYn8kYC0xbLXn8eEmwEU1GK3scAPEEWC9BKq8PYRm8
 dsMU7leqVlqhYzoIl8cNugaowxvmH96hmF/82RKujWUYNSw8lgVluSwY4SdMxwVAGqKR
 eZIc52fBISR7j8fF9MU6+CRrdAz03y7cbilT/mRUndxuewx92OVqhoozX+BtU1HyVaWp
 XtuQ==
X-Gm-Message-State: AOJu0YxRbMHynxeRFkef+sRDXtWHhzWWAOMnJLlV8EvfqgmN39SUjCCT
 qnwWiMgRtPgSsiy3hJEiwA/3eUCxdoJNiL5qSm0YcIfbD5ufrs6Tb5/IBREondrD/pg=
X-Gm-Gg: ASbGncuDTER3cVyRJC5vn4BX7OWdzUIT7gV0KtnJ95YU03GTBfO6nFmSk++787fbIMl
 mWxMK37L0xgfyKyitbrs+obtmRpYRXzGTL2ogM839Ija3dW6SJnvvgdbDsCau4SyzY+/9uG/9j9
 Nx0MGKhJsrp8bwlmfjm1RtZmGnl1rdmyoONa3kYgAuoUOxV7nCCZSPjGFffLEW7YfbQWbqI0uC3
 aaGGqOWthOIFR4rR/LF0xgJBETmrN6UI5/N36V9YvO/ICig4x/nx3EvW2BZUznj7CfLkxpBvn3X
 L4B56OE8QlKFTQjSCIsmzSmMBH2gjr5IqISDnglyLTNLp31TEWB00VZjaS3/8Z8vldXy7okyX+s
 mWSnfa/sWgnDJp6JkAWyMsfXEp31fnvFGjmkJwktyCqhxuV/MSMOO5xhT
X-Google-Smtp-Source: AGHT+IGgGt2nFuR990JnCwp/Lhea0QB4PQ2S+t7OjDA7eIxuaQ6lueJg9ONDDIxGdoO6Jz/Jwvl+xw==
X-Received: by 2002:a17:903:acd:b0:27b:defc:802d with SMTP id
 d9443c01a7336-28e9a5f7158mr55739165ad.28.1759511309998; 
 Fri, 03 Oct 2025 10:08:29 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 32/73] target/arm: Add GCS enable and trap levels to
 DisasContext
Date: Fri,  3 Oct 2025 10:07:19 -0700
Message-ID: <20251003170800.997167-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
index 16a407f899..6fa94db524 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2469,6 +2469,9 @@ FIELD(TBFLAG_A64, NV2_MEM_BE, 36, 1)
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


