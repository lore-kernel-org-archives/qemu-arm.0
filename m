Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2149944njk;
        Sun, 1 Dec 2024 07:11:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV6E+PrQ1IKpYfhaTNB6XFLkQCatJ5GQadPPW3YOfhntL3j9Q6Kg1eB0RJw+D4JbFC7B4W6tnPwxQCsjg==@linaro.org
X-Google-Smtp-Source: AGHT+IGpkovwIGHV9vsG4AaabAHXxPvbN4G/yai7UE5+OiIW9wPO8TawL1Ji0Io9wTst6dd3bTH5
X-Received: by 2002:a05:622a:47:b0:45d:9357:1cca with SMTP id d75a77b69052e-466b351e8c4mr273147861cf.14.1733065877166;
        Sun, 01 Dec 2024 07:11:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733065877; cv=none;
        d=google.com; s=arc-20240605;
        b=fIZYX0Gw0qZRAdfIv35bVffcMPNJehgdE1PaQlSE1aCyxzF5jjfeB7TJ558EJbtd3e
         pgezS+MB4Vmvwxm9KAQLk0hKD0jhnfA38MtHgXNkpRDPfqLKKgyjauo7ElzgoeAKV2OB
         7BkWKYSRWIR12GO5iKUe4Mkwp736n633Q3UAoCRPSwEO8Uwkoxw7kgmnj4ct+8UipbNb
         uCCw2BlLWYf5HKZAAFMnkBSSeqBmTk3UiLgoVULujGTwK8+UB3cydUIuyPLEhSJ7KBDO
         YMcI9BCRTx14aB3ZJglHPBG2gMTPkgJSyZiAd/xz87cqjarte4peLzElx1q1odW375uo
         09DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+8hCx024udMNDk6v9Nj13gSyDrZjHnu2etpRHEZsde0=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=D2YCoy4xAP5r+w5KaFbc3iB7tKhveD1O5v+FGaXNhFqBRFunyMRvcAEx5JVbWQsN3t
         1r3aDFk6VSWhlqpFkpCiVS6YfmrkVgolCwIMJ4xeb2TaYLyV41a3SKyAiPq71mER9lYJ
         oBWz/U7qT3/SpdEzWGoVwL5iWcyC8iX8YrH6EigNGfOCr3tokCGI4OQcEjG21lWS4vJ4
         0pNXsPyI7xRkUYMqFJ7g9n85oWD5FO6kJtKKZDMgyUA6hjLarN0JDUch7ziTDpZnzzA4
         zMe95EDNJkwTyuXgLy5CqiN0n8sjei805Nm4XapBnY4ctESaf+KxaUf//f6rwaRzWTtw
         OGnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNiehb6u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4103156si92127741cf.256.2024.12.01.07.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Dec 2024 07:11:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zNiehb6u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tHlab-0000DG-KT; Sun, 01 Dec 2024 10:10:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHlaC-0007iv-8a
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:10:00 -0500
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tHla9-00056U-H0
 for qemu-devel@nongnu.org; Sun, 01 Dec 2024 10:09:59 -0500
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5f2164a68bbso1227127eaf.0
 for <qemu-devel@nongnu.org>; Sun, 01 Dec 2024 07:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733065795; x=1733670595; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8hCx024udMNDk6v9Nj13gSyDrZjHnu2etpRHEZsde0=;
 b=zNiehb6upaQ25dwe3Ny3dQaW+0jJNqHlU5usw0djK2bOMr6YEGcYbR+iWp/n/aShm6
 Ym+eskiwghe18SO0F/W024qF5Qv8lvfODtA/XT5othbUKyBsaEJWQBnjiZXviQ/l24Z3
 E4yrh/B+/ssoRRgp1Py4eGTtI7IDP8niWRtaODe29WPSoclJamJdYkwbCtOnl5Rc3fZO
 Uq9YL17xGlDYuyCrIvaCG7BFBjNYu02JtC/maUacQ+KvZ9GSz0Xj4XpLRN7IzonLBCUe
 wCJyZppNUrxjuo8/o4aSijDGMs/0br9IAqQNE+0Xx5P1P0Y/MdnT3ioSgj4li/6wUsfP
 7XyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733065795; x=1733670595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+8hCx024udMNDk6v9Nj13gSyDrZjHnu2etpRHEZsde0=;
 b=WYlzGoofyKJBel6eJb4j+KLEUKv5JZKQOTH4hTy4/mSfCykF5tFoOTZsI2M1THymHD
 16BJpnZxKyGnG/JSYOcx/CH2j5oUrqEyQWRPr4phPSDPC4wdia1KH4VVqkJeHYvEH0Ue
 mW44DeAmB2AfBLFQ1FY4DFNfspdVouoWL68Lfd3lRjhiY2U/bmLN9wkybTrMahivd+8X
 YbwB5H6OxJRw2fBwosXftH4b9pbiPzaDbsEUm7zT8rACqbTbKT+zd3bW+8DfvofcB36N
 Zcf5QQu1haK/YJrUDRRdpC+RNVCuR7PqHHBjsGXTpAsnksnFwcSt9pPdOfqVfGt7lgFl
 sTAQ==
