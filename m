Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3443018njb;
        Tue, 10 Dec 2024 08:25:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqH+EJSOQRY/0GqG/dDHpHBGHr2rCs6I2mSS8m/PtrrKq54XurKMeFBnH8zB5B9HLx6uYUIrqXwByzjg==@linaro.org
X-Google-Smtp-Source: AGHT+IHeD4UcPv5LRCimE5jaNXkgv5SZ4+DP29MfQpAKc7b6280hh2f2CDm9ypAkqR/QISiQ7dIL
X-Received: by 2002:a05:6122:390b:b0:515:d2d1:7c0d with SMTP id 71dfb90a1353d-515fca095afmr16272330e0c.5.1733847952385;
        Tue, 10 Dec 2024 08:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847952; cv=none;
        d=google.com; s=arc-20240605;
        b=fngeXzSRZXTj6JO6mhF/6KGwje7oofEKyaMK7rOBdtZ1UhMFJcEIRtGsrNLREXnhMT
         DREwXxTh7DVyb8G2tz9T0vOChKJfX5OIeeqovJc6+leedMEHJSYbZxDlCemUHLUJ1HIP
         RcUS/nKdrUR+XPRq9ULu7BLHSqOmWWD7kw+KI99MVMbdGiC7Z17A9tcARIox0JZomJ7O
         ZcbM9/k28rtSTQuilBtN8OaZ9IemmiTwh7RA04j90/gTIgycdwScVqsNyOzRNAX7Fz1X
         S+ZIsvsS3fbW9bAlwxLqSKaBKUgcDA3d/+MqaV7dJ6gdUbDu3o5crETieRRn4/LXS+QB
         N11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GYWISUXxM/3Drujw1rOpjgKt5oRl+JDgu9IdrFJ+rCM=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Bs0DJgIvzPuHl5MVyfb6KKC35qB7Zgt0H1g1cmCqXR468h2mvT9bhsTMQYkCbqfhuF
         GbkWwQAcYdbuXSUPQK6NEQqhlR8sveBavtMZmLfvkwjtm3mIwM62VPInpQugII/9Uf/g
         eqNz+/PMsTAPsE/CnM7sCOjek2tOVj5bp1atDfg++clI75kXR4y0CIuKFBV+hEY4uwbC
         xgzhHrjH/MgdyRU7jyjsmWKRnV4lp4OyRI6aEC7N/3pUQQIeQjg6yUxZVv5xG90nZJO8
         VgT45pt7X3/QF9JV9Ys8Ez55v+sR5/h2rnOH+vYcbtWKzGeqTeinqJ6iuzUY/k5a0RR9
         kCng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CF94pKOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-518a339c114si91e0c.297.2024.12.10.08.25.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:25:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CF94pKOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL31X-0005jl-IG; Tue, 10 Dec 2024 11:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL31M-0004x2-1U
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:23:37 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL31I-0007MN-Fu
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:23:35 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3022c6155edso14310051fa.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847811; x=1734452611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GYWISUXxM/3Drujw1rOpjgKt5oRl+JDgu9IdrFJ+rCM=;
 b=CF94pKOju8m6JqoD8NitpRcwOqQKFWSJzm8giSdspYZBBBRJl9z4nMH6tuKiEn7aSZ
 L05jItDE8c1E2AUiDlj+Tm/I2Lx3M6qpGvkzE20MU407u6KNha4m+OeL/vCQWmClQEvV
 76AM+IZBqqZmCTtAYmwKKWKo5uhbW6HOx/UWP2/IgHEnawG8PbuRbL24hoYDoZ/8VOjx
 g02F37QfKo875tplF8VqmKum2H1Xsexhq6ZCQze6z5OeVOTZvy4VgIePeKmcrLzbEErp
 7DYUYre9A5V1LNv9DBdoHmoooX4LhslfFC3my38fEXW+FTJ2dDQIEe0TUH+iHe4EpLSN
 4zfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847811; x=1734452611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GYWISUXxM/3Drujw1rOpjgKt5oRl+JDgu9IdrFJ+rCM=;
 b=itSmGBFQGUEyZm8LeMIuF89lCcRUYb8wWTMXvS/mYlieGkOaB4yzZKhIR3OetUDpBj
 rsZ1HNLLYTiql/hcYEVG7bDI2WPZY/JoVpnxEzR08R4IJxySN1J2SaTbROCHobXh8uxp
 7IHB+21mE2V31jOlD/C0DjjnLtLoL4/u1Nyz/T6XFUgFUQe0gKiZlm2yt+HQ2BW/6qFt
 i523v789Yc5SqFgSPQS0byvRG2zE1TjmltuyOf+BIvkwEnHCwjJIwnEE1RW13VNFox8G
 cY7E7hQJduQsq7UjLvhXzoZ9QXzvk89fKjsb3NmdvFgXD8BShNSxlTdgIOSfeYygts0m
 xL8Q==
