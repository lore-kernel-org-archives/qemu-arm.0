Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1272763ejc;
        Sun, 5 May 2024 18:14:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUW1rZ6rGSvBZofXW/Of7ShM4AxnRJmCslgQUdx0AqvvG/mw5uVdg+++JZPOCHmw9Jt40i9sEtssqr0f6YkDcSvwoXbQ27n
X-Google-Smtp-Source: AGHT+IHtkHFDVGcJ+/3WQDd6BALknspgKrOaL/1Rlx7dn/I02f/piAiEdELpTPCUMIndBhAjKEC5
X-Received: by 2002:ad4:5969:0:b0:69b:63d2:6bc3 with SMTP id eq9-20020ad45969000000b0069b63d26bc3mr10390234qvb.5.1714958044026;
        Sun, 05 May 2024 18:14:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714958044; cv=none;
        d=google.com; s=arc-20160816;
        b=Oe++xfABjTMzPyGAJepuTAIJ06x8IiW0sb/p/W/gCrc3HAq/5kH28ftaSS+tgayzWb
         +Jgql/9kDa67SCN1hD5dWLMM4LEIYIRSMqtjvDBzu4ChjZ3oFV5qjsC0XY1KJ5vKrm3h
         8Jcx/h6ILin3jPChYGFjS69bF9MbXpSfm5EwlQKfz53Ed5xvja69r0vxNA1a19Jv26tW
         opnDCJWeDGTwkzXWN6zWdG7RhtrZkpCu6hSC7YSZplAz/kGSo1xD5gxr6iBDs/jnfnwi
         fn0MUywq/YXtRzCZFatJ1dhZcswTdjbVxEEdbCQhHOymhOziQvGlvD/FmLnKrw3hCK9U
         acjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lTrtIrGTzsjY6zTvjWTNn1IEML+p3AEfl++05Y17EPM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=POP+JsjJ22NkSIJ59OGJLUSMvZ8OTZLjSg2f6T1pMZYw0/Rb3pXZzaFNh6NNfIfraQ
         Bl3zmuX6qiSxV2WchyeMw7LNTXYFPamAtlIsPKP0W4kg931Yyxcw7lIhUgQ5pzJdwMjM
         9NcBEO1aH9CZNpmmcChaRA6jVrw4kqDyzN+7JDgbJfZ33akjz+U6iIJXGtHPUgnHJFxy
         DXtcH1N2KXydnqfYE55CyUg0TDyh20oImLM8UcRA4hscl1AhqYcgFJOCkNA5T2aSkV66
         57nGWcvPfQ7kDr5rTBHJF0lIbivRX6pm/BtHfW4dZkLVVts36hGF3vAHk6LB+6sK7xpm
         dWmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VSHU3VOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq15-20020ad4596f000000b0069ff2621eedsi8276029qvb.109.2024.05.05.18.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:14:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VSHU3VOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mqV-0002qq-Vc; Sun, 05 May 2024 21:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mps-0008By-SG
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:08:12 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpb-0003OH-E2
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:08:02 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-23bd61fbd64so1072635fac.0
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957670; x=1715562470; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lTrtIrGTzsjY6zTvjWTNn1IEML+p3AEfl++05Y17EPM=;
 b=VSHU3VOFXHcGf+1L1vdmtwbXqKCAP6tYdwcHv23UzcPJFZIjE5rDQ6xuigEZShQcav
 Z4u/wplZbm3uCouVT/jryJOx0rmt7vBi/v0U3nEwa7w0o1/2hNkxu1nTDrjln4KGPgLE
 QJkltr22jlrpOq55EzHm5UKUq7nlDfrnO5GCvRB0Vs8E8ZcCFYevvpQAAgEXwyTfMEFd
 bAr/HbRHntU7hv/lSALNt3c5DgQAZnMX2JOGb9XdlD953WNOxnxbTaoa22hQGNRNNdCf
 awXkvj55IzAgMKf1GTqP9vBzx1gDFLH7VszRJJ3TRvU9eLRe8CdD8On80IXsxiSC2GaC
 b1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957670; x=1715562470;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lTrtIrGTzsjY6zTvjWTNn1IEML+p3AEfl++05Y17EPM=;
 b=FTkwVL7Kpi4bkvSrAKatLG83PpKCPjHgsBEdJYZvHuUzV5NJwFezjyBdNgOE0nNIo3
 axTz+mw9nMykdLYpgEeAQmjzQiEdg5ESXslc55DOztkDKfih9jV/l/WumVlI9WkSh+YD
 05XAXlZK2KbQqA1YlybqRZFMEnyKgrCH2egXvUCYki03h50TkvOCpfenvQ6XJJ/aFVFR
 ixSGI2MOG2OuanwmLOKpK2/Xpq+daLnD3bnH1+VKpDfzwTB0WiOv/NPcYjPOWA5uqqVl
 aruntqCVajhJpA8sLKwaC+lpKLtcs59QWnKjXWlrPILr5ldkceKft8jcfQad7a56SjTi
 /bdA==
