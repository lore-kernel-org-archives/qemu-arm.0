Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1143101njb;
        Sat, 1 Feb 2025 08:43:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4yqgxzduEDuj/CDP0SshbmgUy82XMpFxZXrCi7gChDS7NMeCQ8FY6JmjB1htvhpqIeTgYt09lB30+rQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH+blik1qWU9N/G1icPMlpBehihap6wl5B9P4O7FPQxzjznFD6vHAUsntiVLXWRnyABVNPI
X-Received: by 2002:a05:622a:285:b0:461:169e:d2dc with SMTP id d75a77b69052e-46fd0ba3b44mr255798531cf.49.1738428195145;
        Sat, 01 Feb 2025 08:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428195; cv=none;
        d=google.com; s=arc-20240605;
        b=ObTHkQjJd3JB/Ceir8l1SS3pahK7zMHGyDQPrErrQpAklF8m0jqCvnLcsBPqFLwqq3
         Qx4dp5RG5O4dQYa1zzD0e0ciaJmcvJ0eqSshpIcqptpM3JagnnZyiCUBFomlBT3eauhz
         TJqSXk76Bk4EpJDLfW9FTgFu3U9HRwnh4/QHU6VJXBUcnJ4iKY2TkJeQc8EL5m4zPJhN
         lpf7thw5PoW63FA6284IKhOE/GY8H6DzFseFum8b0Htiy+fAn+tDxP+S+vSY6uFaf4C0
         KfOFOMVfL+CYh86TzBE05nN2MWJU6VmiC92XGaTgc+gJ5WGsMVWiQGUUW6Ae65sSe+mD
         hTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=aUwB3iaeV7D5kJkSCDikB8cZuPi9S68tuUXP2SbKJ6Q=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=kHckKyVdxKcTIB9ENhN1dpuVHLNL724KpBrRH3VimKJeqiS+ui0sYQRJjJP/zhjstD
         6NManMlCAN9VXzO8mQETvJTVwZS4d/rUyyif85W9nSEkfF9FJzi+OZXmcBx2Sg4yaJxp
         NxAi7/m+1yqmmH5loc/gQIZicMsRTOmOJErHzdEGxkMPWQOrW2RWshB2NICTJg0mRP4F
         9Z9xYDyGc5sUE94Q4BddVopy/uoiqqoFKSZGzQZa+J4CetcygxLxypbB5mPcle8JYNQd
         32QqAVOl/V6psdIGyxNZ1Iz2lbWKwKbhaqwr/q2G9rt3xkidU+rXLbCI1RS6ee4iNoB9
         FdVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I1ive0tU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1e202dsi63997211cf.506.2025.02.01.08.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:43:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I1ive0tU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGY8-0006HX-Sg; Sat, 01 Feb 2025 11:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY6-0006Er-Tr
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:50 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGY5-00019l-3H
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:40:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso34949365e9.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428048; x=1739032848; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aUwB3iaeV7D5kJkSCDikB8cZuPi9S68tuUXP2SbKJ6Q=;
 b=I1ive0tUroQfnJkMcjDwBNM3G6miGqjpC9waOrHwYOC69Nz3LfDp15duprQnMQBJtx
 F+x1+id8/Ak/NEFv6xCjxz+KHA6sySOW7fYR4fVpPqoxNsYgckvXj5ducfqSE7pPSSQo
 75NpjOoZ8y3Kg/WU1TnWDuNjhHVn/PV7DlRmAd6yEERAulnTBGvicJdUPvQeiae5O1iA
 JZ5JCia0K59eHrLXl8A0kj8n7Mr0LhaIC2KAgEXfD6fcjp7DxgpIs+2KkT0R6CK+m4T/
 ExEkPdIQhpRy10AXS9SJjO6mihJS3bLc/Oc997swPCgtwZ3toDkcKUQ0Vcn0stEk2yaM
 qLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428048; x=1739032848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aUwB3iaeV7D5kJkSCDikB8cZuPi9S68tuUXP2SbKJ6Q=;
 b=RrZaUtDWYuMNVlCNHy5sZJFBYn8eBy2roxlrsodtogYoWQwntO+LmXPlZ7SXVB4ZRe
 ZkhyVnKvV6AK7hBO80gATDyLvIdka3VtLU72bCsmGlMbFG1l12OK/Xtci2SPWK4/qy3I
 zj7ZHlzEDqgu4/nSQcxyCnvOwpbT1MVc96iFpoVrMSk49gTcN6AqeL1GYReEt9DQkD6x
 6tdEtsOuRWUu1R204PNYCC30LWWoTs/0Q0nAPT3mhyZEpicc7iRL3lSQOJcjNR8+9B+X
 m7nwGr29wLgq78FNd0s5C4JeXLt5aSRfLciC5BjICj7uEEU3oeBiFUntogvvz5+2+4cf
 WHAg==
