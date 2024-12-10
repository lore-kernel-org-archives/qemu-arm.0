Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3444979njb;
        Tue, 10 Dec 2024 08:28:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhcVuTmYG+/MquFGpqVo3CRL1jfin0tsX7Tfo96t8yQUL+0MowxvFyMt7AS5HiRiCVvr9xEEVNRoym4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE3nU1PV6j6Y3zPlfoFPOyZrZtb3nCfwmZ3JhGKWe1xsNJ0QZf6h0MdFiSU3c92BXlpuWvR
X-Received: by 2002:a05:6102:f09:b0:4af:f809:516a with SMTP id ada2fe7eead31-4b1160a8c25mr6726360137.11.1733848114568;
        Tue, 10 Dec 2024 08:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733848114; cv=none;
        d=google.com; s=arc-20240605;
        b=ls8gXDt/QPKNrDMGg6TJD7b/5jSD22o/nw/Tr5fyKpkPAhtY0Qycy/DyeYY8hUj8Kx
         UaWZgQz9vrLQMaM9LccrRl3+FJ37ke4VCEloROL7YHPs8D1NcaEjzvqv4HnyLX0vjcbV
         LuLJu9X9fJue48Fddk9tmIU8SFNOuRHwblfVIVtf+8iTUVERqeYXGp0wxfA+DAEg6aQm
         GEbs9+51OOovjKYx+iZxMQm3SYzmyDNlWbUfUAAsFRIbGgSbz1GYuy9pvCYwRv/UMNUZ
         pKAMRX2XKW8MiHEJd4YuZ433e+I/PARWolQCDNS2FyQcuRlUgcl4ith6N6mQx9Zs760l
         rOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RQ5vVXYptQzG1sUMwxsVVVONjUivNJ0StC+U2jug2Ok=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=JqNQTrMJSgKjWTFushI3SlkqMzjtKrcB036Md5Ni4iXw75WIGITfOnLmTKi8OxeR4l
         qFmV/V/L9n8I3Nfld7Bk82G3YGf6dqtQynkRfm55OTYGMDJANEdf+ZK3JZX32SlFiPVK
         t77tQ/8MdrxW9V0NoICTEUIkxhcb1T86j1HQKfywih8WQUpsNRteGXJTcL5QrgnHN4g2
         A727Otg9qex+xlJHHSUwIhlqMS2/bhkfYo60Yh4AXvT2wqJP0vxZFgsx3SElb15K3A8i
         AO4jxw7bR+DncGTl1X4S1lQdcajkCDcgCGyEmIMElmO2vciA4FKCCHNZ5aNQkrvvJx3/
         35YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p+WdN6Ky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85c2bac20ebsi3039987241.77.2024.12.10.08.28.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 08:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p+WdN6Ky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL33O-0003HE-6R; Tue, 10 Dec 2024 11:25:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32r-00015n-SO
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:25:11 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL32o-0007fs-T6
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 11:25:09 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso3312464e87.0
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 08:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733847905; x=1734452705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQ5vVXYptQzG1sUMwxsVVVONjUivNJ0StC+U2jug2Ok=;
 b=p+WdN6KyJaiFleJvkACLnOtKBwaxGpq0XqVywj6c2ceLU27z0HPNKGLF629YxK5b0E
 m26lIwH4kP/dnVoWTCXBbCR8BHnwnNBobl7qgR+1ftMFMxjtxw81W8DThaT0O6r0hcR5
 1jkN0SKbWPhvTNjYzS72Sqrxal/e2rdUo3fz+n1G2+l3jFHddGgF+xyZ3MLExAuSwkHs
 LN19oD+dye/Sm6FTnMc7EaJSHl38l6+KEggfG1dOByCyQXWGABoalr/sAanf8PC1vfj2
 0j9u24U+KBF7E7FhgASkSFXWmtaxFawnchJ2cPQYpv7SeLu0IBf4ZxzyjYBF2M9LS1oy
 7BJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733847905; x=1734452705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQ5vVXYptQzG1sUMwxsVVVONjUivNJ0StC+U2jug2Ok=;
 b=DKEyDlVR6QrVabG3INAaq+fPHjR9IyWiZ7zS1Q1YKYnx8c1vkxJVdjh/xzmrYziRg2
 lTQy3Q9yVkoSoX/Dz3MOMacAz1+Ev9q94lPQS3FBHUNRjkjxg8NWxGZSO0CVJ2+2FtpO
 44P21eZjHqyYrbX8XM3Vb4n7UP30mRIBc89pIhkJohuXyTsKzdrgTZh7SEpHn7KsYDml
 WBMX/z6JOSDy8OXBa8dC+r+mGvtbAb4tEPwk7m2fryZzBIjkltmsNsk4MltC3CT9uQ0D
 rGVshMWU0AI8YcoPrDQ7u9zLS/Qw+eDGlIYTc5/kwDJ4hoHssyNYPdbHrtCGqIXLFdNO
 UzRQ==