X-Gm-Message-State: AOJu0Yzcj+8VN1HINYfC3Zn+bHMtEU1/D7ab2c5q7Jhg/axOp3DpgTaO
 RTilIBbafW3TbJR1RftK5OSXqqllhRSOUh2I3WuUOVWm3HE+NpB/teLaDgpqaydmGlqowlJ0MxA
 H
X-Received: by 2002:a05:6870:8898:b0:22b:5bc1:66f5 with SMTP id
 m24-20020a056870889800b0022b5bc166f5mr10727143oam.16.1714957670175; 
 Sun, 05 May 2024 18:07:50 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 54/57] target/arm: Convert MUL, PMUL to decodetree
Date: Sun,  5 May 2024 18:04:00 -0700
Message-Id: <20240506010403.6204-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
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
X-TUID: rK0Z+BrVlEz7

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  5 ++++
 target/arm/tcg/translate-a64.c | 51 +++++++++++++---------------------
 2 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index e1667775f6..dbeb5667fd 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -926,6 +926,8 @@ SABD_v          0.00 1110 ..1 ..... 01110 1 ..... ..... @qrrr_e
 UABD_v          0.10 1110 ..1 ..... 01110 1 ..... ..... @qrrr_e
 SABA_v          0.00 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
 UABA_v          0.10 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
+MUL_v           0.00 1110 ..1 ..... 10011 1 ..... ..... @qrrr_e
+PMUL_v          0.10 1110 001 ..... 10011 1 ..... ..... @qrrr_b
 
 ### Advanced SIMD scalar x indexed element
 
@@ -967,3 +969,6 @@ FMLAL_vi        0.00 1111 10 .. .... 0000 . 0 ..... .....   @qrrx_h
 FMLSL_vi        0.00 1111 10 .. .... 0100 . 0 ..... .....   @qrrx_h
 FMLAL2_vi       0.10 1111 10 .. .... 1000 . 0 ..... .....   @qrrx_h
 FMLSL2_vi       0.10 1111 10 .. .... 1100 . 0 ..... .....   @qrrx_h
+
+MUL_vi          0.00 1111 01 .. .... 1000 . 0 ..... .....   @qrrx_h
+MUL_vi          0.00 1111 10 . ..... 1000 . 0 ..... .....   @qrrx_s
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 2e746d2877..cd39fa1f20 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5469,6 +5469,8 @@ TRANS(SABA_v, do_gvec_fn3_no64, a, gen_gvec_saba)
 TRANS(UABA_v, do_gvec_fn3_no64, a, gen_gvec_uaba)
 TRANS(SABD_v, do_gvec_fn3_no64, a, gen_gvec_sabd)
 TRANS(UABD_v, do_gvec_fn3_no64, a, gen_gvec_uabd)
