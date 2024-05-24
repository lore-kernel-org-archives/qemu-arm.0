Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1996052ejb;
        Fri, 24 May 2024 16:32:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUyBC2gFbp0AXhSMclspOSzr5qYcE2ceR1HsvUw+sCVIo0f1ySrwz88HALjok+mU0RvACrEVGs6OlFxzdhzx8i0M+mLNfvQ
X-Google-Smtp-Source: AGHT+IHrvqDEQqc1QNy1RD/Ys9jviEFgf92PkwMXY93j+QYMlMY9w+ROu/M1SrrB/Ev+N1Pne4Dk
X-Received: by 2002:a05:6870:f2a8:b0:229:f022:ef83 with SMTP id 586e51a60fabf-24ca136cd30mr4763329fac.43.1716593532384;
        Fri, 24 May 2024 16:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593532; cv=none;
        d=google.com; s=arc-20160816;
        b=Bsl25GpRj4EOWq6YGafBljXE+Jb0NuHrd4ChnIFNlMxPizt/enGy638eX7axjmb3PF
         LSr665MA05LRnNqjc4V6s5+icX6vk+j1ZYBBeFE55B2bOLIG9OKinWzALhFuZBpb246E
         y+8Md2Mk63l74cg4NsOTpBeu0uWXmM7M3TzniHA6snEKJRTdV4fw17FhwZrQfb7948Kv
         spRYh4Bv5f47I44FIg+NPHK3TMOzkE3TxIk2Xp+Uzjprn8jTB9Ru3MZyBopqqOArztRh
         QGbThvo0T42+24igOsgiMoyuQYzEmPWU359MTuOSl/TvS+HUqzArOTKR/rAusIbxTEti
         3DqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NPFuri/cKswR4t+bCrnBkHfBWzfdGW7NEKWgDSK4v8Y=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=gkhSHJNMWV7ccHvSOk9XAKO8QEMKYxB+Wl4/4TaFyzvThVbRHyrxZ1EofNpH+IoXWL
         YicrxVTB/ldNDsjGvdfoixZM506DlJXEnZGP29OndD5smBdgAMgvAB6HflMiAl0L690R
         HOFYpwGEyGJL2mh0w1EjlR4CYcAWBl+JeN+DyMF8nYyJwe0dUadBX2WwGKvinvZ//dx7
         I+CeD3u+YA+iUBXFduHmcprkVeh1KRn21e82f975oNdxvQwhaj+D5FS1LooB4lj7XWap
         /fySn/hsrGC9ToM6yQ9eBJmGc7kaW1qAlgT8Lt21Miby/TPj1Jg1iR0YKTMFCMOcNiH6
         /ABQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i1A2q2Zj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b3b8dsi28284391cf.499.2024.05.24.16.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:32:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i1A2q2Zj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sAeIc-0001VM-GT; Fri, 24 May 2024 19:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0007Od-UY
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:25:27 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHb-0006rz-HS
 for qemu-devel@nongnu.org; Fri, 24 May 2024 19:25:22 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6f8e98760fcso1242486b3a.1
 for <qemu-devel@nongnu.org>; Fri, 24 May 2024 16:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593105; x=1717197905; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPFuri/cKswR4t+bCrnBkHfBWzfdGW7NEKWgDSK4v8Y=;
 b=i1A2q2ZjYaAic28ywelsgdjR+Qk4XGQ4Vg22CFxh8ev6SwprfQWndbv/iWXhrpUBtJ
 juIe6UXHCidVkwYf/21VjKVdtGSYE81YXdQSl1RLVlZ1X1+3HZwX12F7AIHYZEaIhSDA
 5TVLyyvuFyQLYzB+qBC2XTMybe1JxQGmKFLayp7HoLqfdP0GaD6GgCu/+rbb4qQbFwLF
 x6kcrwZY2ZVfA41gs9NcRBhpQ/XLabSv8KftgKZfVii7I2DsLzI3+EcW6ackzECDayTr
 hOGSJmVxiOavGMVWvABkFKnTEWVCst3qfbWaZ1fM95NEDRaCKLfefcyw+XVvy2oLsFtX
 hjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593105; x=1717197905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NPFuri/cKswR4t+bCrnBkHfBWzfdGW7NEKWgDSK4v8Y=;
 b=LeeVlzE54sRRc2l3MRA4G/9Msi3Xk96eU/nWV2bP1hhK0zloU4mfpqgSlCFxQIYU2E
 28bLb7Ot0V3BUksCeKgR5UZWARKw3rcukRkAZXxL7M2S2hMoackfSt+53swCr0y+9VlF
 61KCzs2TyxxEXyzUQZLWT/FXkpoqJf1qrq5L44bbQATKxGJfvBOzQcC7Q0w2gsSJaAm7
 ElxGD48fCklN0/Tw8sQQ0JBm1ZnMOZy2z0x9LcNAski6XR6aU7XnM1sOjug5ac35K2/V
 xVPlNxgYaeifY12pDpwNQqW0A4wjNU6ow2gTUBHRTjriE6HNMpt2k6LNHFQZN7NS6p0K
 kKyw==
