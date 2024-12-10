Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3441016njb;
        Tue, 10 Dec 2024 08:23:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5gEPAfOYRAiWz/VNTJ57K+SUr74w8P3wzl42y0OamU/Ue29ebKEJSvwCxO29US5cb6P+fB2w4pvcAKw==@linaro.org
X-Google-Smtp-Source: AGHT+IEslQIS28Tz1oSWBQgaBLUuu9wPL1dFfRsZgTlGnV2jyPTWdlk/qZgqICxiCd2vutmzCood
X-Received: by 2002:a05:6214:238b:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6d9212800d2mr73164016d6.5.1733847789323;
        Tue, 10 Dec 2024 08:23:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733847789; cv=none;
        d=google.com; s=arc-20240605;
        b=kffN6qq7SnGODlc8Jpxntdd7om3eYIP7EOhkvMdVfN8BfDtvOmbAy4od8pfZMcgv3x
         czaeJ6Fe8t/tg8m2sxQtAnnvEIo9dn6dODaiOof+q9M+zs5c+TDkqY0XInCKYE4GPirn
         KhLDAWQCwR19JjOSV2kHxxlQ2Yx6RYQz9G5wIRfZm42IrY7TiqLFpLP/8ogcrHK2Sze6
         D/+RQ1AOzP+/cQsv+ZhHzbXU7I7lFiJV/x3Lt/g5I0m1iNsuTp44Xv1A9I+hnszxiwDC
         byhR10U8rAbqHOjnaZEOB2oXiY2Z8Oa5uIsyb0U4Ic1Bw3VaXVuKeFcn1eXpHBvAJBY4
         DBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hZUfnoUbCzoibw5eZqOQnMsi9ILH5rDTjy2/cp2KD2c=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=RTf9YYTgaGEHijPQ6osYrEUgMFF11hZ7PgtkOS4dUycSdhTXToqjAmAFeijJwPXH84
         cY4nyz1c48vqTjUV2XChI3VzaqDQ+QJc6AzhxOA/5rW1Nc5o4Z+M60FKi+F8+dl7bXAm
         nXlbSWt9Mkqts8/WFICwidCXCxhI/t/Pbh/2QsKhxRR+3Jpz/kiN1hErjpzO7P6S1N3X
         RFbx4Wujf5+rL/K/k/5Yu9+CwzABUZ2SjnZQ4DlBxD/d5Dm3L80fpaEo68iwhk0JYUBU
         YGoENvp+H8plydqZkFUQf8P6/xXbB0/QIUUuZTk7hECI0UZ4hCw+tFWiqPMvqz7jr4Hn
         fTsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VpaoakBe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a8571dsi1370343685a.213.2024.12.10.08.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:23:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VpaoakBe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL2xa-0004Ul-5t; Tue, 10 Dec 2024 11:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2xG-0003Aa-RN
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:24 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL2xE-0006Uw-Mc
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:19:22 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53f757134cdso3193146e87.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847559; x=1734452359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZUfnoUbCzoibw5eZqOQnMsi9ILH5rDTjy2/cp2KD2c=;
 b=VpaoakBe84qii44q2kpX80m3rZkN5ZfDbF0PXnRZK0jrCgyW/t0IenBLec1x7MLQor
 LlosbPrMq5FMzB5Y03lese+5r14e8wkk/9Dp8sBo8TLMPNI7xhxZvPmj4YcLliQQoFK/
 /iLdSV06XI0qyu2U0kbh1NTsZUruj9v7lwdTVAszgYPprmq+MiKXKRfRkOYGyne3eJlH
 vGD0nU/QrjA/9Y8Wl99In17im8936BO2SXjYMhLssy9srYCRvuvF2bhLEKoMjSC1+Luq
 4L7v4w/HTux7vsdVRs+sbNYDCa/ikZ9ga+LmzVa0O+FtNbZ3buUDrxl9luWzJsE2jtUO
 /mNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847559; x=1734452359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZUfnoUbCzoibw5eZqOQnMsi9ILH5rDTjy2/cp2KD2c=;
 b=mZgcRjh8wg4njEz9vAohZqHZzgWh2L9EiDgY9srZ9qYAKQCxSMeA1gV6BLpgQYeU6X
 71scfPwgz3xk2FAVzXZp1iCaVBDoNdzu6I7u4XxUgui4qyzS8+WSv6b9RbalptNj2Xx2
 yB/bgDGULIe/Ay5hz07LBZ6/NkCQB3yH3wlIQtIzLqo+/1dTk/5GbqNkB1Z2SXekYgCo
 u6jrBtwnCjv19KtFbZCqADt2T0/QA1ErxNvM0m44GeP+Xf8kaNKlCBIXTM8fJiF+qGjl
 YYnsM5bPW6stdzfG0RNRBvlq/f3HM4KD1mCgZuyH4C2IiDm1qllx5ZvkWyB+XQJlyqK1
 10Bw==