+TRANS(MUL_v, do_gvec_fn3_no64, a, tcg_gen_gvec_mul)
+TRANS(PMUL_v, do_gvec_op3_ool, a, 0, gen_helper_gvec_pmul_b)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -5695,6 +5697,22 @@ TRANS_FEAT(FMLSL_vi, aa64_fhm, do_fmlal_idx, a, true, false)
 TRANS_FEAT(FMLAL2_vi, aa64_fhm, do_fmlal_idx, a, false, true)
 TRANS_FEAT(FMLSL2_vi, aa64_fhm, do_fmlal_idx, a, true, true)
 
+static bool do_int3_vector_idx(DisasContext *s, arg_qrrx_e *a,
+                               gen_helper_gvec_3 * const fns[2])
+{
+    assert(a->esz == MO_16 || a->esz == MO_32);
+    if (fp_access_check(s)) {
+        gen_gvec_op3_ool(s, a->q, a->rd, a->rn, a->rm, a->idx, fns[a->esz - 1]);
+    }
+    return true;
+}
+
+static gen_helper_gvec_3 * const f_vector_idx_mul[2] = {
+    gen_helper_gvec_mul_idx_h,
+    gen_helper_gvec_mul_idx_s,
+};
+TRANS(MUL_vi, do_int3_vector_idx, a, f_vector_idx_mul)
+
 /*
  * Advanced SIMD scalar pairwise
  */
@@ -10921,12 +10939,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     switch (opcode) {
-    case 0x13: /* MUL, PMUL */
-        if (u && size != 0) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* fall through */
     case 0x12: /* MLA, MLS */
         if (size == 3) {
             unallocated_encoding(s);
@@ -10963,6 +10975,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x0f: /* SABA, UABA */
     case 0x10: /* ADD, SUB */
     case 0x11: /* CMTST, CMEQ */
+    case 0x13: /* MUL, PMUL */
         unallocated_encoding(s);
         return;
     }
@@ -10972,13 +10985,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x13: /* MUL, PMUL */
-        if (!u) { /* MUL */
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_mul, size);
-        } else {  /* PMUL */
-            gen_gvec_op3_ool(s, is_q, rd, rn, rm, 0, gen_helper_gvec_pmul_b);
-        }
-        return;
     case 0x12: /* MLA, MLS */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_mls, size);
@@ -12192,7 +12198,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     TCGv_ptr fpst;
 
     switch (16 * u + opcode) {
-    case 0x08: /* MUL */
     case 0x10: /* MLA */
     case 0x14: /* MLS */
         if (is_scalar) {
@@ -12279,6 +12284,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x01: /* FMLA */
     case 0x04: /* FMLSL */
     case 0x05: /* FMLS */
+    case 0x08: /* MUL */
     case 0x09: /* FMUL */
     case 0x18: /* FMLAL2 */
     case 0x19: /* FMULX */
@@ -12401,22 +12407,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
         return;
 
-    case 0x08: /* MUL */
-        if (!is_long && !is_scalar) {
-            static gen_helper_gvec_3 * const fns[3] = {
-                gen_helper_gvec_mul_idx_h,
-                gen_helper_gvec_mul_idx_s,
-                gen_helper_gvec_mul_idx_d,
-            };
-            tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                               vec_full_reg_offset(s, rn),
-                               vec_full_reg_offset(s, rm),
-                               is_q ? 16 : 8, vec_full_reg_size(s),
-                               index, fns[size - 1]);
-            return;
-        }
-        break;
-
     case 0x10: /* MLA */
         if (!is_long && !is_scalar) {
             static gen_helper_gvec_4 * const fns[3] = {
@@ -12485,7 +12475,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             read_vec_element_i32(s, tcg_op, rn, pass, is_scalar ? size : MO_32);
 
             switch (16 * u + opcode) {
-            case 0x08: /* MUL */
             case 0x10: /* MLA */
             case 0x14: /* MLS */
             {
-- 
2.34.1

