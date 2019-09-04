Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1142380wrp;
        Wed, 4 Sep 2019 13:04:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3nxut3a+FDJQrh/pmLprbyzWSIUHYvLT1SCudDtbIeMcBM7VootT7mJlGoCyyynp9PF4R
X-Received: by 2002:a17:906:2288:: with SMTP id p8mr11590013eja.250.1567627470762;
        Wed, 04 Sep 2019 13:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567627470; cv=none;
        d=google.com; s=arc-20160816;
        b=pnsRcj0Zc12kZ4z7u2xhSz66Mns+yEphkAqaxk8bUqKP7BsWlyMk9uiCmSmNf6hkvO
         UF1kZZRuYRShwSJBFU7jFNUW1Sywilk0OO8iVEWF9Ds6nu6naaR2h2ZxW6AnH/FHpxxy
         3NqGtwYK319aQVfgA/N/DjSDia//0bx/p7bzgvelcRZwmyib1Xm8qAkIn5XOgyteIbO6
         jtfEDGkPyHLMbFJdR+lmNrsKTn1H8Z326t4vZ1Z8QWRnpOcnUSvV/9W7lWzC9dH91vZQ
         TfJGW9bgdLBn8TZ+vI+5bkHVtQuhCVy9O0AYm6+tddXrUP1eASIF6fAyi2NBEWTeMztC
         m4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=F1/Ahuhtqa9fDkalmARoAPOIqYFu7mrSrkJmXtopKzY=;
        b=S6ydAs0nRLTqAZy2YKju7Ksd4ReHYcexyvXSVMaFcNmNMK54HKBGMj4dZFtwG9XEEW
         miPYrlW/uVQOAQmzENSzAQcON6nh9i4yQ7X/Di0MSk0kyUBt/paD9lQkNnNHuCDXljQs
         OdY0seepHAUzjAvy+WGz5G+qr+97YAEo842FhNM1czcQA6mq2LUmTEp5U+Fg8EDy7DgE
         I37qEdqC/EdUVWezIqgZkLN2XhAe5zwdg1+2+eHY7wT2p0cLuDDDdStvpYa1xq4OB4FM
         xcUjhsx0DJjPHFNkdfxf7hMsxe/YCmYkVahusJZaAWLtOCrt73p5iA53C3m1TPIeL+Wk
         aDWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kL9yGJWU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c12si10881400edb.394.2019.09.04.13.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 13:04:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kL9yGJWU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5bW1-00063X-4d
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 16:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0I-0004rP-C9
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5b0C-0002WH-IP
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:42 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33374)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5b0C-0002VM-3h
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 15:31:36 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q10so8853638pfl.0
 for <qemu-arm@nongnu.org>; Wed, 04 Sep 2019 12:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F1/Ahuhtqa9fDkalmARoAPOIqYFu7mrSrkJmXtopKzY=;
 b=kL9yGJWUgF3tTv9NeL2J8Ul9ijgZnnFJ9tCLwcqvCqOJdyOi13iCjyLf/v9WMHgKXk
 kUF7Tqq1hnmdcDVhw2yZ/hf9m0hkstlF3NdZQkLd+cNY9Jw+0aabu6kz1Kss+b+/C6Sx
 gEncRaMeqnptFsLca6rvsoMCFPquucceL8SuVjQzz8BvfJKqIWwWs1scDNkV9qznk9Nj
 kEa2Z+rIbOPCy1ayspRWnOZl5xzO5ODz30LmplW+znWSB3FD1DF4KFjt5Mu1gXwIa6sn
 RKOaFsTvx1McDqtXk30zbnDxdEGXu7ge3gKgZX0wCvzI5Z4P11Fb2pSy7PkQcyIZdBEU
 1xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F1/Ahuhtqa9fDkalmARoAPOIqYFu7mrSrkJmXtopKzY=;
 b=HxhVRe/gOrBZUZgXgDHt0jr1rfMcM1hlk/9Zg17TxDLsBpVM0L/hOBbsSEN129V407
 NPPmccCnZeYVtl4jVqwS66btxCmVYFtzgk+e2qMRgz74XjbnB597MiZhOjGWLVDojIGD
 aX0CI/IF9a4rMX7xtUznGMY4vP7z9USs4p0YApj/UU6OSJGZPqEpC/xyMExlWeuDpYK7
 1coMQOp3xLnBnP7dWUiJUv5TH26ZOXygSY/d+djOk6tVWAeMgtmy9YDNCKFqfys8FGdV
 b7z1UMichR0sdVFkxOmwyeFYZYl89Cz0TWZn/kSohX4t0b38hbdjnrqDlkdI9OZKBaYB
 c6qg==
