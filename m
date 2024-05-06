Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1270103ejc;
        Sun, 5 May 2024 18:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUXJEgblkFsK85VE5JK6kS3ouGR+zYDMyWitBTqQmGBjOJyIX/uXX98S0zM5wUnsymG4pzFreow37rmP0zFcWrhfowD4Anj
X-Google-Smtp-Source: AGHT+IG2PSbgPfPvGeuC2BAdeUZq0qqsuaY1/EpCMVqij6E6+J6Q2IF+fPv0VnXm/laqjBa47uJN
X-Received: by 2002:a05:6122:182a:b0:4da:9aa1:dd5e with SMTP id ay42-20020a056122182a00b004da9aa1dd5emr7781081vkb.10.1714957589598;
        Sun, 05 May 2024 18:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957589; cv=none;
        d=google.com; s=arc-20160816;
        b=NBFrkQUcuC6vYgVndHJMFW25+p39Louh+ygbvOjY3gCZM7IJtbakg58dnPUJTbxsyM
         6N8Jbe7ItOX/vuhzOAkUKshlR+W1W4VwYyXDZTVnt1yEaLQjU+4vkrEBAsGXfJ+1jZXz
         DKhVQFhWWxYDYy8xmz3r48CXD6enco+y4lFO6beOG6KNWyNVjrMJGsAoamJM3cuDOWBx
         LSmWiwQb95FvFPIww7AgnX8rYwacqnLeDmkzwhDsw6uYOL5UgrH73RxUdepX39nt7rMC
         RDCM6FrVDrsj1j88ejORhQOId5OwWR8f9VzkYEfL+exedstwhMDjIX0MwTdMdJrISOhl
         9/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HJ4QWsv6ojEOV5qtz6ssdoc0GL1SICQsYslmR6Fp+aA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=NWH8DUBqPJfX9I39fMHXic0ef5P0eB8w1F5lGboNCQQeFlGm9sY7kf8PefEqMRQqHv
         eDEARFwrCpXXFUOtyOqmyzEinJr7NH/yYZSO22H9r7oIFhP8bCGtek8K3LKz2ico9k/7
         lL4NL1YmUYWaEd5ljE4JofJ68oLHxW6Uj0XakzZ1/j3bmcMdPqYeS2i4L1JbsISPL1Ck
         9YklMZOXLRFymkLRdkLveQB4NhqCtL2Cw+BZ4L108sRux76BHsdH5PONgU+joEZVHMZb
         4SiK0g/749pgNKGfxb7OU4D49rwat2TrM2xmTFCMTbUHV9JNf/tSiq+RyaCK3T0V8xzZ
         GVlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcNzruGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14-20020ac85ace000000b0043b0a663db0si8111727qtd.396.2024.05.05.18.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcNzruGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3moB-00032c-6p; Sun, 05 May 2024 21:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmv-0008Od-Sa
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:05:14 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmQ-0002Y4-J5
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:05:04 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6ee13f19e7eso1119078b3a.1
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957473; x=1715562273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJ4QWsv6ojEOV5qtz6ssdoc0GL1SICQsYslmR6Fp+aA=;
 b=qcNzruGnwcMhyYtR/DN6lXiVCVEKugpnUrBwFjGY7qjDW9acBOCqlmmQuGtFS+FNk2
 JY2G6LmNxTSaZzGsdPRXQkIwlmOiks6WRGP3jZJO2TMmx9PQqX7PCmqg7wTdPUIvqw+0
 wrcJD3S2dof/o9Y8Si+PBn7R1u5GpdkYrEawDESr+sbw84CyQShFq3Y/bPYc4ivaJglQ
 uSEn/bUH2TWWFLSbyYBs0MzvZCmkERCHEtX6mla8JQ4qBRnfyua07zWl6VMNJYkguhas
 zHEo86FBDqRqfQuN3cTCdqGEood1Y8WhOAK3M00LdpXWQgjt2agE3h5hg4Zh7+x8/lsE
 NKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957473; x=1715562273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJ4QWsv6ojEOV5qtz6ssdoc0GL1SICQsYslmR6Fp+aA=;
 b=xVMYGvuuobzHh1xrioCPFZU+bYgx/Ef8zjy4e6+gHyiQJgEKnAVMvgfe/hsxMKUCDl
 75OVFMlbkBGA6PjNkEX6dmzwejQjnGfLSsFh5vQp7D6D9zp5FZbS54mfHUuTpcfiVRQQ
 w/mLfGDHQ18yH61LWmsM31YQ7K6XLOG8JrcheeVgIWg08Gb6A+LkQfnPp5M37VsOEE6g
 EtG9i0ylsUGjR4XTaHdnSvX79aLBoN91gToc/1PkkmJsynksAXBLol6IwfoVYK6fZVhE
 w3ZFu2utHRftnX8JpIHtDBFUx8EEJuxt+7QL9jTYH0qHFPqRiEhFTPgkHW81I8Pb9+sN
 t3qA==