X-Gm-Message-State: AOJu0Yz2/ucdjfFt5LfIJtld06STom/AiXkhy7BAnBFWlayjGBIg3te3
 0AEf8EiZ9usI1IjJ+8g1CMmmamzuyo32TK/888BbDd/QJaygBFX1dunMDlmLpZ0=
X-Gm-Gg: ASbGncv0a8Fwx60qs3f1VbYCjZhle3B9x3X3gm0wbYvVOwrXRNzAxw180AC5tDUY2/i
 sUgkMwNMpMCZkBcE+jQ9HLBQIdGvoqgxoZQlXQkpCsy+NvTPvhysT6dPEooIkEEN79ve+oD4i1g
 Z8wdgfu10rxc52/ZbGKEcLVNXPejDIz9h+yzjHpM5qz/nUxaOOHfIkJyzL4Hhj7tgi2rQqJMxTT
 IcM1p3gjFpN29Ye807cV/SaGDBThO+LJaFjS2nvsSymVw4s16Rh+rrkhWI=
X-Received: by 2002:a05:6512:308d:b0:53e:37a5:4caa with SMTP id
 2adb3069b0e04-540240ae679mr1830032e87.5.1733847904669; 
 Tue, 10 Dec 2024 08:25:04 -0800 (PST)
Received: from stoup.. ([91.209.212.80]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5402960b0absm26024e87.102.2024.12.10.08.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 08:25:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 66/69] target/arm: Convert FRECPE, FRECPX,
 FRSQRTE to decodetree
Date: Tue, 10 Dec 2024 10:17:30 -0600
Message-ID: <20241210161733.1830573-67-richard.henderson@linaro.org>
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
X-TUID: S6Z1/+YwEKLi

Remove disas_simd_scalar_two_reg_misc and
disas_simd_two_reg_misc_fp16 as these were the
last insns decoded by those functions.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 329 ++++-----------------------------
 target/arm/tcg/a64.decode      |  15 ++
 2 files changed, 53 insertions(+), 291 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1776862161..63cf25251b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -8501,6 +8501,27 @@ TRANS_FEAT(FRINT64Z_s, aa64_frint, do_fp1_scalar, a,
            &f_scalar_frint64, FPROUNDING_ZERO)
 TRANS_FEAT(FRINT64X_s, aa64_frint, do_fp1_scalar, a, &f_scalar_frint64, -1)
 
