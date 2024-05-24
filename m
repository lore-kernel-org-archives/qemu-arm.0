Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994334ejb;
        Fri, 24 May 2024 16:27:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJtvj3iD5z1yeFmYuCyKPM6P10d+pwWOtnTVObl570+Zjv0L8ChdYZitvQO18rLokJvD+aIY/yML/QCt4pEuFrQ9BqCxMa
X-Google-Smtp-Source: AGHT+IGT0DRMRsPm6ivwnhnn6V5qlocGQN30690TxkENy/4m9eGPeJNY1Y5aawSzIo7r1PXd/Qjr
X-Received: by 2002:a05:622a:58c:b0:43b:758:6ca with SMTP id d75a77b69052e-43fb0e6f16amr31917461cf.33.1716593236723;
        Fri, 24 May 2024 16:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593236; cv=none;
        d=google.com; s=arc-20160816;
        b=AcUamMxSKMDSVvpjVe/u2IVFsI8Z9xSg49OmFrf1p9oX1Wu/AvRi3oGZdnR4FvHZep
         UIb+s+2xiZybphnqcfj94udp0tjucjof4IqFqMdLrxZBhqQEU+dUYVYz6RRyaKtmZAhr
         T/Yk0EOyKqJFxtjTBRFbIN9KerzzNaRtGbXrunlgr3F9jLA0j+c+uui+rWN/tqL1Efv4
         MubFRG0aelyoNw4PHflLmWk2P/QzxK47Nyxh+ug4UyDs/XMYzN7hZ6i1EILEoQJQXlX1
         6nbxmfDUbg0x0IsY/wKzdIhkt88ZcSyZF0IOjpZQKMMHbuh2Pw/5csqcyeBSynHhIoeZ
         TFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fHFkoGc3LcCzc/uNih0n52xsiOuWG1pYAHjpL/yQXc0=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=LYjdKGm3drh0oOwtssuqo9l/nKFMVmHFcjuFcURpVnyDIgx/bxc1xt8ySbcGO9Xl/o
         ZIMZ/8lPgQMSdjLIhJ00IO7pUJFkg5SQ5VasXfB+Gb/z4QTPRblgXYUQ00uKwwvKsGwq
         /XZ2fFkM8JB7mHqiu/E6xrzVgkivfWvhPQh5DD54DHlf3IFpxdhIzly9WHtBVXCoeRZE
         I/XyohotRgiJAlgdu/4t5SlvswKcV8EqvmuvSyjrNfcjN8hj+A9RVnHn68MqZ+PfW5JO
         ZUZucNVWFtGuGmnuxA+PLdWWTab9/N+X5DSCDY6qaqhGUGx1voWHIcel99r7s7al7N3H
         G/Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VHPhZYw+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18ed54bsi33604351cf.723.2024.05.24.16.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VHPhZYw+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeJB-0003GE-Le; Fri, 24 May 2024 19:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeI3-0007p1-Po
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:35 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0006xX-BQ
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:35 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6f8ec7e054bso1395402b3a.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593117; x=1717197917; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHFkoGc3LcCzc/uNih0n52xsiOuWG1pYAHjpL/yQXc0=;
 b=VHPhZYw+5laLgZ3R1XHDDLhYQ7wu9/zr4JOOtIe0LvkdWd/atLJxfW+o8nx4FWKS0M
 EmdYe9c4Qc/3AX2/jB54cxiilooClDku3Ru0MBsqB8kVKuQy1uVrL3hBM4BX3XwDDOrU
 rTb0Z2Eu5iaaVuyfR9WqKFz9X35ryjWnluPSnldxdCpF2PRMLldV8C4UVjLpYuCaSFcm
 D2ejEpCOfLUia3S/UQtICelovsRA4GxhhBGLHveg9mGWyyhZ39HEGZagmlFmBrE5iltg
 +Bo3JuXvWq4BXadxYlTNPbcLyNDBNt+8JuPGnJGDWnLaEv+YGGwcnBC+HFKoC3R8ci/g
 VcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593117; x=1717197917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fHFkoGc3LcCzc/uNih0n52xsiOuWG1pYAHjpL/yQXc0=;
 b=BUT2MBy8R66sMd7FGjnVIP2wgjDPEvNECIQ8xcwWqpD3HaRooJlfqHUyxUXUcrpq20
 5tJecxZZFAKZRDxcAct5H2ZDGO38VTl3iURLXP3rAp4JQ4o1IUX8WD+nvA4hBEL1w2QS
 IDQvh4y1RqGyZ3fmrvRb5HlS6j7AnUzGhD5JdwFn403MNiz1JbwPmFstfn6ZtB34rgUM
 YDC/DsEEO3p1dkCbVvrgo8RzC9Qy7MSXJ9F6s0BDHJ4XdBslkcbJWpSKYaChSrTlQHYl
 GBjQmcE8sntr7ZlhEJmmnNV89ESswyn24ZEzimKlpgrjxVQ0+AnAwURLHtbqWWkFPhms
 gzlA==