X-Gm-Message-State: AOJu0YzkW1Fmfya/u16BYLax/VkDtQ47Q7rOdFGWpd3HZ2fgHLiN9irK
 wVBr4aMY1ide/HO5RklqU9mrpkKbZBlsDgd+MKYM7JG4afFVCwdW5eBC/UuJzaTZGA0DTyAnze4
 a
X-Gm-Gg: ASbGncvvggiOVCXj/yHwOFfJy90bFw25/mEjXgtTyJFFYuay0H+wtlNyB4D6SKxC1JQ
 HG19P/ihvXCH7XQOh+2LlFigeIX+O7QxKzAqL0dtxmhuDGpwhlHdukWhOz9zY8n4WsQzMGwKQTI
 OvGtttENU9ql+NabUgZVh5afEnqle2EcqK1OtmFIkrPDJtnrHtkFAYWXcfxJnxcG2ch5yxIt/Px
 sE99fFp0JfvoBmdEg3rOlVT1nmt21F0Kvlt/5jRVYhYBYf94/1D1zHHh8agZN+8O/4LdkfRmN6l
 lsjVLAZ0DAoRbdD2gfjX
X-Received: by 2002:a05:600c:ccc:b0:434:ff25:19a0 with SMTP id
 5b1f17b1804b1-438e07cd868mr104456305e9.21.1738428047668; 
 Sat, 01 Feb 2025 08:40:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:40:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 24/69] target/arm: Implement FPCR.AH semantics for scalar
 FMIN/FMAX
Date: Sat,  1 Feb 2025 16:39:27 +0000
Message-Id: <20250201164012.1660228-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vwwCpvmqKlUP

When FPCR.AH == 1, floating point FMIN and FMAX have some odd special
cases:

 * comparing two zeroes (even of different sign) or comparing a NaN
   with anything always returns the second argument (possibly
   squashed to zero)
 * denormal outputs are not squashed to zero regardless of FZ or FZ16

Implement these semantics in new helper functions and select them at
translate time if FPCR.AH is 1 for the scalar FMAX and FMIN insns.
(We will convert the other FMAX and FMIN insns in subsequent
commits.)

Note that FMINNM and FMAXNM are not affected.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-a64.h    |  7 +++++++
 target/arm/tcg/helper-a64.c    | 36 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c | 23 ++++++++++++++++++++--
 3 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-a64.h b/target/arm/tcg/helper-a64.h
index bac12fbe55b..ae0424f6de9 100644
--- a/target/arm/tcg/helper-a64.h
+++ b/target/arm/tcg/helper-a64.h
@@ -67,6 +67,13 @@ DEF_HELPER_4(advsimd_muladd2h, i32, i32, i32, i32, fpst)
 DEF_HELPER_2(advsimd_rinth_exact, f16, f16, fpst)
 DEF_HELPER_2(advsimd_rinth, f16, f16, fpst)
 
+DEF_HELPER_3(vfp_ah_minh, f16, f16, f16, fpst)
+DEF_HELPER_3(vfp_ah_mins, f32, f32, f32, fpst)
+DEF_HELPER_3(vfp_ah_mind, f64, f64, f64, fpst)
+DEF_HELPER_3(vfp_ah_maxh, f16, f16, f16, fpst)
+DEF_HELPER_3(vfp_ah_maxs, f32, f32, f32, fpst)
+DEF_HELPER_3(vfp_ah_maxd, f64, f64, f64, fpst)
+
 DEF_HELPER_2(exception_return, void, env, i64)
 DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
 
diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 05036089dd7..ed5e4a45997 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -399,6 +399,42 @@ float32 HELPER(fcvtx_f64_to_f32)(float64 a, float_status *fpst)
     return r;
 }
 