X-Gm-Message-State: AOJu0Yzx3LvB89DfvvyCKaFzVIY3CqaVRhxqhw/CGl6S43FD10O6zPA0
 xrNT50SFFAg5yuspwb5T1tWU2EtaKX10/saQ10yLzjxjfQvdxrowSvJdCy54W0HB9NNF+IRmfZ8
 eGXmNkq46
X-Gm-Gg: ASbGnctDtHfOaJNPNuCWA+tnbkZXu9OMWu1gvCKi4yxkYDZWDk+y1jOjqGXJjoibTTK
 oJHpRMHy/KKE1N6RA8BAVGWYIwwTFyq2Hk0DBXBGBiXKdNfZVosfSNSRULucTAFkFOnDSW2UtcE
 C3MDiEIoBr7sNhT5p70uBix3FQKWz3arcw9smDCld1nGjBZ5Ko5R7eaMy/WWulvJDeVTxWuyGLY
 05eRu1BQmuMMt4z1EH5yQfjzIHPUoUkjfDqhQu6UTcCdTmDvu9X1dGlebE=
X-Received: by 2002:a05:6512:3da3:b0:53e:350a:7298 with SMTP id
 2adb3069b0e04-540240d2de6mr1384800e87.25.1733847810812; 
 Tue, 10 Dec 2024 08:23:30 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:23:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 41/69] target/arm: Convert CMGT, CMGE, GMLT, GMLE,
 CMEQ (zero) to decodetree
Date: Tue, 10 Dec 2024 10:17:05 -0600
Message-ID: <20241210161733.1830573-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: XpypHtIuKKR8

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 94 +++++++++++-----------------------
 target/arm/tcg/a64.decode      | 10 ++++
 2 files changed, 40 insertions(+), 64 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 894c33ed1f..c737a35121 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8902,6 +8902,22 @@ static bool do_scalar1_d(DisasContext *s, arg_rr *a, ArithOneOp *f)
 TRANS(ABS_s, do_scalar1_d, a, tcg_gen_abs_i64)
 TRANS(NEG_s, do_scalar1_d, a, tcg_gen_neg_i64)
 