X-Gm-Message-State: AOJu0YzfyeRotyR1saxUQadYiZDIZWu9y5WE3FbkC8wD+LWFBa6zod3v
 YntMRUjZ6w/Fa5d51bkGwC0Spn2RxSJ9Wi/2ZAUuTj/pAWV7nEXJPlL1wXEiOgubUU/6NmzzHgZ
 /
X-Received: by 2002:a05:6a00:4516:b0:6ed:435f:ec9b with SMTP id
 d2e1a72fcca58-6f8f3d589d6mr4140551b3a.20.1716593117586; 
 Fri, 24 May 2024 16:25:17 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 63/67] target/arm: Convert MLA, MLS to decodetree
Date: Fri, 24 May 2024 16:21:17 -0700
Message-Id: <20240524232121.284515-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
X-TUID: wz0yfPDWvk0n

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  8 ++++
 target/arm/tcg/translate-a64.c | 77 ++++++++++------------------------
 2 files changed, 31 insertions(+), 54 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 3ea0643370..2dea68a0a9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -928,6 +928,8 @@ SABA_v          0.00 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
 UABA_v          0.10 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
 MUL_v           0.00 1110 ..1 ..... 10011 1 ..... ..... @qrrr_e
 PMUL_v          0.10 1110 001 ..... 10011 1 ..... ..... @qrrr_b
+MLA_v           0.00 1110 ..1 ..... 10010 1 ..... ..... @qrrr_e
+MLS_v           0.10 1110 ..1 ..... 10010 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
@@ -972,3 +974,9 @@ FMLSL2_vi       0.10 1111 10 .. .... 1100 . 0 ..... .....   @qrrx_h
 
 MUL_vi          0.00 1111 01 .. .... 1000 . 0 ..... .....   @qrrx_h
 MUL_vi          0.00 1111 10 . ..... 1000 . 0 ..... .....   @qrrx_s
+
+MLA_vi          0.10 1111 01 .. .... 0000 . 0 ..... .....   @qrrx_h
+MLA_vi          0.10 1111 10 . ..... 0000 . 0 ..... .....   @qrrx_s
+
+MLS_vi          0.10 1111 01 .. .... 0100 . 0 ..... .....   @qrrx_h
+MLS_vi          0.10 1111 10 . ..... 0100 . 0 ..... .....   @qrrx_s
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1909d1426c..c4601cde2f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5470,6 +5470,8 @@ TRANS(SABD_v, do_gvec_fn3_no64, a, gen_gvec_sabd)
 TRANS(UABD_v, do_gvec_fn3_no64, a, gen_gvec_uabd)
 TRANS(MUL_v, do_gvec_fn3_no64, a, tcg_gen_gvec_mul)
 TRANS(PMUL_v, do_gvec_op3_ool, a, 0, gen_helper_gvec_pmul_b)
+TRANS(MLA_v, do_gvec_fn3_no64, a, gen_gvec_mla)
+TRANS(MLS_v, do_gvec_fn3_no64, a, gen_gvec_mls)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -5712,6 +5714,24 @@ static gen_helper_gvec_3 * const f_vector_idx_mul[2] = {
 };
 TRANS(MUL_vi, do_int3_vector_idx, a, f_vector_idx_mul)
 