X-Gm-Message-State: AOJu0Yz40FfkZxRg5fTkNh4CAYWOkzPYiM9pRQmUSYmv5u9oo8kZMRwn
 CKVemskyUCuFsa7EXGPOk79bpIFdk31FvitzMzMf13lcnEFDTTBrgBQtM76I8xieaXo+ueSoTZL
 4
X-Received: by 2002:a05:6a20:d80b:b0:1af:66aa:7fc7 with SMTP id
 adf61e73a8af0-1b212cc3935mr5077522637.3.1716593104792; 
 Fri, 24 May 2024 16:25:04 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 47/67] target/arm: Convert SQSHL, UQSHL to decodetree
Date: Fri, 24 May 2024 16:21:01 -0700
Message-Id: <20240524232121.284515-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: 0SxrBvx720nV

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  4 ++
 target/arm/tcg/translate-a64.c | 74 ++++++++++++++++++++++------------
 2 files changed, 53 insertions(+), 25 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 9e02776036..85caf37948 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -760,6 +760,8 @@ SSHL_s          0101 1110 111 ..... 01000 1 ..... ..... @rrr_d
 USHL_s          0111 1110 111 ..... 01000 1 ..... ..... @rrr_d
 SRSHL_s         0101 1110 111 ..... 01010 1 ..... ..... @rrr_d
 URSHL_s         0111 1110 111 ..... 01010 1 ..... ..... @rrr_d
+SQSHL_s         0101 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
+UQSHL_s         0111 1110 ..1 ..... 01001 1 ..... ..... @rrr_e
 
 ### Advanced SIMD scalar pairwise
 
@@ -886,6 +888,8 @@ SSHL_v          0.00 1110 ..1 ..... 01000 1 ..... ..... @qrrr_e
 USHL_v          0.10 1110 ..1 ..... 01000 1 ..... ..... @qrrr_e
 SRSHL_v         0.00 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
 URSHL_v         0.10 1110 ..1 ..... 01010 1 ..... ..... @qrrr_e
+SQSHL_v         0.00 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
+UQSHL_v         0.10 1110 ..1 ..... 01001 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 50b653bb4d..f8d2760bea 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5119,6 +5119,49 @@ TRANS(USHL_s, do_int3_scalar_d, a, gen_ushl_i64)
 TRANS(SRSHL_s, do_int3_scalar_d, a, gen_helper_neon_rshl_s64)
 TRANS(URSHL_s, do_int3_scalar_d, a, gen_helper_neon_rshl_u64)
 
