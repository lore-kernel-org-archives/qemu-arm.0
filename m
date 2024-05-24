Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1996208ejb;
        Fri, 24 May 2024 16:32:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8N5uat5pOPzQdHsV6jYy8vMnrIktEulJOmRyJ6EO/47cJDLEH4KJToaaWu89I6Kl1w2b0kTgEmD5MQWWJnDZ6b+HIzQQe
X-Google-Smtp-Source: AGHT+IG5B1D5R2DREL8xx/UZAL7MkBme7Fwq0HHC8PHo1cWkS08cOahLVJwmhkvNZzuqtyfAKY2s
X-Received: by 2002:a05:620a:4310:b0:792:c473:f645 with SMTP id af79cd13be357-794ab110c42mr470743085a.54.1716593554344;
        Fri, 24 May 2024 16:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593554; cv=none;
        d=google.com; s=arc-20160816;
        b=eDu9UBv62uOi3yIUO3awWdxw++i1vAmunKYzZjxD9Z6v2ixRA+7hh9SmsoAXyWfpal
         PNRbEbL7vT3k4B3Iaiw1ldundmfTD0hhEZOamGUw5QdnQoQ7JbNbCO1COWpTcB4PMmQn
         uQlodmUPu8ph0ZCKEBXTrkDUV9rFgAQG9jM7X7Sh5LIvQXC6WtDrWhBUSstd1FUTzEPa
         l6xYRPMivWanAvdQUD7X+DGa1bvauB3qtsSqe0qZwp7jbbdCsMY/Lh2C9bxUJldgZHZa
         nzJFxr84bza4H/ez7QEKvFBOlaVWjDEOEBuyPlH8atnUW8xIHCGMNEO1Z4HSbBXo6mm/
         1Mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qavblcON+mCWl8e6AfEri+fwfThNcoFUl1qibQ4A/vo=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=vIoV6bCvQhfuoSWkF9SBrzGmj5MWRycxyK7aGJGWIoCyxkb8rfaEkfxGBf9cRy4T84
         SQjw8wHTtjr3FZro9wsoF0j81nRLQFtKOrPJXZVwlpK1Ngwjws5eRVL3mNnx/dxiqaO2
         dgYudSbjOlyuoywUR4u1JDg/rrIN3h8Z5UvSMQSc3AKpHTYAHnoKsMW5TofaZdjscMET
         1/YLAxT5uNsGbciI1ueVHIQn2pXB5g6PH/9JF0GSJBoDm5jAzuEireKDHQI5UsAKfM3x
         GQCpP4xY9MmSfi8rBibiq3nBXiwZkILIOgd5D4+08QN1KmLKU1aWSaANfKyCEm2Qny17
         Ww0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vl+GmzWB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd3e7a3si282249785a.517.2024.05.24.16.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vl+GmzWB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeEh-0006vO-GF; Fri, 24 May 2024 19:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEc-0006pZ-MX
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:22:02 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEV-0005uC-5I
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:22:02 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1f44b5ba445so12730085ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592914; x=1717197714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qavblcON+mCWl8e6AfEri+fwfThNcoFUl1qibQ4A/vo=;
 b=vl+GmzWBlIL47vmrAE3vCZt9dLnp3AEzK4QNhIJ7qtmENjaCNTomMMIRhT+2WhFnFl
 Uv9GonfB82ow/9qcGAN6bcMUcxbfg/0mBOhlgarmzftgBlmxqSOOAAJS99FkPY0gPq83
 O19QXZowpxHbI/iA3UZ/CXCK7LssxNdC4n6hZ2i+TjKgP6LfWra1bPqtZ8T9CAGe3yhj
 bbhm5BeHD4CXcMCEFTxoAKmyAc9qHkK4hXcBp67VG9JCS8IF3df9DBFbKaSu0g6zjpIs
 zQx+p8DCerYB0dvFldBkLraMrHqyDgHrqAAyR+IXZtDmlc6uYUF1iacUUQ20XhPuhzH/
 YDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592914; x=1717197714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qavblcON+mCWl8e6AfEri+fwfThNcoFUl1qibQ4A/vo=;
 b=hWQ4EXUfJY2rCiVYwgfrGmttZku5qSyyBSqk79IwHGUYoq9E2fveGgWGWL/mKQWa/j
 O8ckXJztE/eRcprxJuau/edRPKHuvCstdWmdD4Ia9m+Mq+DHG57Rz1DTw76knofu6R7s
 c7xzxxPhOTJWiDqG/VKqW5M6/Cn4hiX8oBIRnZGq69G94aSWXpviCuZIT1INjGZQqC3b
 eSJtEqMfBiiHaUVjUiLUZCVCBpLGnHTqNMlE/ChHW7SyzqjFgsQF+0fLfmmFQEMiDyNr
 5UfpgaZSEE/HGVdOopNCiMYmEoyD3XGSt17JOq7EcGSHnlQQmqTFztAbdmznRl7a66hP
 SLNg==
