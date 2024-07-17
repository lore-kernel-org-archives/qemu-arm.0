Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp615615njk;
        Tue, 16 Jul 2024 23:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVIw4Ed1cxoCJ3fOegWpa25vv0GHUucxwMs4mSjniQV7qkLkJLMKHsTmzC53LJDEc9UO18TGyeJ8tKIBFfP22ZHH5oW2Jd
X-Google-Smtp-Source: AGHT+IFLAjrkBJCat+MvFV9T498VHtNRXEDq9RhrdN9y6T2EPphTqyXE4gSfHM+U2dXte/GiEik8
X-Received: by 2002:ac8:7dc6:0:b0:447:f105:e6dc with SMTP id d75a77b69052e-44f8619126cmr9965811cf.4.1721196708718;
        Tue, 16 Jul 2024 23:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196708; cv=none;
        d=google.com; s=arc-20160816;
        b=U76d5wazRyAag8ylPz+hcBlu0i+Az+F77I47qk/q4I7FcujkJJkjdCgJ3c8d1U6sS3
         mk5pt+8pOx1bt9mug+NvNxi4XelGrFrcfzabDHgbJbRuVopWk4wgHVqv09nXTAyj2nY2
         TA5eaBhiqesVkPq45nstmM1PKKlFXPyHEvpiayXc7Ap7f3Mrqggkozp4xSnhKxUAVCwS
         Ws+SCfAs3wkaMHsNv4HzdiyB2Wasv3Yl1prsvhmYlYmHwV+IEqoP6FQbr4d/8iiwEsiG
         T9VCVDJO3IALeLzNIIEvywV4E9/z/wY7GxydfFnYC4+e10xJ/Dg/WbE/3TXwLxADx9ri
         Ibng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=91Gzd3eqh7/yDhre1ZyA2JmYLoJ2jcB1JHF4mrb/Guk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=NO1Z6uZyEQ/p5BMC2ebfqUh9BiBjh5eq8UIMnbJWiHYxRzpuvKM6tV/lrRsDItJTB7
         F03ZmW2GNImhCL5zPEfo63xkQzl8X/1J4SXLozOS4gubxu/CggvyosGrEr+STXfWjN46
         pY6khp6Wpo8FtwTg0PyQ9mWoxOSSyZ0GeMPBflv5IPe+09o2EWmxJAXAv9yc4Vc2S696
         xyEGr07VvY2hlL1dfZIS/nPTztR27h+oHqSu1bVHJjq3Pq6K3k3oe6tEyYaLdPwAhdxX
         rh3I/XIiFHudD+dBFJG4Yu5WOkUE6bU9b0+Lv68S7KZa3vF1gBKtOEW3v5EaQ2ZfiVlf
         H5EA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tzAuwcLt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b79dc81si91841341cf.220.2024.07.16.23.11.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:11:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tzAuwcLt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxrT-00061t-F1; Wed, 17 Jul 2024 02:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxr7-0004TR-7b
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:37 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxr4-00033p-Lq
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:36 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3d9ddfbbc58so3768249b6e.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196573; x=1721801373; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91Gzd3eqh7/yDhre1ZyA2JmYLoJ2jcB1JHF4mrb/Guk=;
 b=tzAuwcLt6Td+L1vHIaSXXpnetGsVjz/VarJSLaD4CXAwedCER9ZfogpVG8gK4WMurm
 p0r1s1Bywsab3wE27QpFsH2VwMt78yl0QToTtuhfeJS7VWLrJlSnP1H7iIO5Uoh6cerN
 TqBFC0A+82XRQRa3ynr1futaDK7fmmCbYQ84qgLL72J84snMCxWtYv89q5Qqxs1TeZ8+
 GAAaxTYSv3qN2EiJh6MBzEiIjKqo22bIPEiiiiAqXfBVFvrIrDuXtwAAqpw0jXoOsVP5
 8xlBOCJSnYBon3L0Y0Hc58AktctixKEnYjpiXwU7rdems2WsPE9ExkZVhhF1aDW1YbvS
 EWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196573; x=1721801373;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91Gzd3eqh7/yDhre1ZyA2JmYLoJ2jcB1JHF4mrb/Guk=;
 b=VN33kwjs8SWqwM4CjTeJGmNSiC3l1/VoXnDpdcPh9BOpAjC7YPXrZyFJL3WatLcOoq
 GsRIrdZ4mIfE3HkZe8izBUEClTifdeXB/EEtGFz00S1MWXIAjrmU3wzcZh8tG4D5jAfi
 NUeNC1jE/CIPTzG2Xyb29N3Zezw/lY+cGVxoZkcK8LrGmU++u31BQhJn2ntakKhAl9FD
 6i2xVVhGVZd8JtGMu1YmV30HD4h0JyXHPvXXCTIW94V0eYbyPBgZJgD7DX9kYTw6pm+9
 0yuxYprJIbtBS9rRTScucESmDjpSGQo+EZ8EkeZGwIR3GLlliUS6NIGAGOUb+tjl5Jx7
 zDng==