+static bool do_mla_vector_idx(DisasContext *s, arg_qrrx_e *a, bool sub)
+{
+    static gen_helper_gvec_4 * const fns[2][2] = {
+        { gen_helper_gvec_mla_idx_h, gen_helper_gvec_mls_idx_h },
+        { gen_helper_gvec_mla_idx_s, gen_helper_gvec_mls_idx_s },
+    };
+
+    assert(a->esz == MO_16 || a->esz == MO_32);
+    if (fp_access_check(s)) {
+        gen_gvec_op4_ool(s, a->q, a->rd, a->rn, a->rm, a->rd,
+                         a->idx, fns[a->esz - 1][sub]);
+    }
+    return true;
+}
+
+TRANS(MLA_vi, do_mla_vector_idx, a, false)
+TRANS(MLS_vi, do_mla_vector_idx, a, true)
+
 /*
  * Advanced SIMD scalar pairwise
  */
@@ -10945,12 +10965,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     switch (opcode) {
-    case 0x12: /* MLA, MLS */
-        if (size == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0x16: /* SQDMULH, SQRDMULH */
         if (size == 0 || size == 3) {
             unallocated_encoding(s);
@@ -10981,6 +10995,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x0f: /* SABA, UABA */
     case 0x10: /* ADD, SUB */
     case 0x11: /* CMTST, CMEQ */
+    case 0x12: /* MLA, MLS */
     case 0x13: /* MUL, PMUL */
         unallocated_encoding(s);
         return;
@@ -10991,13 +11006,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x12: /* MLA, MLS */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_mls, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_mla, size);
-        }
-        return;
     case 0x16: /* SQDMULH, SQRDMULH */
         {
             static gen_helper_gvec_3_ptr * const fns[2][2] = {
@@ -12204,13 +12212,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     TCGv_ptr fpst;
 
     switch (16 * u + opcode) {
-    case 0x10: /* MLA */
-    case 0x14: /* MLS */
-        if (is_scalar) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0x02: /* SMLAL, SMLAL2 */
     case 0x12: /* UMLAL, UMLAL2 */
     case 0x06: /* SMLSL, SMLSL2 */
@@ -12292,6 +12293,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x05: /* FMLS */
     case 0x08: /* MUL */
     case 0x09: /* FMUL */
+    case 0x10: /* MLA */
+    case 0x14: /* MLS */
     case 0x18: /* FMLAL2 */
     case 0x19: /* FMULX */
     case 0x1c: /* FMLSL2 */
@@ -12412,40 +12415,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                                : gen_helper_gvec_fcmlah_idx);
         }
         return;
-
-    case 0x10: /* MLA */
-        if (!is_long && !is_scalar) {
-            static gen_helper_gvec_4 * const fns[3] = {
-                gen_helper_gvec_mla_idx_h,
-                gen_helper_gvec_mla_idx_s,
-                gen_helper_gvec_mla_idx_d,
-            };
-            tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
-                               vec_full_reg_offset(s, rn),
-                               vec_full_reg_offset(s, rm),
-                               vec_full_reg_offset(s, rd),
-                               is_q ? 16 : 8, vec_full_reg_size(s),
-                               index, fns[size - 1]);
-            return;
-        }
-        break;
-
-    case 0x14: /* MLS */
-        if (!is_long && !is_scalar) {
-            static gen_helper_gvec_4 * const fns[3] = {
-                gen_helper_gvec_mls_idx_h,
-                gen_helper_gvec_mls_idx_s,
-                gen_helper_gvec_mls_idx_d,
-            };
-            tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
-                               vec_full_reg_offset(s, rn),
-                               vec_full_reg_offset(s, rm),
-                               vec_full_reg_offset(s, rd),
-                               is_q ? 16 : 8, vec_full_reg_size(s),
-                               index, fns[size - 1]);
-            return;
-        }
-        break;
     }
 
     if (size == 3) {
-- 
2.34.1

