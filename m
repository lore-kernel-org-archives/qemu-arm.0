Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3248788wrg;
        Sat, 18 May 2019 12:33:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwScBaKOPu3lxaAAUdKATFHcR/40UKiPy355Sk9aesgW7QC8axydknqiNrdloyqki19uqWr
X-Received: by 2002:a17:906:5c12:: with SMTP id e18mr21386761ejq.157.1558208001819;
        Sat, 18 May 2019 12:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558208001; cv=none;
        d=google.com; s=arc-20160816;
        b=F1wZjqfUOvk/PlelUfbBRwk4irN2eDiu9vaz+qNrcxw/nd1rjPMdoFMdbRj4K5Wg3I
         SsuSHm70Rbl0KQLhIDx8oA6LHPajVhNoXvH0OSFC3EZVEHBS+G11mFuetF62PPa+HRFZ
         h2zxsAc5/pWgxIY1t1BfIoW77x5XZJOVuGwHXz7NaDlo+EMoowdH1FoD2sAeZfHjJvj8
         FzL4XgGn5i8p1qzqqQ+3Mq+dRgbU8Bm0q+DpAZ1Pp6psK+O9Izy40Dpts82m5AkOY7DN
         siLSTdbrppIS361b70sVgQ9NBUoj5bQkPx8qMw4RhZJlgUvLttl83yQbD40OOh2taqt/
         xJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=dhbfT4796Yk0sqYwrY2hvMjQ++yBmcBKZBeep64Y5Sk=;
        b=GfcewWkGnzVeElMmcnJbCMeUfxBZxh2WkAui/DG8jV0BzoDYrD/gK71xRRbtmo2tdd
         0NgrNAXrtHaswdRJLStR1z65e0JU4bNwjGXTt2AG2HYgs/DaPdDUfcE+j2FTQ83Za6bU
         F5s6PIITHwtem2s+mv8y46HYMC6Hc8+1PVElcBrfNNtVxSuAGpBab95MUgLoKVJnjw1O
         8tepysjqw3r/a+KOMzYRdBgZKbqrMVRm6/v0/+hJQSA/6n/t3tJYsV7R/71ffUVXiJC3
         2rVtob2gyWQQKIVOC0maCbiF1KL6trSvA/NFsge7LHOYtv6z42ez+EpQmA5A5DVl4JHV
         J4EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oBWKTX9G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m30si5900917edm.26.2019.05.18.12.33.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 May 2019 12:33:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oBWKTX9G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hS556-0003K6-QS
	for alex.bennee@linaro.org; Sat, 18 May 2019 15:33:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hS53d-0002M5-QV
	for qemu-devel@nongnu.org; Sat, 18 May 2019 15:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hS4rt-0007an-2k
	for qemu-devel@nongnu.org; Sat, 18 May 2019 15:19:42 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33307)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hS4rs-0007aE-TG
	for qemu-devel@nongnu.org; Sat, 18 May 2019 15:19:41 -0400
Received: by mail-pf1-x441.google.com with SMTP id z28so5286875pfk.0
	for <qemu-devel@nongnu.org>; Sat, 18 May 2019 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dhbfT4796Yk0sqYwrY2hvMjQ++yBmcBKZBeep64Y5Sk=;
	b=oBWKTX9GiPRVsgk6/epvq0wkd44GGfnYfB9G/GHH7qTQyyZjCyzQ/flkPiXYAV1kRj
	WxuKKjmwOOafUFE4FArJQNtTx0uLzYcqXGlp2GkJNS4wr8+YsKVwL2gROwSrfGgDd99H
	rqH7wbJlrPZn6O/BnSuM/7e9Ig5IGHybJP+Z9IV/2dCXmYUzWBPlb4lZZSE4CMA/AVvk
	PoYlfNjKnFEYI+ekl9a9hS1c1i1Dp2YmAeP3zVmfyEdPW9zNKaQV3NwvxTZjJlGG5//2
	lajxgilrwQ7cIOJs/CyjOJAONpdlZDtdIR/r0gZCNlCLz7/zTdXEHzVM2Pk2duuMeoSz
	Azyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dhbfT4796Yk0sqYwrY2hvMjQ++yBmcBKZBeep64Y5Sk=;
	b=cBSgOBI1OLG/TWaUmblx2fCXSYH7/1lT8jFimWtWsP4AHE9QTSAm/BQVrvvbVhLqAe
	90C0tfo7P4npS3UxhK7csPQ3ZBEk4WH/UHD5ezXPCNE3vRBMyEkPwb1BOkSxrJDPsQnX
	u//o3du5hPh4XfVzTVtZhTRUBcD7njbPmDzC79aIcbRTdKme/Gxnt3Cu1HGZaZMcOFmY
	fbns0v0lSsTCpYnwYcy8oSIQfnHQBf6dtt2Jh8jvEXnb4LreVNNFlq83lyT/LWvyG5gx
	1mQX0+HtNwH4sSnzUGVPw7D2HfVK+27/JoHSsv9Maz/zLmJq9aHgYBkdkTOcCkqGwyla
	kErw==