X-Gm-Message-State: APjAAAW2Zbt+x4xNQhSzEvy/52MqZJDzBRl0tKSBG8usUnfM+ORLiEeU
 C0yRevxvB7qqsjHMvi0BbFlrhKjLROU=
X-Received: by 2002:a17:90a:2464:: with SMTP id
 h91mr7002807pje.9.1567625494879; 
 Wed, 04 Sep 2019 12:31:34 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f6sm18999174pga.50.2019.09.04.12.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 12:31:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 12:30:16 -0700
Message-Id: <20190904193059.26202-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
References: <20190904193059.26202-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42c
Subject: [Qemu-arm] [PATCH v4 26/69] target/arm: Convert Signed multiply,
 signed and unsigned divide
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N0ZSjHJHSjqJ

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 490 ++++++++++++++++++-----------------------
 target/arm/a32.decode  |  22 ++
 target/arm/t32.decode  |  18 ++
 3 files changed, 258 insertions(+), 272 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a6de23c6d3..5b9b303467 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9544,18 +9544,228 @@ static bool trans_RBIT(DisasContext *s, arg_rr *a)
     return op_rr(s, a, gen_helper_rbit);
 }
 
+/*
+ * Signed multiply, signed and unsigned divide
+ */
+
+static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
+{
+    TCGv_i32 t1, t2;
+
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (m_swap) {
+        gen_swap_half(t2);
+    }
+    gen_smul_dual(t1, t2);
+
+    if (sub) {
+        /* This subtraction cannot overflow. */
+        tcg_gen_sub_i32(t1, t1, t2);
+    } else {
+        /*
+         * This addition cannot overflow 32 bits; however it may
+         * overflow considered as a signed operation, in which case
+         * we must set the Q flag.
+         */
+        gen_helper_add_setq(t1, cpu_env, t1, t2);
+    }
+    tcg_temp_free_i32(t2);
+
+    if (a->ra != 15) {
+        t2 = load_reg(s, a->ra);
+        gen_helper_add_setq(t1, cpu_env, t1, t2);
+        tcg_temp_free_i32(t2);
+    }
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SMLAD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, false, false);
+}
+
+static bool trans_SMLADX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, true, false);
+}
+
+static bool trans_SMLSD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, false, true);
+}
+
+static bool trans_SMLSDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, true, true);
+}
+
+static bool op_smlald(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
+{
+    TCGv_i32 t1, t2;
+    TCGv_i64 l1, l2;
+
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (m_swap) {
+        gen_swap_half(t2);
+    }
+    gen_smul_dual(t1, t2);
+
+    l1 = tcg_temp_new_i64();
+    l2 = tcg_temp_new_i64();
+    tcg_gen_ext_i32_i64(l1, t1);
+    tcg_gen_ext_i32_i64(l2, t2);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+
+    if (sub) {
+        tcg_gen_sub_i64(l1, l1, l2);
+    } else {
+        tcg_gen_add_i64(l1, l1, l2);
+    }
+    tcg_temp_free_i64(l2);
+
+    gen_addq(s, l1, a->ra, a->rd);
+    gen_storeq_reg(s, a->ra, a->rd, l1);
+    tcg_temp_free_i64(l1);
+    return true;
+}
+
+static bool trans_SMLALD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, false, false);
+}
+
+static bool trans_SMLALDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, true, false);
+}
+
+static bool trans_SMLSLD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, false, true);
+}
+
+static bool trans_SMLSLDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, true, true);
+}
+
+static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
+{
+    TCGv_i32 t1, t2;
+
+    if (s->thumb
+        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
+        : !ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    tcg_gen_muls2_i32(t2, t1, t1, t2);
+
+    if (a->ra != 15) {
+        TCGv_i32 t3 = load_reg(s, a->ra);
+        if (sub) {
+            /*
+             * For SMMLS, we need a 64-bit subtract.  Borrow caused by
+             * a non-zero multiplicand lowpart, and the correct result
+             * lowpart for rounding.
+             */
+            TCGv_i32 zero = tcg_const_i32(0);
+            tcg_gen_sub2_i32(t2, t1, zero, t3, t2, t1);
+            tcg_temp_free_i32(zero);
+        } else {
+            tcg_gen_add_i32(t1, t1, t3);
+        }
+        tcg_temp_free_i32(t3);
+    }
+    if (round) {
+        /*
+         * Adding 0x80000000 to the 64-bit quantity means that we have
+         * carry in to the high word when the low word has the msb set.
+         */
+        tcg_gen_shri_i32(t2, t2, 31);
+        tcg_gen_add_i32(t1, t1, t2);
+    }
+    tcg_temp_free_i32(t2);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SMMLA(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, false, false);
+}
+
+static bool trans_SMMLAR(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, true, false);
+}
+
+static bool trans_SMMLS(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, false, true);
+}
+
+static bool trans_SMMLSR(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, true, true);
+}
+
+static bool op_div(DisasContext *s, arg_rrr *a, bool u)
+{
+    TCGv_i32 t1, t2;
+
+    if (s->thumb
+        ? !dc_isar_feature(thumb_div, s)
+        : !dc_isar_feature(arm_div, s)) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (u) {
+        gen_helper_udiv(t1, t1, t2);
+    } else {
+        gen_helper_sdiv(t1, t1, t2);
+    }
+    tcg_temp_free_i32(t2);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SDIV(DisasContext *s, arg_rrr *a)
+{
+    return op_div(s, a, false);
+}
+
+static bool trans_UDIV(DisasContext *s, arg_rrr *a)
+{
+    return op_div(s, a, true);
+}
+
 /*
  * Legacy decoder.
  */
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, val, op1, i, rm, rs, rn, rd;
+    unsigned int cond, val, op1, i, rn, rd;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
-    TCGv_i32 tmp3;
     TCGv_i32 addr;
-    TCGv_i64 tmp64;
 
     /* M variants do not implement ARM mode; this must raise the INVSTATE
      * UsageFault exception.
@@ -9838,157 +10048,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         switch(op1) {
         case 0x0:
         case 0x1:
-            /* multiplies, extra load/stores */
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
-            break;
         case 0x4:
         case 0x5:
-            goto do_ldst;
         case 0x6:
         case 0x7:
-            if (insn & (1 << 4)) {
-                ARCH(6);
-                /* Armv6 Media instructions.  */
-                rm = insn & 0xf;
-                rn = (insn >> 16) & 0xf;
-                rd = (insn >> 12) & 0xf;
-                rs = (insn >> 8) & 0xf;
-                switch ((insn >> 23) & 3) {
-                case 0: /* Parallel add/subtract.  */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                case 1:
-                    /* Halfword pack, [US]SAT, [US]SAT16, SEL, REV et al */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                case 2: /* Multiplies (Type 3).  */
-                    switch ((insn >> 20) & 0x7) {
-                    case 5:
-                        if (((insn >> 6) ^ (insn >> 7)) & 1) {
-                            /* op2 not 00x or 11x : UNDEF */
-                            goto illegal_op;
-                        }
-                        /* Signed multiply most significant [accumulate].
-                           (SMMUL, SMMLA, SMMLS) */
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
-
-                        if (rd != 15) {
-                            tmp3 = load_reg(s, rd);
-                            if (insn & (1 << 6)) {
-                                /*
-                                 * For SMMLS, we need a 64-bit subtract.
-                                 * Borrow caused by a non-zero multiplicand
-                                 * lowpart, and the correct result lowpart
-                                 * for rounding.
-                                 */
-                                TCGv_i32 zero = tcg_const_i32(0);
-                                tcg_gen_sub2_i32(tmp2, tmp, zero, tmp3,
-                                                 tmp2, tmp);
-                                tcg_temp_free_i32(zero);
-                            } else {
-                                tcg_gen_add_i32(tmp, tmp, tmp3);
-                            }
-                            tcg_temp_free_i32(tmp3);
-                        }
-                        if (insn & (1 << 5)) {
-                            /*
-                             * Adding 0x80000000 to the 64-bit quantity
-                             * means that we have carry in to the high
-                             * word when the low word has the high bit set.
-                             */
-                            tcg_gen_shri_i32(tmp2, tmp2, 31);
-                            tcg_gen_add_i32(tmp, tmp, tmp2);
-                        }
-                        tcg_temp_free_i32(tmp2);
-                        store_reg(s, rn, tmp);
-                        break;
-                    case 0:
-                    case 4:
-                        /* SMLAD, SMUAD, SMLSD, SMUSD, SMLALD, SMLSLD */
-                        if (insn & (1 << 7)) {
-                            goto illegal_op;
-                        }
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        if (insn & (1 << 5))
-                            gen_swap_half(tmp2);
-                        gen_smul_dual(tmp, tmp2);
-                        if (insn & (1 << 22)) {
-                            /* smlald, smlsld */
-                            TCGv_i64 tmp64_2;
-
-                            tmp64 = tcg_temp_new_i64();
-                            tmp64_2 = tcg_temp_new_i64();
-                            tcg_gen_ext_i32_i64(tmp64, tmp);
-                            tcg_gen_ext_i32_i64(tmp64_2, tmp2);
-                            tcg_temp_free_i32(tmp);
-                            tcg_temp_free_i32(tmp2);
-                            if (insn & (1 << 6)) {
-                                tcg_gen_sub_i64(tmp64, tmp64, tmp64_2);
-                            } else {
-                                tcg_gen_add_i64(tmp64, tmp64, tmp64_2);
-                            }
-                            tcg_temp_free_i64(tmp64_2);
-                            gen_addq(s, tmp64, rd, rn);
-                            gen_storeq_reg(s, rd, rn, tmp64);
-                            tcg_temp_free_i64(tmp64);
-                        } else {
-                            /* smuad, smusd, smlad, smlsd */
-                            if (insn & (1 << 6)) {
-                                /* This subtraction cannot overflow. */
-                                tcg_gen_sub_i32(tmp, tmp, tmp2);
-                            } else {
-                                /* This addition cannot overflow 32 bits;
-                                 * however it may overflow considered as a
-                                 * signed operation, in which case we must set
-                                 * the Q flag.
-                                 */
-                                gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                            }
-                            tcg_temp_free_i32(tmp2);
-                            if (rd != 15)
-                              {
-                                tmp2 = load_reg(s, rd);
-                                gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                                tcg_temp_free_i32(tmp2);
-                              }
-                            store_reg(s, rn, tmp);
-                        }
-                        break;
-                    case 1:
-                    case 3:
-                        /* SDIV, UDIV */
-                        if (!dc_isar_feature(arm_div, s)) {
-                            goto illegal_op;
-                        }
-                        if (((insn >> 5) & 7) || (rd != 15)) {
-                            goto illegal_op;
-                        }
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        if (insn & (1 << 21)) {
-                            gen_helper_udiv(tmp, tmp, tmp2);
-                        } else {
-                            gen_helper_sdiv(tmp, tmp, tmp2);
-                        }
-                        tcg_temp_free_i32(tmp2);
-                        store_reg(s, rn, tmp);
-                        break;
-                    default:
-                        goto illegal_op;
-                    }
-                    break;
-                case 3:
-                    /* USAD, BFI, BFC, SBFX, UBFX */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                }
-                break;
-            }
-        do_ldst:
             /* All done in decodetree.  Reach here for illegal ops.  */
             goto illegal_op;
         case 0x08:
@@ -10210,9 +10273,7 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     uint32_t rd, rn, rm, rs;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
-    TCGv_i32 tmp3;
     TCGv_i32 addr;
-    TCGv_i64 tmp64;
     int op;
 
     /*
@@ -10473,126 +10534,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         case 2: /* SIMD add/subtract, in decodetree */
         case 3: /* Other data processing, in decodetree */
             goto illegal_op;
-        case 4: case 5: /* 32-bit multiply.  Sum of absolute differences.  */
-            switch ((insn >> 20) & 7) {
-            case 0: /* 32 x 32 -> 32 */
-            case 1: /* 16 x 16 -> 32 */
-            case 3: /* 32 * 16 -> 32msb */
-            case 7: /* Unsigned sum of absolute differences.  */
-                /* in decodetree */
-                goto illegal_op;
-            case 2: /* Dual multiply add.  */
-            case 4: /* Dual multiply subtract.  */
-            case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
-                if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                    goto illegal_op;
-                }
-                break;
-            }
-            op = (insn >> 4) & 0xf;
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            switch ((insn >> 20) & 7) {
-            case 2: /* Dual multiply add.  */
-            case 4: /* Dual multiply subtract.  */
-                if (op)
-                    gen_swap_half(tmp2);
-                gen_smul_dual(tmp, tmp2);
-                if (insn & (1 << 22)) {
-                    /* This subtraction cannot overflow. */
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                } else {
-                    /* This addition cannot overflow 32 bits;
-                     * however it may overflow considered as a signed
-                     * operation, in which case we must set the Q flag.
-                     */
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                }
-                tcg_temp_free_i32(tmp2);
-                if (rs != 15)
-                  {
-                    tmp2 = load_reg(s, rs);
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                    tcg_temp_free_i32(tmp2);
-                  }
-                break;
-            case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
-                tcg_gen_muls2_i32(tmp2, tmp, tmp, tmp2);
-                if (rs != 15) {
-                    tmp3 = load_reg(s, rs);
-                    if (insn & (1 << 20)) {
-                        tcg_gen_add_i32(tmp, tmp, tmp3);
-                    } else {
-                        /*
-                         * For SMMLS, we need a 64-bit subtract.
-                         * Borrow caused by a non-zero multiplicand lowpart,
-                         * and the correct result lowpart for rounding.
-                         */
-                        TCGv_i32 zero = tcg_const_i32(0);
-                        tcg_gen_sub2_i32(tmp2, tmp, zero, tmp3, tmp2, tmp);
-                        tcg_temp_free_i32(zero);
-                    }
-                    tcg_temp_free_i32(tmp3);
-                }
-                if (insn & (1 << 4)) {
-                    /*
-                     * Adding 0x80000000 to the 64-bit quantity
-                     * means that we have carry in to the high
-                     * word when the low word has the high bit set.
-                     */
-                    tcg_gen_shri_i32(tmp2, tmp2, 31);
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                }
-                tcg_temp_free_i32(tmp2);
-                break;
-            }
-            store_reg(s, rd, tmp);
-            break;
-        case 6: case 7: /* 64-bit multiply, Divide.  */
-            op = ((insn >> 4) & 0xf) | ((insn >> 16) & 0x70);
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            if ((op & 0x50) == 0x10) {
-                /* sdiv, udiv */
-                if (!dc_isar_feature(thumb_div, s)) {
-                    goto illegal_op;
-                }
-                if (op & 0x20)
-                    gen_helper_udiv(tmp, tmp, tmp2);
-                else
-                    gen_helper_sdiv(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-            } else if ((op & 0xe) == 0xc) {
-                /* Dual multiply accumulate long.  */
-                if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                    tcg_temp_free_i32(tmp);
-                    tcg_temp_free_i32(tmp2);
-                    goto illegal_op;
-                }
-                if (op & 1)
-                    gen_swap_half(tmp2);
-                gen_smul_dual(tmp, tmp2);
-                if (op & 0x10) {
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                } else {
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                }
-                tcg_temp_free_i32(tmp2);
-                /* BUGFIX */
-                tmp64 = tcg_temp_new_i64();
-                tcg_gen_ext_i32_i64(tmp64, tmp);
-                tcg_temp_free_i32(tmp);
-                gen_addq(s, tmp64, rs, rd);
-                gen_storeq_reg(s, rs, rd, tmp64);
-                tcg_temp_free_i64(tmp64);
-            } else {
-                /* Signed/unsigned 64-bit multiply, in decodetree */
-                tcg_temp_free_i32(tmp2);
-                tcg_temp_free_i32(tmp);
-                goto illegal_op;
-            }
-            break;
+        case 4: case 5:
+            /* 32-bit multiply.  Sum of absolute differences, in decodetree */
+            goto illegal_op;
+        case 6: case 7: /* 64-bit multiply, Divide, in decodetree */
+            goto illegal_op;
         }
         break;
     case 6: case 7: case 14: case 15:
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 4990eb3839..d7a333b90b 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -486,3 +486,25 @@ REV              .... 0110 1011 1111 .... 1111 0011 ....      @rdm
 REV16            .... 0110 1011 1111 .... 1111 1011 ....      @rdm
 REVSH            .... 0110 1111 1111 .... 1111 1011 ....      @rdm
 RBIT             .... 0110 1111 1111 .... 1111 0011 ....      @rdm