X-Gm-Message-State: AOJu0Yy9IuCgEkVvyJmpINH0Vy2nuU8P2NoJW+umrYJURktzaNFVR49H
 ufV056UX9HP2t1g5yzWhRDG3pVyt3Tp7+Iayc9kF0rPfUj5zwHjdp2k+xYMX6nAm8Rf2K1A9fF4
 n
X-Received: by 2002:a17:902:f7d2:b0:1f3:3d2c:a771 with SMTP id
 d9443c01a7336-1f4497dd05amr28721155ad.51.1716592913730; 
 Fri, 24 May 2024 16:21:53 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 35/67] target/arm: Convert FMLAL, FMLSL to decodetree
Date: Fri, 24 May 2024 16:20:49 -0700
Message-Id: <20240524232121.284515-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: uMloDifueuOo

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  10 +++
 target/arm/tcg/translate-a64.c | 144 ++++++++++-----------------------
 2 files changed, 51 insertions(+), 103 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 22dfe8568d..7e993ed345 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -797,6 +797,11 @@ FMLA_v          0.00 1110 0.1 ..... 11001 1 ..... ..... @qrrr_sd
 FMLS_v          0.00 1110 110 ..... 00001 1 ..... ..... @qrrr_h
 FMLS_v          0.00 1110 1.1 ..... 11001 1 ..... ..... @qrrr_sd
 
+FMLAL_v         0.00 1110 001 ..... 11101 1 ..... ..... @qrrr_h
+FMLSL_v         0.00 1110 101 ..... 11101 1 ..... ..... @qrrr_h
+FMLAL2_v        0.10 1110 001 ..... 11001 1 ..... ..... @qrrr_h
+FMLSL2_v        0.10 1110 101 ..... 11001 1 ..... ..... @qrrr_h
+
 FCMEQ_v         0.00 1110 010 ..... 00100 1 ..... ..... @qrrr_h
 FCMEQ_v         0.00 1110 0.1 ..... 11100 1 ..... ..... @qrrr_sd
 
@@ -877,3 +882,8 @@ FMLS_vi         0.00 1111 11 0 ..... 0101 . 0 ..... .....   @qrrx_d
 FMULX_vi        0.10 1111 00 .. .... 1001 . 0 ..... .....   @qrrx_h
 FMULX_vi        0.10 1111 10 . ..... 1001 . 0 ..... .....   @qrrx_s
 FMULX_vi        0.10 1111 11 0 ..... 1001 . 0 ..... .....   @qrrx_d