X-Gm-Message-State: AOJu0YzwR10GGMII7/x3N58yBvTVe8Umzg76A10FLxoaZAwdxmfuCj8s
 p0N6VyXcvBbv1fcznUoMX5OCGbwHLKGOGbZDEsV9m4GVoYKXxBksBRtDU4GFE0Zxz0jm4aUR8OO
 L5AA=
X-Received: by 2002:a05:6808:2227:b0:3d2:2aa8:3b2c with SMTP id
 5614622812f47-3dad1f52425mr1097701b6e.33.1721196573391; 
 Tue, 16 Jul 2024 23:09:33 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 09/17] target/arm: Convert MOVI, FMOV, ORR,
 BIC (vector immediate) to decodetree
Date: Wed, 17 Jul 2024 16:08:55 +1000
Message-ID: <20240717060903.205098-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: wLknq8H1t1h3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 117 ++++++++++++++-------------------
 target/arm/tcg/a64.decode      |   9 +++
 2 files changed, 59 insertions(+), 67 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6582816e4e..1fa9dc3172 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6872,6 +6872,52 @@ static bool trans_FMOVI_s(DisasContext *s, arg_FMOVI_s *a)
     return true;
 }
 
+/*
+ * Advanced SIMD Modified Immediate
+ */
+
+static bool trans_FMOVI_v_h(DisasContext *s, arg_FMOVI_v_h *a)
+{
+    if (!dc_isar_feature(aa64_fp16, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        tcg_gen_gvec_dup_imm(MO_16, vec_full_reg_offset(s, a->rd),
+                             a->q ? 16 : 8, vec_full_reg_size(s),
+                             vfp_expand_imm(MO_16, a->abcdefgh));
+    }
+    return true;
+}
+
+static void gen_movi(unsigned vece, uint32_t dofs, uint32_t aofs,
+                     int64_t c, uint32_t oprsz, uint32_t maxsz)
+{
+    tcg_gen_gvec_dup_imm(MO_64, dofs, oprsz, maxsz, c);
+}
+
+static bool trans_Vimm(DisasContext *s, arg_Vimm *a)
+{
+    GVecGen2iFn *fn;
+
+    /* Handle decode of cmode/op here between ORR/BIC/MOVI */
+    if ((a->cmode & 1) && a->cmode < 12) {
+        /* For op=1, the imm will be inverted, so BIC becomes AND. */
+        fn = a->op ? tcg_gen_gvec_andi : tcg_gen_gvec_ori;
+    } else {
+        /* There is one unallocated cmode/op combination in this space */
+        if (a->cmode == 15 && a->op == 1 && a->q == 0) {
+            return false;
+        }
+        fn = gen_movi;
+    }
+
+    if (fp_access_check(s)) {
+        uint64_t imm = asimd_imm_const(a->abcdefgh, a->cmode, a->op);
+        gen_gvec_fn2i(s, a->q, a->rd, a->rd, imm, fn, MO_64);
+    }
+    return true;
+}
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -9051,69 +9097,6 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
     }
 }
 
