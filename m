Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp189372ejk;
        Tue, 28 May 2024 13:31:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUwz/cXGCo+zapidE3nhM+MDYWVwJyoFfYfGIQG+ce4LI/lbMF07iq5oHLRWuaTI89DHzQeI5pY3Vz2iKcByI+JrRlDuiwC
X-Google-Smtp-Source: AGHT+IHw//fuTX0EDdQvea8G8coRHKdUxbljYyricb4+0dO3PBICa+cvLl2GAo2KaA+pFu6cPjcD
X-Received: by 2002:a05:620a:178e:b0:792:b96d:370b with SMTP id af79cd13be357-794ab0603e6mr1829287885a.13.1716928318787;
        Tue, 28 May 2024 13:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928318; cv=none;
        d=google.com; s=arc-20160816;
        b=pFL5vPUJrOgnemhBIS0z7/Pp0f/PES1EBJafQbdyEAJStaghd3a2NTNPzLv7J3/bLv
         rc/gOj/BQKn8EU/venyVgUDvr4HEFZqpTCpw1qCTE0BFSY0cHppP6BNi0+epdD25UYiS
         OUytenqpaEzPB4Awg8OhLDwT8kooR1ZjTOuEMKKmC5UXTVgJ+lDXcKazFSJA8Y7iEwpr
         hKdR7DsqPZg1jQwKXXSSkQIW/JEk2OqxtCT5EDbxzRw5taLX1afL4Jv/GLECydF/dC1b
         Ujf1KEOHpJ0DcP9H5MD1n1OEGoASrUg5Few7IHr8/3M+cDmRylpVd0XvPX1snzxb1zn4
         7ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pzE3AydVd0DLId7JKat9ss4c4y2S9U7RevhtH4FXhqc=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Q8+UjbtKz4ht8m12upl8t7/R3aNSRiAXMy8lHBKaL0bO39u1symS5xp81NlmTkRC/E
         nD4q0byz4Exh2DSHCNaXP/1lNaYW18p0GAiwMXN6q+c3jdWnKDjz5l6Al2GmGLDVYD8z
         G7qtJ5gtjn3V9P+ib1A84XCCvuLCfIznjuve5V2q0BiMuj9C5B8+ohxJEd6pLI6hRJMw
         Zx1i2xrq3tlIgFWqb8uTh/d8wwEV0fG8N5VISK3XwWSO5b1mPySdSsnpROJ/kpV1Drnr
         mJsw9+SpJNvDGyeJOKGfj3HHYHbwQCro/E0TD09VyKTTDecM4reJlF2j6Ij+RU1eY6or
         ZUzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfDJ+ZIW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd141e3si1192946985a.228.2024.05.28.13.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AfDJ+ZIW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3Tg-00036R-Tl; Tue, 28 May 2024 16:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TW-0002w6-UW
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:14 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TK-0003dJ-AH
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:13 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6f693fb0ad4so1055605b3a.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928259; x=1717533059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzE3AydVd0DLId7JKat9ss4c4y2S9U7RevhtH4FXhqc=;
 b=AfDJ+ZIWdixf8YXFQIreeUABnSnmY5Tzr/STSOywgsZ1Dc/ep8SlrEFmm0xuVq/04F
 jyf66UI1laQ3eXx+F6NuQRZ3+fkAvyDomWtqNWZtWVAonAsS+JpxhvH1tEgkNN4ETLPk
 Lnihhw1qGBBKEgSOpn8TKFMng49+t+e0KkqZRihY470DHx6SMBh8CR45+b27NGvMgsH7
 Kxn5K2I9rXWKzSxRGRMtvyFi9tEiJwZNvx6xAyqemvJdewojH5nFJTyYTsdHJ7UJryF9
 jykyQ2m16FFftM0NyOpvUsRBRIXKRDiXfYBpjG6xug80YKol28vFXHlSbVv5VmPfJat1
 +xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928259; x=1717533059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pzE3AydVd0DLId7JKat9ss4c4y2S9U7RevhtH4FXhqc=;
 b=SSXSGK9zwYXM4DBgq8p8IHrZTcIXGyov5oXKZ5wqGGqds1StiH5MdfNfA002QymIAs
 0NjR7BIUhTsKvyLZxroDaWBowFylXmfLb2unLrtFdz/cIKN7NzjdrTjhDJDtzMf+sTXy
 pGBvLmLB9b7MjlwbWmjH3qrPrRGa0vIPFiHLdd1wrnxJYXGtdZUfy7VG/TCevvXdKbZB
 +2HlXYIs22uzJ5nkPdtoiIolV5oeVDahJlW74MNdpiprlu8wibgowZeUtKYE+Eep+6Ik
 4KVhnrKuCr2up2zMfbFoNlT2eCHh49lVaB11QwTGBTp3N2Frkx0IB1oe8/wLwxXoUHhT
 By0Q==
X-Gm-Message-State: AOJu0YyssHUSUpkrU0RVqFHpxksyCh1r1ZWfGupuiw+wQDg6nntrwZxM
 rBEnjnOEdCoLUOuI2ZbPssL/SnXe/UXRcK/gIsfG1zSC9zReFsTn85wT7Ms1NB1gvQJ5Zd8T8Yu
 k
X-Received: by 2002:a05:6a20:da81:b0:1b2:280d:90a4 with SMTP id
 adf61e73a8af0-1b2280de3d0mr10494797637.7.1716928259357; 
 Tue, 28 May 2024 13:30:59 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:30:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 15/33] target/arm: Convert SQRSHL, UQRSHL to decodetree