X-Gm-Message-State: AOJu0YzwaYLOfi03RBqxmrdTIHgeBp+8Kbgj8HJYO00TagEBhhGl8MlN
 XnwjVbKUDtmbl0C7E2WeRRIMmoCyE70JzFE77ZY/cpeJAk6jZVPMqxj9RzV8Zgw=
X-Received: by 2002:a05:6a20:438e:b0:1aa:5fb4:87ff with SMTP id
 i14-20020a056a20438e00b001aa5fb487ffmr10043305pzl.14.1714957472901; 
 Sun, 05 May 2024 18:04:32 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 34/57] target/arm: Convert SQADD, SQSUB, UQADD,
 UQSUB to decodetree
Date: Sun,  5 May 2024 18:03:40 -0700
Message-Id: <20240506010403.6204-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: 4QtOYCpgaL2C

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  11 ++++
 target/arm/tcg/translate-a64.c | 100 +++++++++++++++++++--------------
 2 files changed, 68 insertions(+), 43 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d0618ca794..5eced906a9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -44,6 +44,7 @@
 @rrr_h          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=1
 @rrr_sd         ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_sd
 @rrr_hsd        ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_hsd
+@rrr_e          ........ esz:2 . rm:5 ...... rn:5 rd:5  &rrr_e
 
 @rrx_h          ........ .. .. rm:4 .... . . rn:5 rd:5  &rrx_e esz=1 idx=%hlm
 @rrx_s          ........ .. . rm:5  .... . . rn:5 rd:5  &rrx_e esz=2 idx=%hl
@@ -744,6 +745,11 @@ FRECPS_s        0101 1110 0.1 ..... 11111 1 ..... ..... @rrr_sd
 FRSQRTS_s       0101 1110 110 ..... 00111 1 ..... ..... @rrr_h
 FRSQRTS_s       0101 1110 1.1 ..... 11111 1 ..... ..... @rrr_sd
 
+SQADD_s         0101 1110 ..1 ..... 00001 1 ..... ..... @rrr_e
+UQADD_s         0111 1110 ..1 ..... 00001 1 ..... ..... @rrr_e
+SQSUB_s         0101 1110 ..1 ..... 00101 1 ..... ..... @rrr_e
+UQSUB_s         0111 1110 ..1 ..... 00101 1 ..... ..... @rrr_e
+
 ### Advanced SIMD scalar pairwise
 
 FADDP_s         0101 1110 0011 0000 1101 10 ..... ..... @rr_h
@@ -857,6 +863,11 @@ BSL_v           0.10 1110 011 ..... 00011 1 ..... ..... @qrrr_b
 BIT_v           0.10 1110 101 ..... 00011 1 ..... ..... @qrrr_b
 BIF_v           0.10 1110 111 ..... 00011 1 ..... ..... @qrrr_b
 
+SQADD_v         0.00 1110 ..1 ..... 00001 1 ..... ..... @qrrr_e
+UQADD_v         0.10 1110 ..1 ..... 00001 1 ..... ..... @qrrr_e
+SQSUB_v         0.00 1110 ..1 ..... 00101 1 ..... ..... @qrrr_e
+UQSUB_v         0.10 1110 ..1 ..... 00101 1 ..... ..... @qrrr_e
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 12235e06d8..5d91263ebb 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5061,6 +5061,43 @@ static const FPScalar f_scalar_frsqrts = {
 };
 TRANS(FRSQRTS_s, do_fp3_scalar, a, &f_scalar_frsqrts)
 
+static bool do_satacc_s(DisasContext *s, arg_rrr_e *a,
+                MemOp sgn_n, MemOp sgn_m,
+                void (*gen_bhs)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp),
+                void (*gen_d)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv_i64 t0, t1, t2, qc;
+    MemOp esz = a->esz;
+
+    if (!fp_access_check(s)) {
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    qc = tcg_temp_new_i64();
+    read_vec_element(s, t1, a->rn, 0, esz | sgn_n);
+    read_vec_element(s, t2, a->rm, 0, esz | sgn_m);
+    tcg_gen_ld_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
+
+    if (esz == MO_64) {
+        gen_d(t0, qc, t1, t2);
+    } else {
+        gen_bhs(t0, qc, t1, t2, esz);
+        tcg_gen_ext_i64(t0, t0, esz);
+    }
+
+    write_fp_dreg(s, a->rd, t0);
+    tcg_gen_st_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
+    return true;
+}
+
+TRANS(SQADD_s, do_satacc_s, a, MO_SIGN, MO_SIGN, gen_sqadd_bhs, gen_sqadd_d)
+TRANS(SQSUB_s, do_satacc_s, a, MO_SIGN, MO_SIGN, gen_sqsub_bhs, gen_sqsub_d)
+TRANS(UQADD_s, do_satacc_s, a, 0, 0, gen_uqadd_bhs, gen_uqadd_d)
+TRANS(UQSUB_s, do_satacc_s, a, 0, 0, gen_uqsub_bhs, gen_uqsub_d)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5299,6 +5336,11 @@ TRANS(BSL_v, do_bitsel, a->q, a->rd, a->rd, a->rn, a->rm)
 TRANS(BIT_v, do_bitsel, a->q, a->rd, a->rm, a->rn, a->rd)
 TRANS(BIF_v, do_bitsel, a->q, a->rd, a->rm, a->rd, a->rn)
 
