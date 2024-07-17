Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp615828njk;
        Tue, 16 Jul 2024 23:12:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEKtwkbG++THzsHLqcEJuZAcAWIXZ96GnUJeT86zSAGC1cgLJgEbeoBj9/UCCsyo1EpR3TPMc7H6kjFAFVGw5kfDr8Bdoe
X-Google-Smtp-Source: AGHT+IEsCYfFel94ESrJJjSTplA6NxtWcihojKEIkDdAryGcvowkkVZBmlrE0hol1dosMf+jiwXR
X-Received: by 2002:ac8:7e8b:0:b0:446:5aac:ca85 with SMTP id d75a77b69052e-44f860e29cemr13059651cf.18.1721196750009;
        Tue, 16 Jul 2024 23:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196749; cv=none;
        d=google.com; s=arc-20160816;
        b=vMeqUkNpOLbOOkbJn8sqijn9253axulwTlvb+HI1XvoOqBOJAqZU04E50m3G0DxVQP
         RnauwBczSmBSFTubC29ZZBAqZgerLde/by0OzUPLVtrvEeZqU5VDtF4XWG1/vM2RoA1I
         ViE5v37N4/Q9u/MMTdRuZgCIKFgRxQfUz/UNN4Qd+uxvQelasiLdSvg7FF1pldBEo5zY
         PBZJ+MfMPeN9cD7Vowa2+Y451+o6LdTF/r2cvxYl1gWxzCS8DLwylBQieWAaTe9v2O4I
         22XuU27miEa8/0CmyuWwoiKT3s5I41fHRaOZTBQkDQQpLmSSejk18CNc6XO4Hhxy5/xN
         c0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Af9EvMec0yXAPpsbHCZmkPQl7q0cMsBtM3ruuFa4lb4=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=usDEpn6nGSr4iTxT0HYIgxpo0bSIP+FcKP/L7fVLVawaQuQUeWcSUaQ7L3IQ9H+OJS
         7xQiKAA0O3nCKgmqj9AulRY0zd94vSZRnVChlQOWTl3GoFsLSl+8KRfxl+ZLgoyWxinJ
         d8Lr3x3LARRtNRQxKlUbDQKxs5hOQsgTvge7x8ReH4EOJYPPhLF6mZ0sVcviNwzecYH0
         eIWqTjVjkF9KHmcubppv9BqBCDuca4OYMFsNPxOQbX67t6Wryxl9TKJ9oW8JGGQaNa95
         6oZ4EEWmATSAsYRoS+UhxVD8HmJCKa3dAco+uWMrd1wrlI+uec6h9Dc2eHeMoD4pqLul
         ntaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=md0LgX2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b8204d6si94807261cf.641.2024.07.16.23.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:12:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=md0LgX2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxr8-0004Wq-0q; Wed, 17 Jul 2024 02:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqz-000476-Rf
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:33 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxqx-00032N-Op
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:09:29 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-70af5fbf0d5so342547b3a.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196566; x=1721801366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Af9EvMec0yXAPpsbHCZmkPQl7q0cMsBtM3ruuFa4lb4=;
 b=md0LgX2nrX68QI6ulVxnASx1Xv62Ng9jE/S0ntcbp8NcWBhFKTVzYR/FWepzGeVN8Z
 oM6H5anRowS8RYclK/0M8JtMzUIGEtfKPz1LWAkjgQrACzfL0ychzJgFU1LVHCGAmeFJ
 Owc2z5j//Dh/C5yKN95iiuARVqmMgmLNVxEySQvPuoFt4tSwTEIKiKEc/GC+WWIb7nSj
 5LtvS27WC2TYcV6264kg03iepTrbntIKHuA+lB81aOPQ1gdw2xuhLmNbjXlBHfiVkL7S
 FkJJYRvZpomvX0QNeNgoxafD2NJF1t+tRpJ8+zuHK7UwOAja3cA4C9rED0N8fj6G2TY8
 V8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196566; x=1721801366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Af9EvMec0yXAPpsbHCZmkPQl7q0cMsBtM3ruuFa4lb4=;
 b=ZXCU8sclfMwHtjxeHvmDmC0NhfDoom94jS6eXQJ+YMR9XjA+L1eTk0Ckj9FrHz90mj
 +Xy8nPNJGMzDqyzq82jJ1fFCmTTwkodICvGzvIDJMz2jGmYIYrrU0i6YuF0u6ZnofSqR
 FAI+MKpoydyV1TEA9sVsU8cj+b7sR5eEeKex/MT2caqEN/6i6Wt4tx7yvWX20S0KeyLL
 9nsOqRHSEeb10gPiRjQmWUou3PFh44cbUURYLLFEpE9G5+0HrLjJnF1Gw0CN9lkKTxQi
 TovVExXLiNz+WlZ6EkA3gcJfFgciu+a5FGFLnjrl+3V7cAQnMPzaCYrNiqhL89mELgg4
 jkpQ==
