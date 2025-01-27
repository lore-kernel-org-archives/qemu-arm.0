Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2775330njk;
        Mon, 27 Jan 2025 15:28:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWvEBdKbspsaihqMjFerM55CtKdBjZNwKrwyLJMfATnw8kUml8mGrJnFPEXsRRsRLsq2hydIg9Z4hhE+g==@linaro.org
X-Google-Smtp-Source: AGHT+IHM0ifKaBhytDpkCglJjtLMAp6c3hdqJNDpmuwd8476HYp9O0s2rbPnRmIbtgZtPSxkVM5S
X-Received: by 2002:a05:6214:acc:b0:6d9:3016:d0fc with SMTP id 6a1803df08f44-6e2366d73d5mr20792736d6.4.1738020524334;
        Mon, 27 Jan 2025 15:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738020524; cv=none;
        d=google.com; s=arc-20240605;
        b=Idqh1PyK0iAUDkhNEr0CMkwJhxp7YZk0Hx/XK9ri+KQfRBojR8V7ZjtQ4IWO0Gh5n8
         4p+OCgeoR9SuITOzXvbyZrkMzYAxnOlANE/x882rKVo191sva4vyiVP6ASFWXzsP6LCd
         E4FP3Eo9JZjMLnQIjsjKBgDpxsYD+TKq2jBJuEaSdv4MHE1muyffNSDwYIkzOdAdkuL2
         ijskO0Jb+A8Atc+Wo6d4P1LBOcBrsYZcoEBT+hKTGjsYi2gVYUub29iq7BQnQyJK3i2z
         5HMDixYeoYMvs48F0rFG6KTj0hcPkv1cqH1UwZHpj+CNUUrSvWtHyxr5eMYQ4slknZM4
         Y4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Rv/vufPtN4qZGgCEixmno+0BEOkC6dlLbTtJbkkFI6Y=;
        fh=vaX6VOghLUFm658Yo5sHp3pDtku+Mdbyt3Q8SspKpDA=;
        b=H/icsLP9U3fD1lJOIFz/ZURqyqU8iI+ce8EPfLDpNpqETEO8eFdhCbzuYtp26jfJZW
         zmfcMcmwBqbVj4udtjgEBzFAp3flGzdoM+b4Was3Az4T9Eupi7goSRQngNv0LTDXcDBl
         Hw6DOn9i0kCZoEHin4JeMVPSm+hNm9KqknvNReaFCaeiDb+ZylH5UnTR8rcqYPdoIr0N
         +QS9Uh0St0kW2dcOdQNGL4ijUAZ8gFqj8/AfdU7zfyj3oJPGXNfsPH07TXonDCHCvvMA
         nlCEy3LoT+euKG+bJxqN2P8mvSyn4DNdGVvrQ/nSz9x0jdSE7TAm6tqteGu3PmeMeWR+
         HP3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqkh5ZaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e20525bf0csi105551556d6.37.2025.01.27.15.28.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 15:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqkh5ZaX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcYUt-0006Sq-JY; Mon, 27 Jan 2025 18:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUj-0006N1-Qe
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:19 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tcYUf-0005Yk-Qj
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 18:26:17 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2f13acbe29bso9405555a91.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 15:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738020372; x=1738625172; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rv/vufPtN4qZGgCEixmno+0BEOkC6dlLbTtJbkkFI6Y=;
 b=uqkh5ZaXC1uGs9NXy+bYk8dl/tzOOokYSfdG7vd+Bd2nFdcoTIHp7KxEAxcz8spydw
 rnAt7UJrTABAb+FJIngrMsZeV27buKruzwaCd4I6QerpsKflgFc1GdWaFHgo95r6nhKf
 Bb0fnxYa8lyx24Ddew9dSnz6O4sKNR9s3vn7xvGT6EpiBlrIDYbtt1n97SZ/UTrO1J6o
 e4Y3smYLPpfKJi4zy8lbWc+1G5cJXTXL3Ts5idhDo0ijUmBFXMWkTkVRcHzRIF82NLFU
 srll4eHhbdxLmFrtnS3k00CBOG9dFfGTiJz/UHMSX+3kaeIT66JxjKQgEoaaAYjobD5l
 690Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738020372; x=1738625172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rv/vufPtN4qZGgCEixmno+0BEOkC6dlLbTtJbkkFI6Y=;
 b=ey7eFE/UEP6+mFc8zJKP8Y6BKrGinwKGJWnzIrKbi63M90/pMGN5d9mIwqY9dtm/F/
 D13SMv6Y+QJVFLelMLkW7OyZ0/gPTdbKST1lswC3mRTy4T3yv2wWzEzhUWKNBMuLz8fQ
 0Aj5AeOY+Y+O4aRBvslbB+A8C76YGiNVMPQFkO+paBB+4XudE5m2XquuODLGQhpsdPX+
 p3NY5zzoUAKcn7Lm5e0/pkeGFAOBaldHi4kY6yhvj2va5JAiOUUlCfWl/j6vXMeNYHJn
 wiTlDcN1adFYCgl7UBvlJm5FVbI73Th7XO9mTQ/W4QtIaWuzatYuBMFOgDnZVMqZWRI3
 awiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6sM+YDAAswrLZ0TpIzOephDH/kCGumoLHcoMvOagufOsLMWOapDs57hLb9Jiqy+F1D8aZjyzIGQ==@nongnu.org
X-Gm-Message-State: AOJu0YxtogPedsEwEhPyRxi6FvFLNz94DZMcTWRJpKR8bfI3IEPRFsxK
 O/Wdb5s1AYAYdvgxY4iTSTbqRn/6d6kc1onsYI5EDLaWDfKQ9lFOeLhtEwYFYrw=