X-Gm-Message-State: AOJu0YyoyzWNTa5Np/siOBHYWExuqn1QOMtTd3Mxn/VJKNZfal1IZo+E
 wK4ko8eQgqECwMFlae9FwOSMRzE6Ka7jo9uPxsANlJV8QVZ34M7r/QrD6wzOYG3xaKNIH7Icobo
 wcE4=
X-Gm-Gg: ASbGncsxiDJXF1IfFqIoEy13jNV9v1tVQcZZVkwxnPRPX79Bz8QIrixI4owCkxyrdVs
 N+3Th2ACNla6qvySGGTpbi+ifC0cYEdtg/Qw7sPvZF9YEQ9jLwzeHWnp3JH/s9zDLGIZdlaNNmW
 aPYDdxhZdHBCa46R8E3p4t3NG6sckPbUQKQhSJNk1e09K4kT0sHo2iHj2xpvLDIvcAO0WCONXpo
 vk8Y94tIBjg2KoceZZwyMRENkPJymL9or4igpIsamAw883+KWS7xhX297izUXlS13rkelPgbWvM
 qKx+OM3odEdpOUaDFjhDmB7jZbDh3b4D7Inz
X-Received: by 2002:a4a:ee0f:0:b0:5eb:d1ac:21e5 with SMTP id
 006d021491bc7-5f209fc7947mr12722544eaf.0.1733065794792; 
 Sun, 01 Dec 2024 07:09:54 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f21a4cd78fsm1807008eaf.32.2024.12.01.07.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 07:09:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 40/67] target/arm: Convert CMGT, CMGE, GMLT, GMLE,
 CMEQ (zero) to decodetree
Date: Sun,  1 Dec 2024 09:05:39 -0600
Message-ID: <20241201150607.12812-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201150607.12812-1-richard.henderson@linaro.org>
References: <20241201150607.12812-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NdG9ZkLDtH7X

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 94 +++++++++++-----------------------
 target/arm/tcg/a64.decode      | 10 ++++
 2 files changed, 40 insertions(+), 64 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3d08c6e09b..bc1d0e18eb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8906,6 +8906,22 @@ static bool do_scalar1_d(DisasContext *s, arg_rr *a, ArithOneOp *f)
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
@@ -8922,6 +8938,11 @@ TRANS(NEG_v, do_gvec_fn2, a, tcg_gen_gvec_neg)
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
@@ -9233,21 +9254,7 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
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
@@ -9294,6 +9301,9 @@ static void handle_2misc_64(DisasContext *s, int opcode, bool u,
     case 0x4: /* CLS, CLZ */
     case 0x5: /* NOT */
     case 0x7: /* SQABS, SQNEG */
+    case 0x8: /* CMGT, CMGE */
+    case 0x9: /* CMEQ, CMLE */
+    case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
         g_assert_not_reached();
     }
@@ -9637,19 +9647,6 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -9735,6 +9732,9 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     default:
     case 0x3: /* USQADD / SUQADD */
     case 0x7: /* SQABS / SQNEG */
+    case 0x8: /* CMGT, CMGE */
+    case 0x9: /* CMEQ, CMLE */
+    case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
         return;
@@ -10107,19 +10107,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
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
@@ -10293,6 +10280,9 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     case 0x4: /* CLS, CLZ */
     case 0x5: /* CNT, NOT, RBIT */
     case 0x7: /* SQABS, SQNEG */
+    case 0x8: /* CMGT, CMGE */
+    case 0x9: /* CMEQ, CMLE */
+    case 0xa: /* CMLT */
     case 0xb: /* ABS, NEG */
         unallocated_encoding(s);
         return;
@@ -10313,30 +10303,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
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
index 29f7741bfb..4f8231d07a 100644
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