+
+FMLAL_vi        0.00 1111 10 .. .... 0000 . 0 ..... .....   @qrrx_h
+FMLSL_vi        0.00 1111 10 .. .... 0100 . 0 ..... .....   @qrrx_h
+FMLAL2_vi       0.10 1111 10 .. .... 1000 . 0 ..... .....   @qrrx_h
+FMLSL2_vi       0.10 1111 10 .. .... 1100 . 0 ..... .....   @qrrx_h
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9fe70a939b..a4ff1fd202 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5256,6 +5256,24 @@ static gen_helper_gvec_3_ptr * const f_vector_fminnmp[3] = {
 };
 TRANS(FMINNMP_v, do_fp3_vector, a, f_vector_fminnmp)
 
+static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
+{
+    if (fp_access_check(s)) {
+        int data = (is_2 << 1) | is_s;
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm), tcg_env,
+                           a->q ? 16 : 8, vec_full_reg_size(s),
+                           data, gen_helper_gvec_fmlal_a64);
+    }
+    return true;
+}
+
+TRANS_FEAT(FMLAL_v, aa64_fhm, do_fmlal, a, false, false)
+TRANS_FEAT(FMLSL_v, aa64_fhm, do_fmlal, a, true, false)
+TRANS_FEAT(FMLAL2_v, aa64_fhm, do_fmlal, a, false, true)
+TRANS_FEAT(FMLSL2_v, aa64_fhm, do_fmlal, a, true, true)
+
 TRANS(ADDP_v, do_gvec_fn3, a, gen_gvec_addp)
 TRANS(SMAXP_v, do_gvec_fn3_no64, a, gen_gvec_smaxp)
 TRANS(SMINP_v, do_gvec_fn3_no64, a, gen_gvec_sminp)
@@ -5447,6 +5465,24 @@ static bool do_fmla_vector_idx(DisasContext *s, arg_qrrx_e *a, bool neg)
 TRANS(FMLA_vi, do_fmla_vector_idx, a, false)
 TRANS(FMLS_vi, do_fmla_vector_idx, a, true)
 
+static bool do_fmlal_idx(DisasContext *s, arg_qrrx_e *a, bool is_s, bool is_2)
+{
+    if (fp_access_check(s)) {
+        int data = (a->idx << 2) | (is_2 << 1) | is_s;
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm), tcg_env,
+                           a->q ? 16 : 8, vec_full_reg_size(s),
+                           data, gen_helper_gvec_fmlal_idx_a64);
+    }
+    return true;
+}
+
+TRANS_FEAT(FMLAL_vi, aa64_fhm, do_fmlal_idx, a, false, false)
+TRANS_FEAT(FMLSL_vi, aa64_fhm, do_fmlal_idx, a, true, false)
+TRANS_FEAT(FMLAL2_vi, aa64_fhm, do_fmlal_idx, a, false, true)
+TRANS_FEAT(FMLSL2_vi, aa64_fhm, do_fmlal_idx, a, true, true)
+
 /*
  * Advanced SIMD scalar pairwise
  */