+static const FPScalar1 f_scalar_frecpe = {
+    gen_helper_recpe_f16,
+    gen_helper_recpe_f32,
+    gen_helper_recpe_f64,
+};
+TRANS(FRECPE_s, do_fp1_scalar, a, &f_scalar_frecpe, -1)
+
+static const FPScalar1 f_scalar_frecpx = {
+    gen_helper_frecpx_f16,
+    gen_helper_frecpx_f32,
+    gen_helper_frecpx_f64,
+};
+TRANS(FRECPX_s, do_fp1_scalar, a, &f_scalar_frecpx, -1)
+
+static const FPScalar1 f_scalar_frsqrte = {
+    gen_helper_rsqrte_f16,
+    gen_helper_rsqrte_f32,
+    gen_helper_rsqrte_f64,
+};
+TRANS(FRSQRTE_s, do_fp1_scalar, a, &f_scalar_frsqrte, -1)
+
 static bool trans_FCVT_s_ds(DisasContext *s, arg_rr *a)
 {
     if (fp_access_check(s)) {
@@ -9471,36 +9492,28 @@ static gen_helper_gvec_2_ptr * const f_fcle0[] = {
 };
 TRANS(FCMLE0_v, do_gvec_op2_fpst, a->esz, a->q, a->rd, a->rn, 0, f_fcle0)
 
+static gen_helper_gvec_2_ptr * const f_frecpe[] = {
+    gen_helper_gvec_frecpe_h,
+    gen_helper_gvec_frecpe_s,
+    gen_helper_gvec_frecpe_d,
+};
+TRANS(FRECPE_v, do_gvec_op2_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frecpe)
+
+static gen_helper_gvec_2_ptr * const f_frsqrte[] = {
+    gen_helper_gvec_frsqrte_h,
+    gen_helper_gvec_frsqrte_s,
+    gen_helper_gvec_frsqrte_d,
+};
+TRANS(FRSQRTE_v, do_gvec_op2_fpst, a->esz, a->q, a->rd, a->rn, 0, f_frsqrte)
+
 static void handle_2misc_reciprocal(DisasContext *s, int opcode,
                                     bool is_scalar, bool is_u, bool is_q,
                                     int size, int rn, int rd)
 {
     bool is_double = (size == 3);
-    TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
 
     if (is_double) {
-        TCGv_i64 tcg_op = tcg_temp_new_i64();
-        TCGv_i64 tcg_res = tcg_temp_new_i64();
-        int pass;
-
-        for (pass = 0; pass < (is_scalar ? 1 : 2); pass++) {
-            read_vec_element(s, tcg_op, rn, pass, MO_64);
-            switch (opcode) {
-            case 0x3d: /* FRECPE */
-                gen_helper_recpe_f64(tcg_res, tcg_op, fpst);
-                break;
-            case 0x3f: /* FRECPX */
-                gen_helper_frecpx_f64(tcg_res, tcg_op, fpst);
-                break;
-            case 0x7d: /* FRSQRTE */
-                gen_helper_rsqrte_f64(tcg_res, tcg_op, fpst);
-                break;
-            default:
-                g_assert_not_reached();
-            }
-            write_vec_element(s, tcg_res, rd, pass, MO_64);
-        }
-        clear_vec_high(s, !is_scalar, rd);
+        g_assert_not_reached();
     } else {
         TCGv_i32 tcg_op = tcg_temp_new_i32();
         TCGv_i32 tcg_res = tcg_temp_new_i32();
@@ -9520,14 +9533,8 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
                 gen_helper_recpe_u32(tcg_res, tcg_op);
                 break;
             case 0x3d: /* FRECPE */
-                gen_helper_recpe_f32(tcg_res, tcg_op, fpst);
-                break;
             case 0x3f: /* FRECPX */
-                gen_helper_frecpx_f32(tcg_res, tcg_op, fpst);
-                break;
             case 0x7d: /* FRSQRTE */
-                gen_helper_rsqrte_f32(tcg_res, tcg_op, fpst);
-                break;
             default:
                 g_assert_not_reached();
             }
@@ -9544,76 +9551,6 @@ static void handle_2misc_reciprocal(DisasContext *s, int opcode,
     }
 }
 
-/* AdvSIMD scalar two reg misc
- *  31 30  29 28       24 23  22 21       17 16    12 11 10 9    5 4    0
- * +-----+---+-----------+------+-----------+--------+-----+------+------+
- * | 0 1 | U | 1 1 1 1 0 | size | 1 0 0 0 0 | opcode | 1 0 |  Rn  |  Rd  |
- * +-----+---+-----------+------+-----------+--------+-----+------+------+
- */
-static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
-{
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int opcode = extract32(insn, 12, 5);
-    int size = extract32(insn, 22, 2);
-    bool u = extract32(insn, 29, 1);
-
-    switch (opcode) {
-    case 0xc ... 0xf:
-    case 0x16 ... 0x1d:
-    case 0x1f:
-        /* Floating point: U, size[1] and opcode indicate operation;
-         * size[0] indicates single or double precision.
-         */
-        opcode |= (extract32(size, 1, 1) << 5) | (u << 6);
-        size = extract32(size, 0, 1) ? 3 : 2;
-        switch (opcode) {
-        case 0x3d: /* FRECPE */
-        case 0x3f: /* FRECPX */
-        case 0x7d: /* FRSQRTE */
-            if (!fp_access_check(s)) {
-                return;
-            }
-            handle_2misc_reciprocal(s, opcode, true, u, true, size, rn, rd);
-            return;
-        case 0x1a: /* FCVTNS */
-        case 0x1b: /* FCVTMS */
-        case 0x3a: /* FCVTPS */
-        case 0x3b: /* FCVTZS */
-        case 0x5a: /* FCVTNU */
-        case 0x5b: /* FCVTMU */
-        case 0x7a: /* FCVTPU */
-        case 0x7b: /* FCVTZU */
-        case 0x1c: /* FCVTAS */
-        case 0x5c: /* FCVTAU */
-        case 0x56: /* FCVTXN, FCVTXN2 */
-        case 0x1d: /* SCVTF */
-        case 0x5d: /* UCVTF */
-        case 0x2c: /* FCMGT (zero) */
-        case 0x2d: /* FCMEQ (zero) */
-        case 0x2e: /* FCMLT (zero) */
-        case 0x6c: /* FCMGE (zero) */
-        case 0x6d: /* FCMLE (zero) */
-        default:
-            unallocated_encoding(s);
-            return;
-        }
-        break;
-    default:
-    case 0x3: /* USQADD / SUQADD */
-    case 0x7: /* SQABS / SQNEG */
-    case 0x8: /* CMGT, CMGE */
-    case 0x9: /* CMEQ, CMLE */
-    case 0xa: /* CMLT */
-    case 0xb: /* ABS, NEG */
-    case 0x12: /* SQXTUN */
-    case 0x14: /* SQXTN, UQXTN */
-        unallocated_encoding(s);
-        return;
-    }
-    g_assert_not_reached();
-}
-
 static void handle_2misc_widening(DisasContext *s, int opcode, bool is_q,
                                   int size, int rn, int rd)
 {
@@ -9693,13 +9630,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
                 unallocated_encoding(s);
                 return;
             }
-            /* fall through */
-        case 0x3d: /* FRECPE */
-        case 0x7d: /* FRSQRTE */
-            if (size == 3 && !is_q) {
-                unallocated_encoding(s);
-                return;
-            }
             if (!fp_access_check(s)) {
                 return;
             }
@@ -9752,6 +9682,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         case 0x2e: /* FCMLT (zero) */
         case 0x6c: /* FCMGE (zero) */
         case 0x6d: /* FCMLE (zero) */
+        case 0x3d: /* FRECPE */
+        case 0x7d: /* FRSQRTE */
             unallocated_encoding(s);
             return;
         }
@@ -9847,189 +9779,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 }
 
