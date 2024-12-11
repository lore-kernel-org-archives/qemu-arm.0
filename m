Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4193916njb;
        Wed, 11 Dec 2024 08:37:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUVb1NhLV0vHJC1B9xY8+6QyGLReN3UCMdqfoSXyzObszX1w4dlaescNGcQsk3nEpUxSd0UCz9djK994Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFdCWgCiMWGGn/YQO8ACxz+BGts9UvErSLfHVCNOAcaGg7XUx3re/Rnu9Qv4YrRV57rvHIf
X-Received: by 2002:ac8:57c8:0:b0:467:8734:9944 with SMTP id d75a77b69052e-4679615b18dmr275541cf.5.1733935077234;
        Wed, 11 Dec 2024 08:37:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733935077; cv=none;
        d=google.com; s=arc-20240605;
        b=TAvwS56fs0JGvfDr1BfKGRkd5O00PzppeDcL0fc4RQO0zYMzwBcQfRxdVg45PNYFDC
         TY/JanmhULTggWwc8SzB81lF9EEpYj7/j9bA8EOIl/AicXMpUASjb54TmBUBdTCCaMjA
         rtjmptvfoIIFoxxpYncNuV7N2Awl3VS/mLF+FbqXld1YP28fCESbNK5OEHofmzqBSOow
         Dt98N0Y09fKXJTaE4pnwVWdkUC1LrSHYrxpu82iHA6Tiz3utdhteVKK3AxvDCq8J14+K
         +30gdwYkLO985Mn9+Oddsa4geWYEzpHA7pz30nNpvhFrNaZhsdq5LgsN4ocAhL6horCc
         nW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hzXVAFhwLhHjMlw7+JtsqHzAv3kMgsjwAUaa310i+wU=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=ZRtMMaiXOy0LCbxflu9DsPMSz1aRLk22XpJgZ42771MkaINKeTSsxHLRL3rNmzHPYD
         KSFlLef2IaHryw0fetWpR8MkLN/KOgekNtaryqH0PFlkmjQEawzIUt42+OQNnTUlyzbX
         yAekWNnwDoVSDrtHHiB2Y8Lw7TnX7r9A99NgyJlhwFbfK9ZzLMm6tcgLEqqZiZ4NgD1Z
         ZxLEZyGAxs9ZyA6HKQtLhWwbnPX3bcNI5MZP0B1wyEeCkEzqXAA4BRGAltx2aOvu1Ugg
         q5ewEQsjCLKIQm3kq77wAT3nIoeylpDFYe2yJ0U63tsfi7BD7mBdLFM0/vXh70HrNS4r
         xFNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UmH/0vsb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46780ab8328si40408401cf.174.2024.12.11.08.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 08:37:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="UmH/0vsb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLPe3-0008Nh-5m; Wed, 11 Dec 2024 11:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdZ-0006Vu-KV
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:33 -0500
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tLPdX-0001TK-OD
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 11:32:33 -0500
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-46769b34cbfso49547041cf.0
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 08:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733934751; x=1734539551; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzXVAFhwLhHjMlw7+JtsqHzAv3kMgsjwAUaa310i+wU=;
 b=UmH/0vsbhbnxRJQ97pHpHUYzGmSFkYL3JLkRvTXMfdTMft7K9Xtp02If19oNujqBik
 d0/YrQFgns+OOpnOutUKZo2LejA4fx/wULddfS+u8x0gRiYbwD6O9Ek/I1QKE0hcmKOn
 w/aBydYN7isvDm7r6raRq3mE3W3Afj8LVoIoV0f3F3Q3EoLAXCE6wNe9gtZ8RracgkNZ
 X5Pb8LrPrSzlQ4FNF/8IlTACMjd0nDTo02YOVi10J16g7n5+uJciaE65gRN0ygMlHFBV
 5JnFBGInbHqKEgDNx0SkbS6TtSDYiPesjQMbC8ux3mEuEcOAUb3JOlhJEToW4Qi0BAcE
 Jttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733934751; x=1734539551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hzXVAFhwLhHjMlw7+JtsqHzAv3kMgsjwAUaa310i+wU=;
 b=BmGjdR+VLvWngerglo0FQhq38RxKiO2uOr59mB/sd7TVZxZOufZzqhcKxDG+ltNOC2
 QVOgSw8XbWycylXuA2FbprL+IRykbMW6mnsjtJLTRucoqlif6QnaSAt4qZiG1SHCwgMf
 Wgvxv6LnnXidHIQ4C8Sl0/i8WDiEPiwgSyuA2iswfmVMpGHWjwj8jloVZVRqw3Q3Z014
 eoBRmrF532p8ge35OSZ8OxT37PrqgOraWKRaKU0HEOjm8EgVVt05BeV6CKCRvFvxXYJB
 QiUTzugY8GiyW5AuGOsEml6IXz4To7DyvpUzg9OgqMx0OKVlzlrYbD/FxRQw0XRca35d
 lExg==
X-Gm-Message-State: AOJu0YyPSBjddqO9gDfC1G7sEjO5kkwvnEpL/If4xzr8NjuCfRURqv6e
 DeL3gfOE9UqrYPB5ia5cBZvO8gxY0jNzmM32USAUeyMd6foBYAOzyZCyT2Hm6Ds=