Date: Tue, 28 May 2024 13:30:26 -0700
Message-Id: <20240528203044.612851-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: bXb86iORIpIF

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 +++
 target/arm/tcg/translate-a64.c | 48 ++++++++++++++++------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 85caf37948..96ce35ad40 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -762,6 +762,8 @@ SRSHL_s         0101 1110 111 ..... 01010 1 ..... ..... @rrr_d
 URSHL_s         0111 1110 111 ..... 01010 1 ..... ..... @rrr_d
 SQSHL_s         0101 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
 UQSHL_s         0111 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
+SQRSHL_s        0101 1110 ..1 ..... 01011 1 ..... ..... @rrr_e
+UQRSHL_s        0111 1110 ..1 ..... 01011 1 ..... ..... @rrr_e
 
 ### Advanced SIMD scalar pairwise
 
@@ -890,6 +892,8 @@ SRSHL_v         0.00 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 URSHL_v         0.10 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 SQSHL_v         0.00 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
 UQSHL_v         0.10 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
+SQRSHL_v        0.00 1110 ..1 ..... 01011 1 ..... ..... @qrrr_e
+UQRSHL_v        0.10 1110 ..1 ..... 01011 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b9d577f620..2424c6d314 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5162,6 +5162,22 @@ static const ENVScalar2 f_scalar_uqshl = {
 };
 TRANS(UQSHL_s, do_env_scalar2, a, &f_scalar_uqshl)
 
+static const ENVScalar2 f_scalar_sqrshl = {
+    { gen_helper_neon_qrshl_s8,
+      gen_helper_neon_qrshl_s16,
+      gen_helper_neon_qrshl_s32 },
+    gen_helper_neon_qrshl_s64,
+};
+TRANS(SQRSHL_s, do_env_scalar2, a, &f_scalar_sqrshl)
+
+static const ENVScalar2 f_scalar_uqrshl = {
+    { gen_helper_neon_qrshl_u8,
+      gen_helper_neon_qrshl_u16,
+      gen_helper_neon_qrshl_u32 },
+    gen_helper_neon_qrshl_u64,
+};
+TRANS(UQRSHL_s, do_env_scalar2, a, &f_scalar_uqrshl)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5413,6 +5429,8 @@ TRANS(SRSHL_v, do_gvec_fn3, a, gen_gvec_srshl)
 TRANS(URSHL_v, do_gvec_fn3, a, gen_gvec_urshl)
 TRANS(SQSHL_v, do_gvec_fn3, a, gen_neon_sqshl)
 TRANS(UQSHL_v, do_gvec_fn3, a, gen_neon_uqshl)
+TRANS(SQRSHL_v, do_gvec_fn3, a, gen_neon_sqrshl)
+TRANS(UQRSHL_v, do_gvec_fn3, a, gen_neon_uqrshl)
 
 
 /*
@@ -9426,13 +9444,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         gen_cmtst_i64(tcg_rd, tcg_rn, tcg_rm);
         break;
-    case 0xb: /* SQRSHL, UQRSHL */
-        if (u) {
-            gen_helper_neon_qrshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        } else {
-            gen_helper_neon_qrshl_s64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        }
-        break;
     case 0x10: /* ADD, SUB */
         if (u) {
             tcg_gen_sub_i64(tcg_rd, tcg_rn, tcg_rm);
@@ -9446,6 +9457,7 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     case 0x8: /* SSHL, USHL */
     case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
+    case 0xb: /* SQRSHL, UQRSHL */
         g_assert_not_reached();
     }
 }
@@ -9467,8 +9479,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     TCGv_i64 tcg_rd;
 
     switch (opcode) {
-    case 0xb: /* SQRSHL, UQRSHL */
-        break;
     case 0x6: /* CMGT, CMHI */
     case 0x7: /* CMGE, CMHS */
     case 0x11: /* CMTST, CMEQ */
@@ -9490,6 +9500,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x8: /* SSHL, USHL */
     case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
+    case 0xb: /* SQRSHL, UQRSHL */
         unallocated_encoding(s);
         return;
     }
@@ -9516,16 +9527,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         void (*genfn)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp) = NULL;
 
         switch (opcode) {
-        case 0xb: /* SQRSHL, UQRSHL */
-        {
-            static NeonGenTwoOpEnvFn * const fns[3][2] = {
-                { gen_helper_neon_qrshl_s8, gen_helper_neon_qrshl_u8 },
-                { gen_helper_neon_qrshl_s16, gen_helper_neon_qrshl_u16 },
-                { gen_helper_neon_qrshl_s32, gen_helper_neon_qrshl_u32 },
-            };
-            genenvfn = fns[size][u];
-            break;
-        }
         case 0x16: /* SQDMULH, SQRDMULH */
         {
             static NeonGenTwoOpEnvFn * const fns[2][2] = {
@@ -9540,6 +9541,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         case 0x1: /* SQADD, UQADD */
         case 0x5: /* SQSUB, UQSUB */
         case 0x9: /* SQSHL, UQSHL */
+        case 0xb: /* SQRSHL, UQRSHL */
             g_assert_not_reached();
         }
 
@@ -10959,6 +10961,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x08: /* SSHL, USHL */
     case 0x09: /* SQSHL, UQSHL */
     case 0x0a: /* SRSHL, URSHL */
+    case 0x0b: /* SQRSHL, UQRSHL */
         unallocated_encoding(s);
         return;
     }
@@ -10968,13 +10971,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x0b: /* SQRSHL, UQRSHL */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_uqrshl, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_sqrshl, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
-- 
2.34.1