-/* AdvSIMD [scalar] two register miscellaneous (FP16)
- *
- *   31  30  29 28  27     24  23 22 21       17 16    12 11 10 9    5 4    0
- * +---+---+---+---+---------+---+-------------+--------+-----+------+------+
- * | 0 | Q | U | S | 1 1 1 0 | a | 1 1 1 1 0 0 | opcode | 1 0 |  Rn  |  Rd  |
- * +---+---+---+---+---------+---+-------------+--------+-----+------+------+
- *   mask: 1000 1111 0111 1110 0000 1100 0000 0000 0x8f7e 0c00
- *   val:  0000 1110 0111 1000 0000 1000 0000 0000 0x0e78 0800
- *
- * This actually covers two groups where scalar access is governed by
- * bit 28. A bunch of the instructions (float to integral) only exist
- * in the vector form and are un-allocated for the scalar decode. Also
- * in the scalar decode Q is always 1.
- */
-static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
-{
-    int fpop, opcode, a, u;
-    int rn, rd;
-    bool is_q;
-    bool is_scalar;
-
-    int pass;
-    TCGv_i32 tcg_rmode = NULL;
-    TCGv_ptr tcg_fpstatus = NULL;
-    bool need_fpst = true;
-    int rmode = -1;
-
-    if (!dc_isar_feature(aa64_fp16, s)) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    rd = extract32(insn, 0, 5);
-    rn = extract32(insn, 5, 5);
-
-    a = extract32(insn, 23, 1);
-    u = extract32(insn, 29, 1);
-    is_scalar = extract32(insn, 28, 1);
-    is_q = extract32(insn, 30, 1);
-
-    opcode = extract32(insn, 12, 5);
-    fpop = deposit32(opcode, 5, 1, a);
-    fpop = deposit32(fpop, 6, 1, u);
-
-    switch (fpop) {
-    case 0x3d: /* FRECPE */
-    case 0x3f: /* FRECPX */
-        break;
-    case 0x7d: /* FRSQRTE */
-        break;
-    default:
-    case 0x2f: /* FABS */
-    case 0x6f: /* FNEG */
-    case 0x7f: /* FSQRT (vector) */
-    case 0x18: /* FRINTN */
-    case 0x19: /* FRINTM */
-    case 0x38: /* FRINTP */
-    case 0x39: /* FRINTZ */
-    case 0x58: /* FRINTA */
-    case 0x59: /* FRINTX */
-    case 0x79: /* FRINTI */
-    case 0x1d: /* SCVTF */
-    case 0x5d: /* UCVTF */
-    case 0x1a: /* FCVTNS */
-    case 0x1b: /* FCVTMS */
-    case 0x1c: /* FCVTAS */
-    case 0x3a: /* FCVTPS */
-    case 0x3b: /* FCVTZS */
-    case 0x5a: /* FCVTNU */
-    case 0x5b: /* FCVTMU */
-    case 0x5c: /* FCVTAU */
-    case 0x7a: /* FCVTPU */
-    case 0x7b: /* FCVTZU */
-    case 0x2c: /* FCMGT (zero) */
-    case 0x2d: /* FCMEQ (zero) */
-    case 0x2e: /* FCMLT (zero) */
-    case 0x6c: /* FCMGE (zero) */
-    case 0x6d: /* FCMLE (zero) */
-        unallocated_encoding(s);
-        return;
-    }
-
-
-    /* Check additional constraints for the scalar encoding */
-    if (is_scalar) {
-        if (!is_q) {
-            unallocated_encoding(s);
-            return;
-        }
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    if (rmode >= 0 || need_fpst) {
-        tcg_fpstatus = fpstatus_ptr(FPST_FPCR_F16);
-    }
-
-    if (rmode >= 0) {
-        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
-    }
-
-    if (is_scalar) {
-        TCGv_i32 tcg_op = read_fp_hreg(s, rn);
-        TCGv_i32 tcg_res = tcg_temp_new_i32();
-
-        switch (fpop) {
-        case 0x3d: /* FRECPE */
-            gen_helper_recpe_f16(tcg_res, tcg_op, tcg_fpstatus);
-            break;
-        case 0x3f: /* FRECPX */
-            gen_helper_frecpx_f16(tcg_res, tcg_op, tcg_fpstatus);
-            break;
-        case 0x7d: /* FRSQRTE */
-            gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
-            break;
-        default:
-        case 0x1a: /* FCVTNS */
-        case 0x1b: /* FCVTMS */
-        case 0x1c: /* FCVTAS */
-        case 0x3a: /* FCVTPS */
-        case 0x3b: /* FCVTZS */
-        case 0x5a: /* FCVTNU */
-        case 0x5b: /* FCVTMU */
-        case 0x5c: /* FCVTAU */
-        case 0x7a: /* FCVTPU */
-        case 0x7b: /* FCVTZU */
-            g_assert_not_reached();
-        }
-
-        /* limit any sign extension going on */
-        tcg_gen_andi_i32(tcg_res, tcg_res, 0xffff);
-        write_fp_sreg(s, rd, tcg_res);
-    } else {
-        for (pass = 0; pass < (is_q ? 8 : 4); pass++) {
-            TCGv_i32 tcg_op = tcg_temp_new_i32();
-            TCGv_i32 tcg_res = tcg_temp_new_i32();
-
-            read_vec_element_i32(s, tcg_op, rn, pass, MO_16);
-
-            switch (fpop) {
-            case 0x3d: /* FRECPE */
-                gen_helper_recpe_f16(tcg_res, tcg_op, tcg_fpstatus);
-                break;
-            case 0x7d: /* FRSQRTE */
-                gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
-                break;
-            default:
-            case 0x2f: /* FABS */
-            case 0x6f: /* FNEG */
-            case 0x7f: /* FSQRT */
-            case 0x18: /* FRINTN */
-            case 0x19: /* FRINTM */
-            case 0x38: /* FRINTP */
-            case 0x39: /* FRINTZ */
-            case 0x58: /* FRINTA */
-            case 0x79: /* FRINTI */
-            case 0x59: /* FRINTX */
-            case 0x1a: /* FCVTNS */
-            case 0x1b: /* FCVTMS */
-            case 0x1c: /* FCVTAS */
-            case 0x3a: /* FCVTPS */
-            case 0x3b: /* FCVTZS */
-            case 0x5a: /* FCVTNU */
-            case 0x5b: /* FCVTMU */
-            case 0x5c: /* FCVTAU */
-            case 0x7a: /* FCVTPU */
-            case 0x7b: /* FCVTZU */
-                g_assert_not_reached();
-            }
-
-            write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
-        }
-
-        clear_vec_high(s, is_q, rd);
-    }
-
-    if (tcg_rmode) {
-        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
-    }
-}
-
 /* C3.6 Data processing - SIMD, inc Crypto
  *
  * As the decode gets a little complex we are using a table based
@@ -10038,8 +9787,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
 static const AArch64DecodeTable data_proc_simd[] = {
     /* pattern  ,  mask     ,  fn                        */
     { 0x0e200800, 0x9f3e0c00, disas_simd_two_reg_misc },
-    { 0x5e200800, 0xdf3e0c00, disas_simd_scalar_two_reg_misc },
-    { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
     { 0x00000000, 0x00000000, NULL }
 };
 
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index d1c4a330f2..9b3b09c3bb 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1667,6 +1667,15 @@ FCMLE0_s        0111 1110 1.1 00000 11011 0 ..... .....     @rr_sd
 FCMLT0_s        0101 1110 111 11000 11101 0 ..... .....     @rr_h
 FCMLT0_s        0101 1110 1.1 00000 11101 0 ..... .....     @rr_sd
 
+FRECPE_s        0101 1110 111 11001 11011 0 ..... .....     @rr_h
+FRECPE_s        0101 1110 1.1 00001 11011 0 ..... .....     @rr_sd
+
+FRECPX_s        0101 1110 111 11001 11111 0 ..... .....     @rr_h
+FRECPX_s        0101 1110 1.1 00001 11111 0 ..... .....     @rr_sd
+
+FRSQRTE_s       0111 1110 111 11001 11011 0 ..... .....     @rr_h
+FRSQRTE_s       0111 1110 1.1 00001 11011 0 ..... .....     @rr_sd
+
 @icvt_h         . ....... .. ...... ...... rn:5 rd:5 \
                 &fcvt sf=0 esz=1 shift=0
 @icvt_sd        . ....... .. ...... ...... rn:5 rd:5 \
@@ -1848,6 +1857,12 @@ FCMLE0_v        0.10 1110 1.1 00000 11011 0 ..... .....     @qrr_sd
 FCMLT0_v        0.00 1110 111 11000 11101 0 ..... .....     @qrr_h
 FCMLT0_v        0.00 1110 1.1 00000 11101 0 ..... .....     @qrr_sd
 
+FRECPE_v        0.00 1110 111 11001 11011 0 ..... .....     @qrr_h
+FRECPE_v        0.00 1110 1.1 00001 11011 0 ..... .....     @qrr_sd
+
+FRSQRTE_v       0.10 1110 111 11001 11011 0 ..... .....     @qrr_h
+FRSQRTE_v       0.10 1110 1.1 00001 11011 0 ..... .....     @qrr_sd
+
 &fcvt_q         rd rn esz q shift
 @fcvtq_h        . q:1 . ...... 001 .... ...... rn:5 rd:5    \
                 &fcvt_q esz=1 shift=%fcvt_f_sh_h
-- 
2.43.0

