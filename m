Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1273235ejc;
        Sun, 5 May 2024 18:15:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXa+PgpGJyjPVRxdOqbV2tp82ZdNH/ZpYsEzc+V/8w7wglnRtFfOMvogrk0f39iqHLLlvZmdv6FUBzr2w3UqFMsSURLGa7P
X-Google-Smtp-Source: AGHT+IFKo6jurKVfQeu4NWP1NojIlGZpMEf4yGlDUSmzGYEHkDxPmQYGHwmea/2EiSllD9/l7nAM
X-Received: by 2002:ac8:7d01:0:b0:43a:dedd:3238 with SMTP id g1-20020ac87d01000000b0043adedd3238mr10143090qtb.0.1714958113696;
        Sun, 05 May 2024 18:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714958113; cv=none;
        d=google.com; s=arc-20160816;
        b=X9qaw8tQDXnjOB/ZXjZ6znsw4UqB4LuYfhBwW+5KVSc/qNrCz4itUZmeSwJHfOtSw0
         rNIdSBlrjxbEMhWyXuyWANAjRtj8qBumPMA/tiX0dL0bREABgHMT6MseRUeJwfECLAvM
         WwERSfR1hLAiFlBriRKjj4P9Aix2TyuKPIGVKHJnGKrwlamYxsF6RQxuFsqy4tgnIPD3
         C0vMF3XeKir9nar9GzABqBHc+2uwgNc1ZAJeqKmtFOM2L4DcNtmMIGvTeZ8k7TF+/wGA
         1BEQAmA1zYVpnnq6Czopz9zfj1azjuDgyrb99XYxg/aMKuDqma1qzpp86PGGKzY9u3J+
         zJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pg5PE4uCNyJoQzz7Wu/fhXy6Xq//DI/x03rYIO5TrJQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=iIorejumrmQAIOQSypmAvIopPOGv/cfXQ2IO9VojBbrtweSMG0Ft8lkypzRZU7REBj
         G2qXjZYjknyMDj0g01JV8D7+FuoRuFxrEK07B064qEWnteulP1eXU59lo9F2jKQ7idK9
         2zByqiR16AZ0g/PDNa2ZoBs1hDE4GESXiL5EK5sRPFsjOautVyJJiVDAvYx5PelzhtmE
         d45HmwuCKqxuBpsqZ4y3q4dX+Fn+eXjCELbBd/e74g3Q5oV+877Vwx9sgbavqudVX2+c
         Ro5aTaeMangICRPPV2AcChEFuwMfqF+dHRh8P09nBPTPMfY5X9uRGpS1N+9x84S57ENU
         Ddhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VMj0xofA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020a05622a040600b00437c0121802si8599822qtx.446.2024.05.05.18.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VMj0xofA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mqM-0001pl-3u; Sun, 05 May 2024 21:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mps-0008Bs-S0
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:08:12 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpc-0003Ob-RZ
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:08:01 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6f44b296e1fso763985b3a.3
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957671; x=1715562471; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pg5PE4uCNyJoQzz7Wu/fhXy6Xq//DI/x03rYIO5TrJQ=;
 b=VMj0xofAKW4zrwlcplwTxELth0UnykpiK96Y61+nB7CoLY/amW/ZNMGJN/+PS1Q/TX
 B6A885UKJjEafrqGd3P/PFgkCuSJl7OPakyGIeWbHiphVFTJ7r3GZRvi9cIziJos6VHP
 YDMe5kWTdak6don7vj3cVkt+p4et0f25vlSd+pfwseDFqSEe6/stHK17rhPQRIzwwPA3
 twCa93zJLsyzT9LgOHkZbz9RahyP9zR3sCFhCAS4cmBwJBioCn2gNbieYEJYMJTxpOnh
 mV/gYZZt7/BcQQuV//2xRXVT0QQLgJ08J9/8BfPaZTQCp5GP2/RbzxRgfU8KHxtXSwT8
 IpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957671; x=1715562471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pg5PE4uCNyJoQzz7Wu/fhXy6Xq//DI/x03rYIO5TrJQ=;
 b=wvjSZ6tW1zWfmSVAhqQXd/opzkC3boqVVuUILy8wXxvWyGVmH6OuJtMtRgimwNNv7q
 dg0tCLSp6C1DbLK5tyFmyz7+M5spdD5E//GD5W1W/OjwotjDiU2rXjUomTCKg5i9N+eZ
 81FTjnIq5MelqhFmA5zpdRQd07fITUTgeke7biqSmZhjk2MrWzc5OGVYDIuRiBMeHTKO
 QWEKSPIoAWX7Zl5YR+v0d/adlb9qvJ/dfnC528zPWQ/F/Foo5lCKDa++rA6IvMG4Zxso
 C1GfGQTSeqoPdyXlqDxafkwzSaRFJmlDzkiVl/H56NBXe05HO6HjFkuVK46O8NF9I+yh
 gvUA==
X-Gm-Message-State: AOJu0Yy4mOg8qscmto4BlbuCzdBfTEI5b2oRpW/bq1rWMOAdmE+j8uJa
 qsHotYnm8DAMl1ujp8KdwzxWp7BAt49uBVqh2lyLI8MYau/shN7SXmzSDVj8Pxj1LGBpRxauDxM
 o
X-Received: by 2002:a05:6a00:1381:b0:6ea:e2fd:6100 with SMTP id
 t1-20020a056a00138100b006eae2fd6100mr9933413pfg.30.1714957670831; 
 Sun, 05 May 2024 18:07:50 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 55/57] target/arm: Convert MLA, MLS to decodetree
Date: Sun,  5 May 2024 18:04:01 -0700
Message-Id: <20240506010403.6204-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: LnUkrzWtIfjR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  8 ++++
 target/arm/tcg/translate-a64.c | 77 ++++++++++------------------------
 2 files changed, 31 insertions(+), 54 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index dbeb5667fd..8f7ae63e17 100644
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
index cd39fa1f20..c217522b2b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5471,6 +5471,8 @@ TRANS(SABD_v, do_gvec_fn3_no64, a, gen_gvec_sabd)
 TRANS(UABD_v, do_gvec_fn3_no64, a, gen_gvec_uabd)
 TRANS(MUL_v, do_gvec_fn3_no64, a, tcg_gen_gvec_mul)
 TRANS(PMUL_v, do_gvec_op3_ool, a, 0, gen_helper_gvec_pmul_b)
+TRANS(MLA_v, do_gvec_fn3_no64, a, gen_gvec_mla)
+TRANS(MLS_v, do_gvec_fn3_no64, a, gen_gvec_mls)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -5713,6 +5715,24 @@ static gen_helper_gvec_3 * const f_vector_idx_mul[2] = {
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
@@ -10939,12 +10959,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
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
@@ -10975,6 +10989,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x0f: /* SABA, UABA */
     case 0x10: /* ADD, SUB */
     case 0x11: /* CMTST, CMEQ */
+    case 0x12: /* MLA, MLS */
     case 0x13: /* MUL, PMUL */
         unallocated_encoding(s);
         return;
@@ -10985,13 +11000,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
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
@@ -12198,13 +12206,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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
@@ -12286,6 +12287,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x05: /* FMLS */
     case 0x08: /* MUL */
     case 0x09: /* FMUL */
+    case 0x10: /* MLA */
+    case 0x14: /* MLS */
     case 0x18: /* FMLAL2 */
     case 0x19: /* FMULX */
     case 0x1c: /* FMLSL2 */
@@ -12406,40 +12409,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
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