X-Gm-Message-State: APjAAAWdteAk1mKyBxJN8CGSpD9glk5g4OsoZULZdKZY7YCWpA9cBnh5
	7Nw7IDiUiEMhSKPJyoCelGg7vWjidw0=
X-Received: by 2002:a62:d205:: with SMTP id c5mr69339862pfg.219.1558207179571; 
	Sat, 18 May 2019 12:19:39 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	r185sm19639625pfc.167.2019.05.18.12.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 12:19:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 18 May 2019 12:19:34 -0700
Message-Id: <20190518191934.21887-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190518191934.21887-1-richard.henderson@linaro.org>
References: <20190518191934.21887-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH 2/2] target/arm: Use tcg_gen_gvec_bitsel
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jDFsDPwXKYSv

This replaces 3 target-specific implementations for BIT, BIF, and BSL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  2 +
 target/arm/translate.h     |  3 --
 target/arm/translate-a64.c | 15 ++++++--
 target/arm/translate.c     | 78 +++-----------------------------------
 4 files changed, 20 insertions(+), 78 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 63d958cf50..9569bc5963 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -122,5 +122,7 @@ typedef void GVecGen2iFn(unsigned, uint32_t, uint32_t, int64_t,
                          uint32_t, uint32_t);
 typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
                         uint32_t, uint32_t, uint32_t);
+typedef void GVecGen4Fn(unsigned, uint32_t, uint32_t, uint32_t,
+                        uint32_t, uint32_t, uint32_t);
 
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f357b767cb..01ae454dcf 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -238,9 +238,6 @@ static inline void gen_ss_advance(DisasContext *s)
 }
 
 /* Vector operations shared between ARM and AArch64.  */
-extern const GVecGen3 bsl_op;
-extern const GVecGen3 bit_op;
-extern const GVecGen3 bif_op;
 extern const GVecGen3 mla_op[4];
 extern const GVecGen3 mls_op[4];
 extern const GVecGen3 cmtst_op[4];
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2c280243a9..955ab63ff8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -704,6 +704,15 @@ static void gen_gvec_fn3(DisasContext *s, bool is_q, int rd, int rn, int rm,
             vec_full_reg_offset(s, rm), is_q ? 16 : 8, vec_full_reg_size(s));
 }
 
+/* Expand a 4-operand AdvSIMD vector operation using an expander function.  */
+static void gen_gvec_fn4(DisasContext *s, bool is_q, int rd, int rn, int rm,
+                         int rx, GVecGen4Fn *gvec_fn, int vece)
+{
+    gvec_fn(vece, vec_full_reg_offset(s, rd), vec_full_reg_offset(s, rn),
+            vec_full_reg_offset(s, rm), vec_full_reg_offset(s, rx),
+            is_q ? 16 : 8, vec_full_reg_size(s));
+}
+
 /* Expand a 2-operand + immediate AdvSIMD vector operation using
  * an op descriptor.
  */
@@ -10916,13 +10925,13 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
         return;
 
     case 5: /* BSL bitwise select */
-        gen_gvec_op3(s, is_q, rd, rn, rm, &bsl_op);
+        gen_gvec_fn4(s, is_q, rd, rd, rn, rm, tcg_gen_gvec_bitsel, 0);
         return;
     case 6: /* BIT, bitwise insert if true */
-        gen_gvec_op3(s, is_q, rd, rn, rm, &bit_op);
+        gen_gvec_fn4(s, is_q, rd, rm, rn, rd, tcg_gen_gvec_bitsel, 0);
         return;
     case 7: /* BIF, bitwise insert if false */