X-Gm-Gg: ASbGncvLD015QXsdNrD6E/9sSNdtImSbPENyetsm/z1leppdMf3kkgH9YSzEGFHAggF
 9WOGhTEOioMh0jGUh7Bvvnlk6Zldk7aulyY/RnJIvuS7Gllo29wvw/gAnR0d9HEGCNkT1n3r0QM
 vxGDrXZ+xY1pehKFviYYWXQJIEVGNMEenxucjTiiRJhlhIl5oGXBfg36ULkfMfa9pUP05x54lb6
 pyJN4/lhxWTbbeZFnJR6lNEa2YpdrBkTiM8xCyGj9udfHm41TdFUyCsk006uEgaPkRK8L5oGspF
 rm/sJMNIoJ4PrsDky1ZOyna05nsfDHrt+pa4dTc=
X-Received: by 2002:a17:90b:2f46:b0:2f4:4431:51d4 with SMTP id
 98e67ed59e1d1-2f82bff6fcdmr1777822a91.6.1738020372524; 
 Mon, 27 Jan 2025 15:26:12 -0800 (PST)
Received: from stoup.. (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffb1b31esm7833000a91.47.2025.01.27.15.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 15:26:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH 09/22] target/arm: Remove ah_fp_status_f16
Date: Mon, 27 Jan 2025 15:25:51 -0800
Message-ID: <20250127232604.20386-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127232604.20386-1-richard.henderson@linaro.org>
References: <20250127232604.20386-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r9Q/X2tX8+XG

Replace with fp_status[FPST_AH_F16].

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h        |  3 +--
 target/arm/cpu.c        |  2 +-
 target/arm/vfp_helper.c | 10 +++++-----
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 18afff8509..0f7d5d5430 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -237,7 +237,7 @@ typedef struct NVICState NVICState;
  * behaviour when FPCR.AH == 1: they don't update cumulative
  * exception flags, they act like FPCR.{FZ,FIZ} = {1,1} and
  * they ignore FPCR.RMode. But they don't ignore FPCR.FZ16,
- * which means we need an ah_fp_status_f16 as well.
+ * which means we need an FPST_AH_F16 as well.
  *
  * To avoid having to transfer exception bits around, we simply
  * say that the FPSCR cumulative exception flags are the logical
@@ -695,7 +695,6 @@ typedef struct CPUArchState {
                 float_status fp_status_f16_a32;
                 float_status fp_status_f16_a64;
                 float_status ah_fp_status;
-                float_status ah_fp_status_f16;
             };
         };
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 26e3465a4b..ffb2151de5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -559,7 +559,7 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
     arm_set_ah_fp_behaviours(&env->vfp.ah_fp_status);
     set_flush_to_zero(1, &env->vfp.ah_fp_status);
     set_flush_inputs_to_zero(1, &env->vfp.ah_fp_status);
-    arm_set_ah_fp_behaviours(&env->vfp.ah_fp_status_f16);
+    arm_set_ah_fp_behaviours(&env->vfp.fp_status[FPST_AH_F16]);
 
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 93db713a40..d8dc58098b 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -129,7 +129,7 @@ static uint32_t vfp_get_fpsr_from_host(CPUARMState *env)
     a64_flags |= (get_float_exception_flags(&env->vfp.fp_status_f16_a64)
           & ~(float_flag_input_denormal_flushed | float_flag_input_denormal_used));
     /*
-     * We do not merge in flags from ah_fp_status or ah_fp_status_f16, because
+     * We do not merge in flags from ah_fp_status or FPST_AH_F16, because
      * they are used for insns that must not set the cumulative exception bits.
      */
 
@@ -160,7 +160,7 @@ static void vfp_clear_float_status_exc_flags(CPUARMState *env)
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD]);
     set_float_exception_flags(0, &env->vfp.fp_status[FPST_STD_F16]);
     set_float_exception_flags(0, &env->vfp.ah_fp_status);
-    set_float_exception_flags(0, &env->vfp.ah_fp_status_f16);
+    set_float_exception_flags(0, &env->vfp.fp_status[FPST_AH_F16]);
 }
 
 static void vfp_sync_and_clear_float_status_exc_flags(CPUARMState *env)
@@ -206,11 +206,11 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
         set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_STD_F16]);
-        set_flush_to_zero(ftz_enabled, &env->vfp.ah_fp_status_f16);
+        set_flush_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_AH_F16]);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a32);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status_f16_a64);
         set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_STD_F16]);
-        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.ah_fp_status_f16);
+        set_flush_inputs_to_zero(ftz_enabled, &env->vfp.fp_status[FPST_AH_F16]);
     }
     if (changed & FPCR_FZ) {
         bool ftz_enabled = val & FPCR_FZ;
@@ -235,7 +235,7 @@ static void vfp_set_fpcr_to_host(CPUARMState *env, uint32_t val, uint32_t mask)
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a32);
         set_default_nan_mode(dnan_enabled, &env->vfp.fp_status_f16_a64);
         set_default_nan_mode(dnan_enabled, &env->vfp.ah_fp_status);
-        set_default_nan_mode(dnan_enabled, &env->vfp.ah_fp_status_f16);
+        set_default_nan_mode(dnan_enabled, &env->vfp.fp_status[FPST_AH_F16]);
     }
     if (changed & FPCR_AH) {
         bool ah_enabled = val & FPCR_AH;
-- 
2.43.0