+
+# Signed multiply, signed and unsigned divide
+
+@rdmn            ---- .... .... rd:4 .... rm:4 .... rn:4      &rrr
+
+SMLAD            .... 0111 0000 .... .... .... 0001 ....      @rdamn
+SMLADX           .... 0111 0000 .... .... .... 0011 ....      @rdamn
+SMLSD            .... 0111 0000 .... .... .... 0101 ....      @rdamn
+SMLSDX           .... 0111 0000 .... .... .... 0111 ....      @rdamn
+
+SDIV             .... 0111 0001 .... 1111 .... 0001 ....      @rdmn
+UDIV             .... 0111 0011 .... 1111 .... 0001 ....      @rdmn
+
+SMLALD           .... 0111 0100 .... .... .... 0001 ....      @rdamn
+SMLALDX          .... 0111 0100 .... .... .... 0011 ....      @rdamn
+SMLSLD           .... 0111 0100 .... .... .... 0101 ....      @rdamn
+SMLSLDX          .... 0111 0100 .... .... .... 0111 ....      @rdamn
+
+SMMLA            .... 0111 0101 .... .... .... 0001 ....      @rdamn
+SMMLAR           .... 0111 0101 .... .... .... 0011 ....      @rdamn
+SMMLS            .... 0111 0101 .... .... .... 1101 ....      @rdamn
+SMMLSR           .... 0111 0101 .... .... .... 1111 ....      @rdamn
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 71f6d728f2..677acb698d 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -228,6 +228,24 @@ SMLALTT          1111 1011 1100 .... .... .... 1011 ....      @rnadm
 # usad8 is usada8 w/ ra=15
 USADA8           1111 1011 0111 .... .... .... 0000 ....      @rnadm
 