-/* AdvSIMD modified immediate
- *  31  30   29  28                 19 18 16 15   12  11  10  9     5 4    0
- * +---+---+----+---------------------+-----+-------+----+---+-------+------+
- * | 0 | Q | op | 0 1 1 1 1 0 0 0 0 0 | abc | cmode | o2 | 1 | defgh |  Rd  |
- * +---+---+----+---------------------+-----+-------+----+---+-------+------+
- *
- * There are a number of operations that can be carried out here:
- *   MOVI - move (shifted) imm into register
- *   MVNI - move inverted (shifted) imm into register
- *   ORR  - bitwise OR of (shifted) imm with register
- *   BIC  - bitwise clear of (shifted) imm with register
- * With ARMv8.2 we also have:
- *   FMOV half-precision
- */
-static void disas_simd_mod_imm(DisasContext *s, uint32_t insn)
-{
-    int rd = extract32(insn, 0, 5);
-    int cmode = extract32(insn, 12, 4);
-    int o2 = extract32(insn, 11, 1);
-    uint64_t abcdefgh = extract32(insn, 5, 5) | (extract32(insn, 16, 3) << 5);
-    bool is_neg = extract32(insn, 29, 1);
-    bool is_q = extract32(insn, 30, 1);
-    uint64_t imm = 0;
-
-    if (o2) {
-        if (cmode != 0xf || is_neg) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* FMOV (vector, immediate) - half-precision */
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            unallocated_encoding(s);
-            return;
-        }
-        imm = vfp_expand_imm(MO_16, abcdefgh);
-        /* now duplicate across the lanes */
-        imm = dup_const(MO_16, imm);
-    } else {
-        if (cmode == 0xf && is_neg && !is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-        imm = asimd_imm_const(abcdefgh, cmode, is_neg);
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (!((cmode & 0x9) == 0x1 || (cmode & 0xd) == 0x9)) {
-        /* MOVI or MVNI, with MVNI negation handled above.  */
-        tcg_gen_gvec_dup_imm(MO_64, vec_full_reg_offset(s, rd), is_q ? 16 : 8,
-                             vec_full_reg_size(s), imm);
-    } else {
-        /* ORR or BIC, with BIC negation to AND handled above.  */
-        if (is_neg) {
-            gen_gvec_fn2i(s, is_q, rd, rd, imm, tcg_gen_gvec_andi, MO_64);
-        } else {
-            gen_gvec_fn2i(s, is_q, rd, rd, imm, tcg_gen_gvec_ori, MO_64);
-        }
-    }
-}
-
 /*
  * Common SSHR[RA]/USHR[RA] - Shift right (optional rounding/accumulate)
  *
@@ -10593,8 +10576,10 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     bool is_u = extract32(insn, 29, 1);
     bool is_q = extract32(insn, 30, 1);
 
-    /* data_proc_simd[] has sent immh == 0 to disas_simd_mod_imm. */
-    assert(immh != 0);
+    if (immh == 0) {
+        unallocated_encoding(s);
+        return;
+    }
 
     switch (opcode) {
     case 0x08: /* SRI */
@@ -11602,8 +11587,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
 static const AArch64DecodeTable data_proc_simd[] = {
     /* pattern  ,  mask     ,  fn                        */
     { 0x0e200800, 0x9f3e0c00, disas_simd_two_reg_misc },
-    /* simd_mod_imm decode is a subset of simd_shift_imm, so must precede it */
-    { 0x0f000400, 0x9ff80400, disas_simd_mod_imm },
     { 0x0f000400, 0x9f800400, disas_simd_shift_imm },
     { 0x5e200800, 0xdf3e0c00, disas_simd_scalar_two_reg_misc },
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index de763d3f12..d4dfc5f772 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1184,3 +1184,12 @@ FMINV_s         0110 1110 10 11000 01111 10 ..... .....     @rr_q1e2
 # Floating-point Immediate
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
+
+# Advanced SIMD Modified Immediate
+
+%abcdefgh       16:3 5:5
+
+FMOVI_v_h       0 q:1 00 1111 00000 ... 1111 11 ..... rd:5  %abcdefgh
+
+# MOVI, MVNI, ORR, BIC, FMOV are all intermixed via cmode.
+Vimm            0 q:1 op:1 0 1111 00000 ... cmode:4 01 ..... rd:5 %abcdefgh
-- 
2.43.0