+typedef struct ENVScalar2 {
+    NeonGenTwoOpEnvFn *gen_bhs[3];
+    NeonGenTwo64OpEnvFn *gen_d;
+} ENVScalar2;
+
+static bool do_env_scalar2(DisasContext *s, arg_rrr_e *a, const ENVScalar2 *f)
+{
+    if (!fp_access_check(s)) {
+        return true;
+    }
+    if (a->esz == MO_64) {
+        TCGv_i64 t0 = read_fp_dreg(s, a->rn);
+        TCGv_i64 t1 = read_fp_dreg(s, a->rm);
+        f->gen_d(t0, tcg_env, t0, t1);
+        write_fp_dreg(s, a->rd, t0);
+    } else {
+        TCGv_i32 t0 = tcg_temp_new_i32();
+        TCGv_i32 t1 = tcg_temp_new_i32();
+
+        read_vec_element_i32(s, t0, a->rn, 0, a->esz);
+        read_vec_element_i32(s, t1, a->rm, 0, a->esz);
+        f->gen_bhs[a->esz](t0, tcg_env, t0, t1);
+        write_fp_sreg(s, a->rd, t0);
+    }
+    return true;
+}
+
+static const ENVScalar2 f_scalar_sqshl = {
+    { gen_helper_neon_qshl_s8,
+      gen_helper_neon_qshl_s16,
+      gen_helper_neon_qshl_s32 },
+    gen_helper_neon_qshl_s64,
+};
+TRANS(SQSHL_s, do_env_scalar2, a, &f_scalar_sqshl)
+
+static const ENVScalar2 f_scalar_uqshl = {
+    { gen_helper_neon_qshl_u8,
+      gen_helper_neon_qshl_u16,
+      gen_helper_neon_qshl_u32 },
+    gen_helper_neon_qshl_u64,
+};
+TRANS(UQSHL_s, do_env_scalar2, a, &f_scalar_uqshl)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5368,6 +5411,8 @@ TRANS(SSHL_v, do_gvec_fn3, a, gen_gvec_sshl)
 TRANS(USHL_v, do_gvec_fn3, a, gen_gvec_ushl)
 TRANS(SRSHL_v, do_gvec_fn3, a, gen_gvec_srshl)
 TRANS(URSHL_v, do_gvec_fn3, a, gen_gvec_urshl)
+TRANS(SQSHL_v, do_gvec_fn3, a, gen_neon_sqshl)
+TRANS(UQSHL_v, do_gvec_fn3, a, gen_neon_uqshl)
 
 
 /*
@@ -9381,13 +9426,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         gen_cmtst_i64(tcg_rd, tcg_rn, tcg_rm);
         break;
-    case 0x9: /* SQSHL, UQSHL */
-        if (u) {
-            gen_helper_neon_qshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        } else {
-            gen_helper_neon_qshl_s64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
-        }
-        break;
     case 0xb: /* SQRSHL, UQRSHL */
         if (u) {
             gen_helper_neon_qrshl_u64(tcg_rd, tcg_env, tcg_rn, tcg_rm);
@@ -9406,6 +9444,7 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     case 0x1: /* SQADD / UQADD */
     case 0x5: /* SQSUB / UQSUB */
     case 0x8: /* SSHL, USHL */
+    case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
         g_assert_not_reached();
     }
@@ -9428,7 +9467,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     TCGv_i64 tcg_rd;
 
     switch (opcode) {
-    case 0x9: /* SQSHL, UQSHL */
     case 0xb: /* SQRSHL, UQRSHL */
         break;
     case 0x6: /* CMGT, CMHI */
@@ -9450,6 +9488,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     case 0x1: /* SQADD, UQADD */
     case 0x5: /* SQSUB, UQSUB */
     case 0x8: /* SSHL, USHL */
+    case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
         unallocated_encoding(s);
         return;
@@ -9477,16 +9516,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         void (*genfn)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp) = NULL;
 
         switch (opcode) {
-        case 0x9: /* SQSHL, UQSHL */
-        {
-            static NeonGenTwoOpEnvFn * const fns[3][2] = {
-                { gen_helper_neon_qshl_s8, gen_helper_neon_qshl_u8 },
-                { gen_helper_neon_qshl_s16, gen_helper_neon_qshl_u16 },
-                { gen_helper_neon_qshl_s32, gen_helper_neon_qshl_u32 },
-            };
-            genenvfn = fns[size][u];
-            break;
-        }
         case 0xb: /* SQRSHL, UQRSHL */
         {
             static NeonGenTwoOpEnvFn * const fns[3][2] = {
@@ -9510,6 +9539,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         default:
         case 0x1: /* SQADD, UQADD */
         case 0x5: /* SQSUB, UQSUB */
+        case 0x9: /* SQSHL, UQSHL */
             g_assert_not_reached();
         }
 
@@ -10935,13 +10965,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x09: /* SQSHL, UQSHL */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_uqshl, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_neon_sqshl, size);
-        }
-        return;
     case 0x0c: /* SMAX, UMAX */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_umax, size);
@@ -11023,6 +11046,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x01: /* SQADD, UQADD */
     case 0x05: /* SQSUB, UQSUB */
     case 0x08: /* SSHL, USHL */
+    case 0x09: /* SQSHL, UQSHL */
     case 0x0a: /* SRSHL, URSHL */
         g_assert_not_reached();
     }
-- 
2.34.1