+SMLAD            1111 1011 0010 .... .... .... 0000 ....      @rnadm
+SMLADX           1111 1011 0010 .... .... .... 0001 ....      @rnadm
+SMLSD            1111 1011 0100 .... .... .... 0000 ....      @rnadm
+SMLSDX           1111 1011 0100 .... .... .... 0001 ....      @rnadm
+
+SMLALD           1111 1011 1100 .... .... .... 1100 ....      @rnadm
+SMLALDX          1111 1011 1100 .... .... .... 1101 ....      @rnadm
+SMLSLD           1111 1011 1101 .... .... .... 1100 ....      @rnadm
+SMLSLDX          1111 1011 1101 .... .... .... 1101 ....      @rnadm
+
+SMMLA            1111 1011 0101 .... .... .... 0000 ....      @rnadm
+SMMLAR           1111 1011 0101 .... .... .... 0001 ....      @rnadm
+SMMLS            1111 1011 0110 .... .... .... 0000 ....      @rnadm
+SMMLSR           1111 1011 0110 .... .... .... 0001 ....      @rnadm
+
+SDIV             1111 1011 1001 .... 1111 .... 1111 ....      @rndm
+UDIV             1111 1011 1011 .... 1111 .... 1111 ....      @rndm
+
 # Data-processing (two source registers)
 
 QADD             1111 1010 1000 .... 1111 .... 1000 ....      @rndm
-- 
2.17.1