X-Gm-Message-State: AOJu0Ywdvwb6fmx5zfX8JxGI6l6cduhXhA/fEjJ8YBN2VJxdf69uaElw
 690hyB41Jtnu8UmhZTu5mFo1IykXdkdvEDWyn7ZlCHYK4YisLDmCsMNBX3iGojk3uvIV7ApW7zf
 dW0T10/dR
X-Gm-Gg: ASbGncspukupEP1PHTwhnytIiqpjvEbUH06alCVuf4cxnA1LDYv9Z0CgA2hRuh+zZQC
 72Q71Xyvug9FrmOAAIrpv5NtcWBGGkPp8eh9JDdsbAZhAEBMMppTM8yeSENqR/H9naTPKxEpn78
 oXwU0d6fE6zLkUygZ1ioZ8/AUoQJlXmrfeMERCZ1dVvflnfTYF5bGJq4kPdNAnIosu18+IHQueQ
 +pBwlwxDkTN7cUp0CHv0j4tp/OV7xh0zL0VFXvSRkmwDQdtCk8vZpN/0A4=
X-Received: by 2002:a05:6512:281d:b0:540:2160:1f80 with SMTP id
 2adb3069b0e04-540216021e3mr1892283e87.40.1733847558952; 
 Tue, 10 Dec 2024 08:19:18 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93377eefsm1026343e87.67.2024.12.10.08.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:19:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 24/69] target/arm: Convert FMOV, FABS,
 FNEG (scalar) to decodetree
Date: Tue, 10 Dec 2024 10:16:48 -0600
Message-ID: <20241210161733.1830573-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241210161733.1830573-1-richard.henderson@linaro.org>
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
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
X-TUID: a30XXkID9tBr

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 105 +++++++++++++++++++++++----------
 target/arm/tcg/a64.decode      |   7 +++
 2 files changed, 81 insertions(+), 31 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index f67360c4c5..383ee7f3f0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8283,6 +8283,67 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     return true;
 }
 