X-Gm-Message-State: AOJu0YxA7S+lY7EKaAA8CmUWP5VNeerN4YAA0W/LCpc3noPTTCCQHxT5
 /imGa83XaerTtK39T7UOXRcSnGxzu+hdQAfdfl5dRhEzsDVLip15IA8Yxa/9nns=
X-Received: by 2002:a05:6a00:81c6:b0:705:d6ad:2495 with SMTP id
 d2e1a72fcca58-70cd8402fbamr5505586b3a.12.1721196566222; 
 Tue, 16 Jul 2024 23:09:26 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm7330404b3a.219.2024.07.16.23.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:09:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/17] target/arm: Convert ADDV, *ADDLV, *MAXV,
 *MINV to decodetree
Date: Wed, 17 Jul 2024 16:08:52 +1000
Message-ID: <20240717060903.205098-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717060903.205098-1-richard.henderson@linaro.org>
References: <20240717060903.205098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: o3/XNdX/9+Bj

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 140 ++++++++++++---------------------
 target/arm/tcg/a64.decode      |  12 +++
 2 files changed, 61 insertions(+), 91 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 6d2e1a2d80..055ba4695e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6753,6 +6753,47 @@ TRANS(FNMADD, do_fmadd, a, true, true)
 TRANS(FMSUB, do_fmadd, a, false, true)
 TRANS(FNMSUB, do_fmadd, a, true, false)
 
+/*
+ * Advanced SIMD Across Lanes
+ */
+
+static bool do_int_reduction(DisasContext *s, arg_qrr_e *a, bool widen,
+                             MemOp src_sign, NeonGenTwo64OpFn *fn)
+{
+    TCGv_i64 tcg_res, tcg_elt;
+    MemOp src_mop = a->esz | src_sign;
+    int elements = (a->q ? 16 : 8) >> a->esz;
+
+    /* Reject MO_64, and MO_32 without Q: a minimum of 4 elements. */
+    if (elements < 4) {
+        return false;
+    }
+    if (!fp_access_check(s)) {
+        return true;
+    }
+
+    tcg_res = tcg_temp_new_i64();
+    tcg_elt = tcg_temp_new_i64();
+
+    read_vec_element(s, tcg_res, a->rn, 0, src_mop);
+    for (int i = 1; i < elements; i++) {
+        read_vec_element(s, tcg_elt, a->rn, i, src_mop);
+        fn(tcg_res, tcg_res, tcg_elt);
+    }
+
+    tcg_gen_ext_i64(tcg_res, tcg_res, a->esz + widen);
+    write_fp_dreg(s, a->rd, tcg_res);
+    return true;
+}
+
+TRANS(ADDV, do_int_reduction, a, false, 0, tcg_gen_add_i64)
+TRANS(SADDLV, do_int_reduction, a, true, MO_SIGN, tcg_gen_add_i64)
+TRANS(UADDLV, do_int_reduction, a, true, 0, tcg_gen_add_i64)
+TRANS(SMAXV, do_int_reduction, a, false, MO_SIGN, tcg_gen_smax_i64)
+TRANS(UMAXV, do_int_reduction, a, false, 0, tcg_gen_umax_i64)
+TRANS(SMINV, do_int_reduction, a, false, MO_SIGN, tcg_gen_smin_i64)
+TRANS(UMINV, do_int_reduction, a, false, 0, tcg_gen_umin_i64)
+
 /* Shift a TCGv src by TCGv shift_amount, put result in dst.
  * Note that it is the caller's responsibility to ensure that the
  * shift amount is in range (ie 0..31 or 0..63) and provide the ARM
@@ -9051,27 +9092,10 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
     int opcode = extract32(insn, 12, 5);
     bool is_q = extract32(insn, 30, 1);
     bool is_u = extract32(insn, 29, 1);
-    bool is_fp = false;
     bool is_min = false;
     int elements;
-    int i;
-    TCGv_i64 tcg_res, tcg_elt;
 
     switch (opcode) {
-    case 0x1b: /* ADDV */
-        if (is_u) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* fall through */
-    case 0x3: /* SADDLV, UADDLV */
-    case 0xa: /* SMAXV, UMAXV */
-    case 0x1a: /* SMINV, UMINV */
-        if (size == 3 || (size == 2 && !is_q)) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0xc: /* FMAXNMV, FMINNMV */
     case 0xf: /* FMAXV, FMINV */
         /* Bit 1 of size field encodes min vs max and the actual size
@@ -9080,7 +9104,6 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
          * precision.
          */
         is_min = extract32(size, 1, 1);
-        is_fp = true;
         if (!is_u && dc_isar_feature(aa64_fp16, s)) {
             size = 1;
         } else if (!is_u || !is_q || extract32(size, 0, 1)) {
@@ -9091,6 +9114,10 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
         }
         break;
     default:
+    case 0x3: /* SADDLV, UADDLV */
+    case 0xa: /* SMAXV, UMAXV */
+    case 0x1a: /* SMINV, UMINV */
+    case 0x1b: /* ADDV */
         unallocated_encoding(s);
         return;
     }
@@ -9101,52 +9128,7 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
 
     elements = (is_q ? 16 : 8) >> size;
 