+static bool do_cmop0_d(DisasContext *s, arg_rr *a, TCGCond cond)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 t = read_fp_dreg(s, a->rn);
+        tcg_gen_negsetcond_i64(cond, t, t, tcg_constant_i64(0));
+        write_fp_dreg(s, a->rd, t);
+    }
+    return true;
+}
+
+TRANS(CMGT0_s, do_cmop0_d, a, TCG_COND_GT)
+TRANS(CMGE0_s, do_cmop0_d, a, TCG_COND_GE)
+TRANS(CMLE0_s, do_cmop0_d, a, TCG_COND_LE)
+TRANS(CMLT0_s, do_cmop0_d, a, TCG_COND_LT)
+TRANS(CMEQ0_s, do_cmop0_d, a, TCG_COND_EQ)
+
 static bool do_gvec_fn2(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 {
     if (!a->q && a->esz == MO_64) {
@@ -8918,6 +8934,11 @@ TRANS(NEG_v, do_gvec_fn2, a, tcg_gen_gvec_neg)
 TRANS(NOT_v, do_gvec_fn2, a, tcg_gen_gvec_not)
 TRANS(CNT_v, do_gvec_fn2, a, gen_gvec_cnt)
 TRANS(RBIT_v, do_gvec_fn2, a, gen_gvec_rbit)
+TRANS(CMGT0_v, do_gvec_fn2, a, gen_gvec_cgt0)
+TRANS(CMGE0_v, do_gvec_fn2, a, gen_gvec_cge0)
+TRANS(CMLT0_v, do_gvec_fn2, a, gen_gvec_clt0)
+TRANS(CMLE0_v, do_gvec_fn2, a, gen_gvec_cle0)
+TRANS(CMEQ0_v, do_gvec_fn2, a, gen_gvec_ceq0)
 
 static bool do_gvec_fn2_bhs(DisasContext *s, arg_qrr_e *a, GVecGen2Fn *fn)
 {
@@ -9229,21 +9250,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
      * The caller only need provide tcg_rmode and tcg_fpstatus if the op
      * requires them.
      */
-    TCGCond cond;
-
     switch (opcode) {
-    case 0xa: /* CMLT */
-        cond = TCG_COND_LT;
-    do_cmop:
-        /* 64 bit integer comparison against zero, result is test ? -1 : 0. */
-        tcg_gen_negsetcond_i64(cond, tcg_rd, tcg_rn, tcg_constant_i64(0));
-        break;
-    case 0x8: /* CMGT, CMGE */
-        cond = u ? TCG_COND_GE : TCG_COND_GT;
-        goto do_cmop;
-    case 0x9: /* CMEQ, CMLE */
-        cond = u ? TCG_COND_LE : TCG_COND_EQ;
-        goto do_cmop;
     case 0x2f: /* FABS */
         gen_vfp_absd(tcg_rd, tcg_rn);
         break;
@@ -9290,6 +9297,9 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x4: /* CLS, CLZ */
     case 0x5: /* NOT */
     case 0x7: /* SQABS, SQNEG */
+    case 0x8: /* CMGT, CMGE */
+    case 0x9: /* CMEQ, CMLE */
+    case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
         g_assert_not_reached();
     }
@@ -9633,19 +9643,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     TCGv_ptr tcg_fpstatus;
 
     switch (opcode) {
-    case 0xa: /* CMLT */
-        if (u) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* fall through */
-    case 0x8: /* CMGT, CMGE */
-    case 0x9: /* CMEQ, CMLE */
-        if (size != 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0x12: /* SQXTUN */
         if (!u) {
             unallocated_encoding(s);
@@ -9731,6 +9728,9 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x3: /* USQADD / SUQADD */
     case 0x7: /* SQABS / SQNEG */
+    case 0x8: /* CMGT, CMGE */
+    case 0x9: /* CMEQ, CMLE */
+    case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
         return;
@@ -10103,19 +10103,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         }
         handle_shll(s, is_q, size, rn, rd);
         return;
-    case 0xa: /* CMLT */
-        if (u == 1) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* fall through */
-    case 0x8: /* CMGT, CMGE */
-    case 0x9: /* CMEQ, CMLE */
-        if (size == 3 && !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0xc ... 0xf:
     case 0x16 ... 0x1f:
     {
@@ -10289,6 +10276,9 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     case 0x4: /* CLS, CLZ */
     case 0x5: /* CNT, NOT, RBIT */
     case 0x7: /* SQABS, SQNEG */
+    case 0x8: /* CMGT, CMGE */
+    case 0x9: /* CMEQ, CMLE */
+    case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
         return;
@@ -10309,30 +10299,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         tcg_rmode = NULL;
     }
 
-    switch (opcode) {
-    case 0x8: /* CMGT, CMGE */
-        if (u) {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cge0, size);
-        } else {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cgt0, size);
-        }
-        return;
-    case 0x9: /* CMEQ, CMLE */
-        if (u) {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_cle0, size);
-        } else {
-            gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_ceq0, size);
-        }
-        return;
-    case 0xa: /* CMLT */
-        gen_gvec_fn2(s, is_q, rd, rn, gen_gvec_clt0, size);
-        return;
-    case 0x4: /* CLZ, CLS */
-    case 0x5: /* CNT, NOT, RBIT */
-    case 0xb:
-        g_assert_not_reached();
-    }
-
     if (size == 3) {
         /* All 64-bit element operations can be shared with scalar 2misc */
         int pass;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index bac81eec7e..247d3a7bda 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1635,6 +1635,11 @@ SQABS_s         0101 1110 ..1 00000 01111 0 ..... .....     @rr_e
 SQNEG_s         0111 1110 ..1 00000 01111 0 ..... .....     @rr_e
 ABS_s           0101 1110 111 00000 10111 0 ..... .....     @rr
 NEG_s           0111 1110 111 00000 10111 0 ..... .....     @rr
+CMGT0_s         0101 1110 111 00000 10001 0 ..... .....     @rr
+CMGE0_s         0111 1110 111 00000 10001 0 ..... .....     @rr
+CMEQ0_s         0101 1110 111 00000 10011 0 ..... .....     @rr
+CMLE0_s         0111 1110 111 00000 10011 0 ..... .....     @rr
+CMLT0_s         0101 1110 111 00000 10101 0 ..... .....     @rr
 
 # Advanced SIMD two-register miscellaneous
 
@@ -1647,3 +1652,8 @@ CLZ_v           0.10 1110 ..1 00000 01001 0 ..... .....     @qrr_e
 CNT_v           0.00 1110 001 00000 01011 0 ..... .....     @qrr_b
 NOT_v           0.10 1110 001 00000 01011 0 ..... .....     @qrr_b
 RBIT_v          0.10 1110 011 00000 01011 0 ..... .....     @qrr_b
+CMGT0_v         0.00 1110 ..1 00000 10001 0 ..... .....     @qrr_e
+CMGE0_v         0.10 1110 ..1 00000 10001 0 ..... .....     @qrr_e
+CMEQ0_v         0.00 1110 ..1 00000 10011 0 ..... .....     @qrr_e
+CMLE0_v         0.10 1110 ..1 00000 10011 0 ..... .....     @qrr_e
+CMLT0_v         0.00 1110 ..1 00000 10101 0 ..... .....     @qrr_e
-- 
2.43.0