@@ -10911,78 +10947,6 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Floating point op subgroup of C3.6.16. */
-static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
-{
-    /* For floating point ops, the U, size[1] and opcode bits
-     * together indicate the operation. size[0] indicates single
-     * or double.
-     */
-    int fpopcode = extract32(insn, 11, 5)
-        | (extract32(insn, 23, 1) << 5)
-        | (extract32(insn, 29, 1) << 6);
-    int is_q = extract32(insn, 30, 1);
-    int size = extract32(insn, 22, 1);
-    int rm = extract32(insn, 16, 5);
-    int rn = extract32(insn, 5, 5);
-    int rd = extract32(insn, 0, 5);
-
-    if (size == 1 && !is_q) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (fpopcode) {
-    case 0x1d: /* FMLAL  */
-    case 0x3d: /* FMLSL  */
-    case 0x59: /* FMLAL2 */
-    case 0x79: /* FMLSL2 */
-        if (size & 1 || !dc_isar_feature(aa64_fhm, s)) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (fp_access_check(s)) {
-            int is_s = extract32(insn, 23, 1);
-            int is_2 = extract32(insn, 29, 1);
-            int data = (is_2 << 1) | is_s;
-            tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
-                               vec_full_reg_offset(s, rn),
-                               vec_full_reg_offset(s, rm), tcg_env,
-                               is_q ? 16 : 8, vec_full_reg_size(s),
-                               data, gen_helper_gvec_fmlal_a64);
-        }
-        return;
-
-    default:
-    case 0x18: /* FMAXNM */
-    case 0x19: /* FMLA */
-    case 0x1a: /* FADD */
-    case 0x1b: /* FMULX */
-    case 0x1c: /* FCMEQ */
-    case 0x1e: /* FMAX */
-    case 0x1f: /* FRECPS */
-    case 0x38: /* FMINNM */
-    case 0x39: /* FMLS */
-    case 0x3a: /* FSUB */
-    case 0x3e: /* FMIN */
-    case 0x3f: /* FRSQRTS */
-    case 0x58: /* FMAXNMP */
-    case 0x5a: /* FADDP */
-    case 0x5b: /* FMUL */
-    case 0x5c: /* FCMGE */
-    case 0x5d: /* FACGE */
-    case 0x5e: /* FMAXP */
-    case 0x5f: /* FDIV */
-    case 0x78: /* FMINNMP */
-    case 0x7a: /* FABD */
-    case 0x7d: /* FACGT */
-    case 0x7c: /* FCMGT */
-    case 0x7e: /* FMINP */
-        unallocated_encoding(s);
-        return;
-    }
-}
-
 /* Integer op subgroup of C3.6.16. */
 static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
 {
@@ -11251,16 +11215,13 @@ static void disas_simd_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x3: /* logic ops */
         disas_simd_3same_logic(s, insn);
         break;
-    case 0x18 ... 0x31:
-        /* floating point ops, sz[1] and U are part of opcode */
-        disas_simd_3same_float(s, insn);
-        break;
     default:
         disas_simd_3same_int(s, insn);
         break;
     case 0x14: /* SMAXP, UMAXP */
     case 0x15: /* SMINP, UMINP */
     case 0x17: /* ADDP */
+    case 0x18 ... 0x31: /* floating point ops */
         unallocated_encoding(s);
         break;
     }
@@ -12526,22 +12487,15 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
         is_fp = 2;
         break;
-    case 0x00: /* FMLAL */
-    case 0x04: /* FMLSL */
-    case 0x18: /* FMLAL2 */
-    case 0x1c: /* FMLSL2 */
-        if (is_scalar || size != MO_32 || !dc_isar_feature(aa64_fhm, s)) {
-            unallocated_encoding(s);
-            return;
-        }
-        size = MO_16;
-        /* is_fp, but we pass tcg_env not fp_status.  */
-        break;
     default:
+    case 0x00: /* FMLAL */
     case 0x01: /* FMLA */
+    case 0x04: /* FMLSL */
     case 0x05: /* FMLS */
     case 0x09: /* FMUL */
+    case 0x18: /* FMLAL2 */
     case 0x19: /* FMULX */
+    case 0x1c: /* FMLSL2 */
         unallocated_encoding(s);
         return;
     }
@@ -12660,22 +12614,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
         return;
 
-    case 0x00: /* FMLAL */
-    case 0x04: /* FMLSL */
-    case 0x18: /* FMLAL2 */
-    case 0x1c: /* FMLSL2 */
-        {
-            int is_s = extract32(opcode, 2, 1);
-            int is_2 = u;
-            int data = (index << 2) | (is_2 << 1) | is_s;
-            tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
-                               vec_full_reg_offset(s, rn),
-                               vec_full_reg_offset(s, rm), tcg_env,
-                               is_q ? 16 : 8, vec_full_reg_size(s),
-                               data, gen_helper_gvec_fmlal_idx_a64);
-        }
-        return;
-
     case 0x08: /* MUL */
         if (!is_long && !is_scalar) {
             static gen_helper_gvec_3 * const fns[3] = {
-- 
2.34.1