-    tcg_res = tcg_temp_new_i64();
-    tcg_elt = tcg_temp_new_i64();
-
-    /* These instructions operate across all lanes of a vector
-     * to produce a single result. We can guarantee that a 64
-     * bit intermediate is sufficient:
-     *  + for [US]ADDLV the maximum element size is 32 bits, and
-     *    the result type is 64 bits
-     *  + for FMAX*V, FMIN*V, ADDV the intermediate type is the
-     *    same as the element size, which is 32 bits at most
-     * For the integer operations we can choose to work at 64
-     * or 32 bits and truncate at the end; for simplicity
-     * we use 64 bits always. The floating point
-     * ops do require 32 bit intermediates, though.
-     */
-    if (!is_fp) {
-        read_vec_element(s, tcg_res, rn, 0, size | (is_u ? 0 : MO_SIGN));
-
-        for (i = 1; i < elements; i++) {
-            read_vec_element(s, tcg_elt, rn, i, size | (is_u ? 0 : MO_SIGN));
-
-            switch (opcode) {
-            case 0x03: /* SADDLV / UADDLV */
-            case 0x1b: /* ADDV */
-                tcg_gen_add_i64(tcg_res, tcg_res, tcg_elt);
-                break;
-            case 0x0a: /* SMAXV / UMAXV */
-                if (is_u) {
-                    tcg_gen_umax_i64(tcg_res, tcg_res, tcg_elt);
-                } else {
-                    tcg_gen_smax_i64(tcg_res, tcg_res, tcg_elt);
-                }
-                break;
-            case 0x1a: /* SMINV / UMINV */
-                if (is_u) {
-                    tcg_gen_umin_i64(tcg_res, tcg_res, tcg_elt);
-                } else {
-                    tcg_gen_smin_i64(tcg_res, tcg_res, tcg_elt);
-                }
-                break;
-            default:
-                g_assert_not_reached();
-            }
-
-        }
-    } else {
+    {
         /* Floating point vector reduction ops which work across 32
          * bit (single) or 16 bit (half-precision) intermediates.
          * Note that correct NaN propagation requires that we do these
@@ -9154,34 +9136,10 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
          */
         TCGv_ptr fpst = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
         int fpopcode = opcode | is_min << 4 | is_u << 5;
-        TCGv_i32 tcg_res32 = do_reduction_op(s, fpopcode, rn, size,
-                                             0, elements, fpst);
-        tcg_gen_extu_i32_i64(tcg_res, tcg_res32);
+        TCGv_i32 tcg_res = do_reduction_op(s, fpopcode, rn, size,
+                                           0, elements, fpst);
+        write_fp_sreg(s, rd, tcg_res);
     }
-
-    /* Now truncate the result to the width required for the final output */
-    if (opcode == 0x03) {
-        /* SADDLV, UADDLV: result is 2*esize */
-        size++;
-    }
-
-    switch (size) {
-    case 0:
-        tcg_gen_ext8u_i64(tcg_res, tcg_res);
-        break;
-    case 1:
-        tcg_gen_ext16u_i64(tcg_res, tcg_res);
-        break;
-    case 2:
-        tcg_gen_ext32u_i64(tcg_res, tcg_res);
-        break;
-    case 3:
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    write_fp_dreg(s, rd, tcg_res);
 }
 
 /* AdvSIMD modified immediate
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 5bd5603cd0..9c182eaff1 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -59,6 +59,8 @@
 @rrr_q1e3       ........ ... rm:5 ...... rn:5 rd:5      &qrrr_e q=1 esz=3
 @rrrr_q1e3      ........ ... rm:5 . ra:5 rn:5 rd:5      &qrrrr_e q=1 esz=3
 
+@qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
+
 @qrrr_b         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=0
 @qrrr_h         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=1
 @qrrr_s         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=2
@@ -1154,3 +1156,13 @@ TRN1            0.00 1110 .. 0 ..... 0 010 10 ..... .....   @qrrr_e
 TRN2            0.00 1110 .. 0 ..... 0 110 10 ..... .....   @qrrr_e
 ZIP1            0.00 1110 .. 0 ..... 0 011 10 ..... .....   @qrrr_e
 ZIP2            0.00 1110 .. 0 ..... 0 111 10 ..... .....   @qrrr_e
+
+# Advanced SIMD Across Lanes
+
+ADDV            0.00 1110 .. 11000 11011 10 ..... .....     @qrr_e
+SADDLV          0.00 1110 .. 11000 00011 10 ..... .....     @qrr_e
+UADDLV          0.10 1110 .. 11000 00011 10 ..... .....     @qrr_e
+SMAXV           0.00 1110 .. 11000 01010 10 ..... .....     @qrr_e
+UMAXV           0.10 1110 .. 11000 01010 10 ..... .....     @qrr_e
+SMINV           0.00 1110 .. 11000 11010 10 ..... .....     @qrr_e
+UMINV           0.10 1110 .. 11000 11010 10 ..... .....     @qrr_e
-- 
2.43.0