+typedef struct FPScalar1Int {
+    void (*gen_h)(TCGv_i32, TCGv_i32);
+    void (*gen_s)(TCGv_i32, TCGv_i32);
+    void (*gen_d)(TCGv_i64, TCGv_i64);
+} FPScalar1Int;
+
+static bool do_fp1_scalar_int(DisasContext *s, arg_rr_e *a,
+                              const FPScalar1Int *f)
+{
+    switch (a->esz) {
+    case MO_64:
+        if (fp_access_check(s)) {
+            TCGv_i64 t = read_fp_dreg(s, a->rn);
+            f->gen_d(t, t);
+            write_fp_dreg(s, a->rd, t);
+        }
+        break;
+    case MO_32:
+        if (fp_access_check(s)) {
+            TCGv_i32 t = read_fp_sreg(s, a->rn);
+            f->gen_s(t, t);
+            write_fp_sreg(s, a->rd, t);
+        }
+        break;
+    case MO_16:
+        if (!dc_isar_feature(aa64_fp16, s)) {
+            return false;
+        }
+        if (fp_access_check(s)) {
+            TCGv_i32 t = read_fp_hreg(s, a->rn);
+            f->gen_h(t, t);
+            write_fp_sreg(s, a->rd, t);
+        }
+        break;
+    default:
+        return false;
+    }
+    return true;
+}
+
+static const FPScalar1Int f_scalar_fmov = {
+    tcg_gen_mov_i32,
+    tcg_gen_mov_i32,
+    tcg_gen_mov_i64,
+};
+TRANS(FMOV_s, do_fp1_scalar_int, a, &f_scalar_fmov)
+
+static const FPScalar1Int f_scalar_fabs = {
+    gen_vfp_absh,
+    gen_vfp_abss,
+    gen_vfp_absd,
+};
+TRANS(FABS_s, do_fp1_scalar_int, a, &f_scalar_fabs)
+
+static const FPScalar1Int f_scalar_fneg = {
+    gen_vfp_negh,
+    gen_vfp_negs,
+    gen_vfp_negd,
+};
+TRANS(FNEG_s, do_fp1_scalar_int, a, &f_scalar_fneg)
+
 /* Floating-point data-processing (1 source) - half precision */
 static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
 {
@@ -8291,15 +8352,6 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     TCGv_i32 tcg_res = tcg_temp_new_i32();
 
     switch (opcode) {
-    case 0x0: /* FMOV */
-        tcg_gen_mov_i32(tcg_res, tcg_op);
-        break;
-    case 0x1: /* FABS */
-        gen_vfp_absh(tcg_res, tcg_op);
-        break;
-    case 0x2: /* FNEG */
-        gen_vfp_negh(tcg_res, tcg_op);
-        break;
     case 0x3: /* FSQRT */
         fpst = fpstatus_ptr(FPST_FPCR_F16);
         gen_helper_sqrt_f16(tcg_res, tcg_op, fpst);
@@ -8327,6 +8379,9 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
         gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
         break;
     default:
+    case 0x0: /* FMOV */
+    case 0x1: /* FABS */
+    case 0x2: /* FNEG */
         g_assert_not_reached();
     }
 
@@ -8345,15 +8400,6 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
     tcg_res = tcg_temp_new_i32();
 
     switch (opcode) {
-    case 0x0: /* FMOV */
-        tcg_gen_mov_i32(tcg_res, tcg_op);
-        goto done;
-    case 0x1: /* FABS */
-        gen_vfp_abss(tcg_res, tcg_op);
-        goto done;
-    case 0x2: /* FNEG */
-        gen_vfp_negs(tcg_res, tcg_op);
-        goto done;
     case 0x3: /* FSQRT */
         gen_helper_vfp_sqrts(tcg_res, tcg_op, tcg_env);
         goto done;
@@ -8389,6 +8435,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
         gen_fpst = gen_helper_frint64_s;
         break;
     default:
+    case 0x0: /* FMOV */
+    case 0x1: /* FABS */
+    case 0x2: /* FNEG */
         g_assert_not_reached();
     }
 
@@ -8413,22 +8462,10 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
     TCGv_ptr fpst;
     int rmode = -1;
 
-    switch (opcode) {
-    case 0x0: /* FMOV */
-        gen_gvec_fn2(s, false, rd, rn, tcg_gen_gvec_mov, 0);
-        return;
-    }
-
     tcg_op = read_fp_dreg(s, rn);
     tcg_res = tcg_temp_new_i64();
 
     switch (opcode) {
-    case 0x1: /* FABS */
-        gen_vfp_absd(tcg_res, tcg_op);
-        goto done;
-    case 0x2: /* FNEG */
-        gen_vfp_negd(tcg_res, tcg_op);
-        goto done;
     case 0x3: /* FSQRT */
         gen_helper_vfp_sqrtd(tcg_res, tcg_op, tcg_env);
         goto done;
@@ -8461,6 +8498,9 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
         gen_fpst = gen_helper_frint64_d;
         break;
     default:
+    case 0x0: /* FMOV */
+    case 0x1: /* FABS */
+    case 0x2: /* FNEG */
         g_assert_not_reached();
     }
 
@@ -8581,7 +8621,7 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
             goto do_unallocated;
         }
         /* fall through */
-    case 0x0 ... 0x3:
+    case 0x3:
     case 0x8 ... 0xc:
     case 0xe ... 0xf:
         /* 32-to-32 and 64-to-64 ops */
@@ -8631,6 +8671,9 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
 
     default:
     do_unallocated:
+    case 0x0: /* FMOV */
+    case 0x1: /* FABS */
+    case 0x2: /* FNEG */
         unallocated_encoding(s);
         break;
     }
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 7868b1cb24..b9cc8963da 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -47,6 +47,7 @@
 @rr_h           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=1
 @rr_d           ........ ... ..... ...... rn:5 rd:5     &rr_e esz=3
 @rr_sd          ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_sd
+@rr_hsd         ........ ... ..... ...... rn:5 rd:5     &rr_e esz=%esz_hsd
 
 @rrr_b          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=0
 @rrr_h          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=1
@@ -1321,6 +1322,12 @@ FMAXV_s         0110 1110 00 11000 01111 10 ..... .....     @rr_q1e2
 FMINV_h         0.00 1110 10 11000 01111 10 ..... .....     @qrr_h
 FMINV_s         0110 1110 10 11000 01111 10 ..... .....     @rr_q1e2
 
+# Floating-point data processing (1 source)
+
+FMOV_s          00011110 .. 1 000000 10000 ..... .....      @rr_hsd
+FABS_s          00011110 .. 1 000001 10000 ..... .....      @rr_hsd
+FNEG_s          00011110 .. 1 000010 10000 ..... .....      @rr_hsd
+
 # Floating-point Immediate
 
 FMOVI_s         0001 1110 .. 1 imm:8 100 00000 rd:5         esz=%esz_hsd
-- 
2.43.0