+/*
+ * AH=1 min/max have some odd special cases:
+ * comparing two zeroes (regardless of sign), (NaN, anything),
+ * or (anything, NaN) should return the second argument (possibly
+ * squashed to zero).
+ * Also, denormal outputs are not squashed to zero regardless of FZ or FZ16.
+ */
+#define AH_MINMAX_HELPER(NAME, CTYPE, FLOATTYPE, MINMAX)                \
+    CTYPE HELPER(NAME)(CTYPE a, CTYPE b, float_status *fpst)            \
+    {                                                                   \
+        bool save;                                                      \
+        CTYPE r;                                                        \
+        a = FLOATTYPE ## _squash_input_denormal(a, fpst);               \
+        b = FLOATTYPE ## _squash_input_denormal(b, fpst);               \
+        if (FLOATTYPE ## _is_zero(a) && FLOATTYPE ## _is_zero(b)) {     \
+            return b;                                                   \
+        }                                                               \
+        if (FLOATTYPE ## _is_any_nan(a) ||                              \
+            FLOATTYPE ## _is_any_nan(b)) {                              \
+            float_raise(float_flag_invalid, fpst);                      \
+            return b;                                                   \
+        }                                                               \
+        save = get_flush_to_zero(fpst);                                 \
+        set_flush_to_zero(false, fpst);                                 \
+        r = FLOATTYPE ## _ ## MINMAX(a, b, fpst);                       \
+        set_flush_to_zero(save, fpst);                                  \
+        return r;                                                       \
+    }
+
+AH_MINMAX_HELPER(vfp_ah_minh, dh_ctype_f16, float16, min)
+AH_MINMAX_HELPER(vfp_ah_mins, float32, float32, min)
+AH_MINMAX_HELPER(vfp_ah_mind, float64, float64, min)
+AH_MINMAX_HELPER(vfp_ah_maxh, dh_ctype_f16, float16, max)
+AH_MINMAX_HELPER(vfp_ah_maxs, float32, float32, max)
+AH_MINMAX_HELPER(vfp_ah_maxd, float64, float64, max)
+
 /* 64-bit versions of the CRC helpers. Note that although the operation
  * (and the prototypes of crc32c() and crc32() mean that only the bottom
  * 32 bits of the accumulator and result are used, we pass and return
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 334aff42753..ae3f3d32f45 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5152,6 +5152,15 @@ static bool do_fp3_scalar_ah(DisasContext *s, arg_rrr_e *a, const FPScalar *f,
                                        select_ah_fpst(s, a->esz));
 }
 
+/* Some insns need to call different helpers when FPCR.AH == 1 */
+static bool do_fp3_scalar_2fn(DisasContext *s, arg_rrr_e *a,
+                              const FPScalar *fnormal,
+                              const FPScalar *fah,
+                              int mergereg)
+{
+    return do_fp3_scalar(s, a, s->fpcr_ah ? fah : fnormal, mergereg);
+}
+
 static const FPScalar f_scalar_fadd = {
     gen_helper_vfp_addh,
     gen_helper_vfp_adds,
@@ -5185,14 +5194,24 @@ static const FPScalar f_scalar_fmax = {
     gen_helper_vfp_maxs,
     gen_helper_vfp_maxd,
 };
-TRANS(FMAX_s, do_fp3_scalar, a, &f_scalar_fmax, a->rn)
+static const FPScalar f_scalar_fmax_ah = {
+    gen_helper_vfp_ah_maxh,
+    gen_helper_vfp_ah_maxs,
+    gen_helper_vfp_ah_maxd,
+};
+TRANS(FMAX_s, do_fp3_scalar_2fn, a, &f_scalar_fmax, &f_scalar_fmax_ah, a->rn)
 
 static const FPScalar f_scalar_fmin = {
     gen_helper_vfp_minh,
     gen_helper_vfp_mins,
     gen_helper_vfp_mind,
 };
-TRANS(FMIN_s, do_fp3_scalar, a, &f_scalar_fmin, a->rn)
+static const FPScalar f_scalar_fmin_ah = {
+    gen_helper_vfp_ah_minh,
+    gen_helper_vfp_ah_mins,
+    gen_helper_vfp_ah_mind,
+};
+TRANS(FMIN_s, do_fp3_scalar_2fn, a, &f_scalar_fmin, &f_scalar_fmin_ah, a->rn)
 
 static const FPScalar f_scalar_fmaxnm = {
     gen_helper_vfp_maxnumh,
-- 
2.34.1