-        gen_gvec_op3(s, is_q, rd, rn, rm, &bif_op);
+        gen_gvec_fn4(s, is_q, rd, rm, rd, rn, tcg_gen_gvec_bitsel, 0);
         return;
 
     default:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 49dfcdc90d..3abcae3a50 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5755,72 +5755,6 @@ static int do_v81_helper(DisasContext *s, gen_helper_gvec_3_ptr *fn,
     return 1;
 }
 
-/*
- * Expanders for VBitOps_VBIF, VBIT, VBSL.
- */
-static void gen_bsl_i64(TCGv_i64 rd, TCGv_i64 rn, TCGv_i64 rm)
-{
-    tcg_gen_xor_i64(rn, rn, rm);
-    tcg_gen_and_i64(rn, rn, rd);
-    tcg_gen_xor_i64(rd, rm, rn);
-}
-
-static void gen_bit_i64(TCGv_i64 rd, TCGv_i64 rn, TCGv_i64 rm)
-{
-    tcg_gen_xor_i64(rn, rn, rd);
-    tcg_gen_and_i64(rn, rn, rm);
-    tcg_gen_xor_i64(rd, rd, rn);
-}
-
-static void gen_bif_i64(TCGv_i64 rd, TCGv_i64 rn, TCGv_i64 rm)
-{
-    tcg_gen_xor_i64(rn, rn, rd);
-    tcg_gen_andc_i64(rn, rn, rm);
-    tcg_gen_xor_i64(rd, rd, rn);
-}
-
-static void gen_bsl_vec(unsigned vece, TCGv_vec rd, TCGv_vec rn, TCGv_vec rm)
-{
-    tcg_gen_xor_vec(vece, rn, rn, rm);
-    tcg_gen_and_vec(vece, rn, rn, rd);
-    tcg_gen_xor_vec(vece, rd, rm, rn);
-}
-
-static void gen_bit_vec(unsigned vece, TCGv_vec rd, TCGv_vec rn, TCGv_vec rm)
-{
-    tcg_gen_xor_vec(vece, rn, rn, rd);
-    tcg_gen_and_vec(vece, rn, rn, rm);
-    tcg_gen_xor_vec(vece, rd, rd, rn);
-}
-
-static void gen_bif_vec(unsigned vece, TCGv_vec rd, TCGv_vec rn, TCGv_vec rm)
-{
-    tcg_gen_xor_vec(vece, rn, rn, rd);
-    tcg_gen_andc_vec(vece, rn, rn, rm);
-    tcg_gen_xor_vec(vece, rd, rd, rn);
-}
-
-const GVecGen3 bsl_op = {
-    .fni8 = gen_bsl_i64,
-    .fniv = gen_bsl_vec,
-    .prefer_i64 = TCG_TARGET_REG_BITS == 64,
-    .load_dest = true
-};
-
-const GVecGen3 bit_op = {
-    .fni8 = gen_bit_i64,
-    .fniv = gen_bit_vec,
-    .prefer_i64 = TCG_TARGET_REG_BITS == 64,
-    .load_dest = true
-};
-
-const GVecGen3 bif_op = {
-    .fni8 = gen_bif_i64,
-    .fniv = gen_bif_vec,
-    .prefer_i64 = TCG_TARGET_REG_BITS == 64,
-    .load_dest = true
-};
-
 static void gen_ssra8_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 {
     tcg_gen_vec_sar8i_i64(a, a, shift);
@@ -6830,16 +6764,16 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                                  vec_size, vec_size);
                 break;
             case 5: /* VBSL */
-                tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
-                               vec_size, vec_size, &bsl_op);
+                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rd_ofs, rn_ofs, rm_ofs,
+                                    vec_size, vec_size);
                 break;
             case 6: /* VBIT */
-                tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
-                               vec_size, vec_size, &bit_op);
+                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rm_ofs, rn_ofs, rd_ofs,
+                                    vec_size, vec_size);
                 break;
             case 7: /* VBIF */
-                tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
-                               vec_size, vec_size, &bif_op);
+                tcg_gen_gvec_bitsel(MO_8, rd_ofs, rm_ofs, rd_ofs, rn_ofs,
+                                    vec_size, vec_size);
                 break;
             }
             return 0;
-- 
2.17.1