+TRANS(SQADD_v, do_gvec_fn3, a, gen_gvec_sqadd_qc)
+TRANS(UQADD_v, do_gvec_fn3, a, gen_gvec_uqadd_qc)
+TRANS(SQSUB_v, do_gvec_fn3, a, gen_gvec_sqsub_qc)
+TRANS(UQSUB_v, do_gvec_fn3, a, gen_gvec_uqsub_qc)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -9285,29 +9327,8 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
      * or scalar-three-reg-same groups.
      */
     TCGCond cond;
-    TCGv_i64 qc;
 
     switch (opcode) {
-    case 0x1: /* SQADD */
-        qc = tcg_temp_new_i64();
-        tcg_gen_ld_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-        if (u) {
-            gen_uqadd_d(tcg_rd, qc, tcg_rn, tcg_rm);
-        } else {
-            gen_sqadd_d(tcg_rd, qc, tcg_rn, tcg_rm);
-        }
-        tcg_gen_st_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-        break;
-    case 0x5: /* SQSUB */
-        qc = tcg_temp_new_i64();
-        tcg_gen_ld_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-        if (u) {
-            gen_uqsub_d(tcg_rd, qc, tcg_rn, tcg_rm);
-        } else {
-            gen_sqsub_d(tcg_rd, qc, tcg_rn, tcg_rm);
-        }
-        tcg_gen_st_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-        break;
     case 0x6: /* CMGT, CMHI */
         cond = u ? TCG_COND_GTU : TCG_COND_GT;
     do_cmop:
@@ -9360,6 +9381,8 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         break;
     default:
+    case 0x1: /* SQADD / UQADD */
+    case 0x5: /* SQSUB / UQSUB */
         g_assert_not_reached();
     }
 }
@@ -9381,8 +9404,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     TCGv_i64 tcg_rd;
 
     switch (opcode) {
-    case 0x1: /* SQADD, UQADD */
-    case 0x5: /* SQSUB, UQSUB */
     case 0x9: /* SQSHL, UQSHL */
     case 0xb: /* SQRSHL, UQRSHL */
         break;
@@ -9404,6 +9425,8 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         }
         break;
     default:
+    case 0x1: /* SQADD, UQADD */
+    case 0x5: /* SQSUB, UQSUB */
         unallocated_encoding(s);
         return;
     }
@@ -9430,12 +9453,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         void (*genfn)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp) = NULL;
 
         switch (opcode) {
-        case 0x1: /* SQADD, UQADD */
-            genfn = u ? gen_uqadd_bhs : gen_sqadd_bhs;
-            break;
-        case 0x5: /* SQSUB, UQSUB */
-            genfn = u ? gen_uqsub_bhs : gen_sqsub_bhs;
-            break;
         case 0x9: /* SQSHL, UQSHL */
         {
             static NeonGenTwoOpEnvFn * const fns[3][2] = {
@@ -9467,6 +9484,8 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
             break;
         }
         default:
+        case 0x1: /* SQADD, UQADD */
+        case 0x5: /* SQSUB, UQSUB */
             g_assert_not_reached();
         }
 
@@ -10927,6 +10946,11 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+
+    case 0x01: /* SQADD, UQADD */
+    case 0x05: /* SQSUB, UQSUB */
+        unallocated_encoding(s);
+        return;
     }
 
     if (!fp_access_check(s)) {
@@ -10934,20 +10958,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x01: /* SQADD, UQADD */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uqadd_qc, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sqadd_qc, size);
-        }
-        return;
-    case 0x05: /* SQSUB, UQSUB */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uqsub_qc, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sqsub_qc, size);
-        }
-        return;
     case 0x08: /* SSHL, USHL */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_ushl, size);
@@ -11032,6 +11042,10 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                          vec_full_reg_offset(s, rm),
                          is_q ? 16 : 8, vec_full_reg_size(s));
         return;
+
+    case 0x01: /* SQADD, UQADD */
+    case 0x05: /* SQSUB, UQSUB */
+        g_assert_not_reached();
     }
 
     if (size == 3) {
-- 
2.34.1