X-Gm-Gg: ASbGnctBUsOgOq6h2MoIl3JWWNIFzye9QEV2EzfG60AUTzHXqvtswglaw3WCdGqkOxb
 BNArU243HmWrWlhUtWPzg+1UVm7v36bdzCpNPKT/qHppfPEdBSw1iRq5e/IaIUyPtJxL6OycBnU
 yhkw/x+y1Hh5RGdaKF5tjSCgmMZpE0P36D1rO8NtPUOcj0PMB0R5KIojuPh3vuncaaYh2kW85Di
 aMfgNDAIb85S+QQREZu0/6iOXmdkMDk4aXL7XOYHPfFpQv7KhjU8ujGm1ttsA==
X-Received: by 2002:a05:622a:114e:b0:466:b29a:9b10 with SMTP id
 d75a77b69052e-4678936287amr61023061cf.42.1733934750824; 
 Wed, 11 Dec 2024 08:32:30 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46755db613csm43849381cf.70.2024.12.11.08.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 08:32:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 36/69] target/arm: Convert ABS, NEG to decodetree
Date: Wed, 11 Dec 2024 10:30:03 -0600
Message-ID: <20241211163036.2297116-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211163036.2297116-1-richard.henderson@linaro.org>
References: <20241211163036.2297116-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8QzOd4349D99

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 46 +++++++++++++++++++++++-----------
 target/arm/tcg/a64.decode      |  4 +++
 2 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9bb9668d11..c697f0e944 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8889,6 +8889,33 @@ static const ENVScalar1 f_scalar_sqneg = {
 TRANS(SQNEG_s, do_env_scalar1, a, &f_scalar_sqneg)
 TRANS(SQNEG_v, do_env_vector1, a, &f_scalar_sqneg)
 
+static bool do_scalar1_d(DisasContext *s, arg_rr *a, ArithOneOp *f)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 t = read_fp_dreg(s, a->rn);
+        f(t, t);
+        write_fp_dreg(s, a->rd, t);
+    }
+    return true;
+}
+
+TRANS(ABS_s, do_scalar1_d, a, tcg_gen_abs_i64)
+TRANS(NEG_s, do_scalar1_d, a, tcg_gen_neg_i64)
+
+static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
+{
+    if (!a->q && a->esz == MO_64) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        gen_gvec_fn2(s, a->q, a->rd, a->rn, fn, a->esz);
+    }
+    return true;
+}
+
+TRANS(ABS_v, do_gvec_fn2, a, tcg_gen_gvec_abs)
+TRANS(NEG_v, do_gvec_fn2, a, tcg_gen_gvec_neg)
+
 /* Common vector code for handling integer to FP conversion */
 static void handle_simd_intfp_conv(DisasContext *s, int rd, int rn,
                                    int elements, int is_signed,
@@ -9213,13 +9240,6 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x9: /* CMEQ, CMLE */
         cond = u ? TCG_COND_LE : TCG_COND_EQ;
         goto do_cmop;
-    case 0xb: /* ABS, NEG */
-        if (u) {
-            tcg_gen_neg_i64(tcg_rd, tcg_rn);
-        } else {
-            tcg_gen_abs_i64(tcg_rd, tcg_rn);
-        }
-        break;
     case 0x2f: /* FABS */
         gen_vfp_absd(tcg_rd, tcg_rn);
         break;
@@ -9264,6 +9284,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
         break;
     default:
     case 0x7: /* SQABS, SQNEG */
+    case 0xb: /* ABS, NEG */
         g_assert_not_reached();
     }
 }
@@ -9614,7 +9635,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
         /* fall through */
     case 0x8: /* CMGT, CMGE */
     case 0x9: /* CMEQ, CMLE */
-    case 0xb: /* ABS, NEG */
         if (size != 3) {
             unallocated_encoding(s);
             return;
@@ -9705,6 +9725,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x3: /* USQADD / SUQADD */
     case 0x7: /* SQABS / SQNEG */
+    case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
         return;
     }
@@ -10103,7 +10124,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         /* fall through */
     case 0x8: /* CMGT, CMGE */
     case 0x9: /* CMEQ, CMLE */
-    case 0xb: /* ABS, NEG */
         if (size == 3 && !is_q) {
             unallocated_encoding(s);
             return;
@@ -10280,6 +10300,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x3: /* SUQADD, USQADD */
     case 0x7: /* SQABS, SQNEG */
+    case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
         return;
     }
@@ -10324,12 +10345,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clt0, size);
         return;
     case 0xb:
-        if (u) { /* ABS, NEG */
-            gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_neg, size);
-        } else {
-            gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_abs, size);
-        }
-        return;
+        g_assert_not_reached();
     }
 
     if (size == 3) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 17ecdac9db..f112951df7 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1632,8 +1632,12 @@ SQRSHRUN_si     0111 11110 .... ... 10001 1 ..... .....     @shri_s
 
 SQABS_s         0101 1110 ..1 00000 01111 0 ..... .....     @rr_e
 SQNEG_s         0111 1110 ..1 00000 01111 0 ..... .....     @rr_e
+ABS_s           0101 1110 111 00000 10111 0 ..... .....     @rr
+NEG_s           0111 1110 111 00000 10111 0 ..... .....     @rr
 
 # Advanced SIMD two-register miscellaneous
 
 SQABS_v         0.00 1110 ..1 00000 01111 0 ..... .....     @qrr_e
 SQNEG_v         0.10 1110 ..1 00000 01111 0 ..... .....     @qrr_e
+ABS_v           0.00 1110 ..1 00000 10111 0 ..... .....     @qrr_e
+NEG_v           0.10 1110 ..1 00000 10111 0 ..... .....     @qrr_e
-- 
2.43.0

