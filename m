Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C97C43458
	for <qemu-arm@archiver.kernel.org>; Tue, 30 Jun 2026 13:18:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weYLK-0007bk-Oj; Tue, 30 Jun 2026 09:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLH-0007a9-Jv
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:35 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1weYLF-0005sU-6E
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 09:17:35 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-697df404e32so9411354a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782825451; x=1783430251; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ksv9TfO1zwfVNClMeCsbr3U40+aYKoQ6bDKsO8Cs9cA=;
 b=Xibj8ZNYqvc8f++HX74gpUlfGo5TvXNzNy8+6PtDOBm3n6AXgAitrbxauIPGfE+E/m
 zpJPGj+wifXl0TulaNaDkvbGz9g0/0IAYF8bGkwyouFSLVpUW6t0LEgdmEqKxl8boGov
 +eMl0qALAD3LtwnRLFk0xipepvVqAwAnRVKpDFblSzIE9uddJcA557N9egRXUjkgNdmN
 9WA8fMN1CeVajcQgCxJv5iMZCuq1++0DBLsAKav+gUVjjmj7NLvuV+lYRhFVkz+yxz3e
 yhiOXZWEJYBcWOtWQNhIO2ZFzMEVutm9QU2TSZHeFvUTbt7e0dTRy7Qgdgdd1GTuqUkt
 zz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782825451; x=1783430251;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ksv9TfO1zwfVNClMeCsbr3U40+aYKoQ6bDKsO8Cs9cA=;
 b=Fje2JorO0dALuAUEbl9QThJr2p5Sgy9Ax7iB+zdc+BI08SD3COhjhYSUaPnPaNPtDe
 BuXVsXXAv4D4/j7eBu1cqXj0LarZxevdkBK9eOPKDvp/VWA8UPX/aKfp+YnYMZR8PkcA
 mX+8QfhPUvMnUzIEigkh6YFAUSMD8OT/14XACkZmqG4F+vsTXscIaHZp1IMIcKsIQIMf
 RAJREVBhd+k/4jX+iv0yS+Xa6aSe1pTIRUh7La644x0YgprEat783zB8dpS3zDtR7mVG
 eCZFVXdwXscTIHCR9zC9yNxGhNYya7oxxNKKoW7grTxMoOhDOcdZqWlI0tNUhzYDhzRt
 1HKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoLxL37qtXGUkHn06EaHAuvSvwhTkevFz2dHZvp03e0H2aVxkl1dFDQeDZzDsU46+qQEZ8iJ/v3UA==@nongnu.org
X-Gm-Message-State: AOJu0YwSPLUH5RsbPmFqjH3PtGlBv/q3v2YBJr5jzQCcZcnyPF5o86dW
 gk+rYo5YODKCQwPc3lvGTmv+bidOvTZWSzLlE6h37qMhF8LmWbFG1XaRjXQ7WRp2RnQ=
X-Gm-Gg: AfdE7cnpOXKnGZ4sS2itDCEyrZA7CAhIu/ahPhHF9KAHl6JJ4v4CCc0TihkF2Wm8THw
 ur6d1o4mRkaDVp3oca0IvX9fOnHvbfPkwTF9zZWhwse9YHR7hsuggMRnmUdU/KByt+P1Ly0SIHb
 PiNy/1IteAycRScqnNFmmO18TQfETymQKhogkNKG7WeE3J0Zw6jG7iIOkcqaCpMF1RbPmUvrMyM
 NNTz8prM6U5coen4WTXB/b3thE0Vq/hiH7C8IyAHI/S3qtaJW3Obo/+Qcuw7tNxAwyS2OgC9QxV
 odZFtWLPv9NkJxP2EHR0q7rNqhIK3TMiIO6n7Npb65xzi6KZfAayAXvTFS1EHgb+ussg7VLbrqo
 7t+utLr8sJuUt33RXv4wXv9DzW2/NGHxdSJzjxKigMWX1EHwmmzzvuredP5WccvgrwT64mYby+W
 qIwsXc6K96OU1T41A=
X-Received: by 2002:a05:6402:2548:b0:698:3b7c:7e3e with SMTP id
 4fb4d7f45d1cf-698878e1956mr359384a12.40.1782825451384; 
 Tue, 30 Jun 2026 06:17:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:a648:9a45:1aff:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6987c3a42f6sm1201535a12.6.2026.06.30.06.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 06:17:31 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 30 Jun 2026 14:16:32 +0100
Subject: [PATCH v3 1/6] target/arm/tcg: Implement new instructions for FPRCVT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-jmac-fprcvt-v3-1-f4840d5e0a7f@linaro.org>
References: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
In-Reply-To: <20260630-jmac-fprcvt-v3-0-f4840d5e0a7f@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ed1-x52b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Adds the opcode format for the SIMD versions of FCVTXX and [US]CVTF.
These use very similar logic to the FP-to-general and general-to-FP
register versions which exist, but use another SIMD/FP register
as source or destination. The source and destination size rules are
slightly different.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/cpu-features.h      |  5 +++
 target/arm/tcg/a64.decode      | 15 ++++++++
 target/arm/tcg/translate-a64.c | 83 ++++++++++++++++++++++++++++--------------
 3 files changed, 76 insertions(+), 27 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index a80b251589..aba95f4253 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1665,6 +1665,11 @@ static inline bool isar_feature_aa64_f8mm4(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM4);
 }
 
+static inline bool isar_feature_aa64_fprcvt(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR3, FPRCVT);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 28cd1faf61..5b6f156d08 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1456,6 +1456,21 @@ FCVTZU_g        . 0011110 .. 111001 000000 ..... .....  @icvt
 FCVTAS_g        . 0011110 .. 100100 000000 ..... .....  @icvt
 FCVTAU_g        . 0011110 .. 100101 000000 ..... .....  @icvt
 
+# Conversion between floating-point and integer (SIMD & FP)
+SCVTF_simd      . 0011110 .. 111100 000000 ..... .....  @icvt
+UCVTF_simd      . 0011110 .. 111101 000000 ..... .....  @icvt
+
+FCVTAS_g_simd   . 0011110 .. 111010 000000 ..... .....  @icvt
+FCVTAU_g_simd   . 0011110 .. 111011 000000 ..... .....  @icvt
+FCVTMS_g_simd   . 0011110 .. 110100 000000 ..... .....  @icvt
+FCVTMU_g_simd   . 0011110 .. 110101 000000 ..... .....  @icvt
+FCVTNS_g_simd   . 0011110 .. 101010 000000 ..... .....  @icvt
+FCVTNU_g_simd   . 0011110 .. 101011 000000 ..... .....  @icvt
+FCVTPS_g_simd   . 0011110 .. 110010 000000 ..... .....  @icvt
+FCVTPU_g_simd   . 0011110 .. 110011 000000 ..... .....  @icvt
+FCVTZS_g_simd   . 0011110 .. 110110 000000 ..... .....  @icvt
+FCVTZU_g_simd   . 0011110 .. 110111 000000 ..... .....  @icvt
+
 FJCVTZS         0 0011110 01 111110 000000 ..... .....  @rr
 
 FMOV_ws         0 0011110 00 100110 000000 ..... .....  @rr
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 227719ef25..0da365e345 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9905,12 +9905,14 @@ TRANS(SCVTF_g, do_cvtf_g, a, true)
 TRANS(UCVTF_g, do_cvtf_g, a, false)
 
 /*
- * [US]CVTF (vector), scalar version.
- * Which sounds weird, but really just means input from fp register
+ * [US]CVTF (vector), scalar or SIMD version.
+ * Which sounds weird, but really just means input from FP/SIMD register
  * instead of input from general register.  Input and output element
- * size are always equal.
+ * size are always equal for the scalar version and different for the
+ * SIMD version.
  */
-static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, bool is_signed)
+static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, MemOp src_mop_int,
+                      bool is_signed)
 {
     TCGv_i64 tcg_int;
     int check = fp_access_check_scalar_hsd(s, a->esz);
@@ -9918,14 +9920,18 @@ static bool do_cvtf_f(DisasContext *s, arg_fcvt *a, bool is_signed)
     if (check <= 0) {
         return check == 0;
     }
-
     tcg_int = tcg_temp_new_i64();
-    read_vec_element(s, tcg_int, a->rn, 0, a->esz | (is_signed ? MO_SIGN : 0));
+    read_vec_element(s, tcg_int, a->rn, 0,
+                     src_mop_int | (is_signed ? MO_SIGN : 0));
     return do_cvtf_scalar(s, a->esz, a->rd, a->shift, tcg_int, is_signed);
 }
 
-TRANS(SCVTF_f, do_cvtf_f, a, true)
-TRANS(UCVTF_f, do_cvtf_f, a, false)
+TRANS(SCVTF_f, do_cvtf_f, a, a->esz, true)
+TRANS(UCVTF_f, do_cvtf_f, a, a->esz, false)
+TRANS_FEAT(SCVTF_simd, aa64_fprcvt, do_cvtf_f, a,
+           a->sf ? MO_64 : MO_32, true)
+TRANS_FEAT(UCVTF_simd, aa64_fprcvt, do_cvtf_f, a,
+           a->sf ? MO_64 : MO_32, false)
 
 static void do_fcvt_scalar(DisasContext *s, MemOp out, MemOp esz,
                            TCGv_i64 tcg_out, int shift, int rn,
@@ -10044,6 +10050,7 @@ static bool do_fcvt_g(DisasContext *s, arg_fcvt *a,
     return true;
 }
 
+
 TRANS(FCVTNS_g, do_fcvt_g, a, FPROUNDING_TIEEVEN, true)
 TRANS(FCVTNU_g, do_fcvt_g, a, FPROUNDING_TIEEVEN, false)
 TRANS(FCVTPS_g, do_fcvt_g, a, FPROUNDING_POSINF, true)
@@ -10056,13 +10063,14 @@ TRANS(FCVTAS_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, true)
 TRANS(FCVTAU_g, do_fcvt_g, a, FPROUNDING_TIEAWAY, false)
 
 /*
- * FCVT* (vector), scalar version.
- * Which sounds weird, but really just means output to fp register
+ * FCVT* (vector), scalar or SIMD/FP version.
+ * Which sounds weird, but really just means output to fp or SIMD register
  * instead of output to general register.  Input and output element
- * size are always equal.
+ * size are always equal for the scalar version and different for the
+ * SIMD version.
  */
 static bool do_fcvt_f(DisasContext *s, arg_fcvt *a,
-                      ARMFPRounding rmode, bool is_signed)
+                      ARMFPRounding rmode, MemOp dst_mop_int, bool is_signed)
 {
     TCGv_i64 tcg_int;
     int check = fp_access_check_scalar_hsd(s, a->esz);
@@ -10072,26 +10080,47 @@ static bool do_fcvt_f(DisasContext *s, arg_fcvt *a,
     }
 
     tcg_int = tcg_temp_new_i64();
-    do_fcvt_scalar(s, a->esz | (is_signed ? MO_SIGN : 0),
+    do_fcvt_scalar(s, dst_mop_int | (is_signed ? MO_SIGN : 0),
                    a->esz, tcg_int, a->shift, a->rn, rmode);
 
     if (!s->fpcr_nep) {
         clear_vec(s, a->rd);
     }
-    write_vec_element(s, tcg_int, a->rd, 0, a->esz);
-    return true;
-}
-
-TRANS(FCVTNS_f, do_fcvt_f, a, FPROUNDING_TIEEVEN, true)
-TRANS(FCVTNU_f, do_fcvt_f, a, FPROUNDING_TIEEVEN, false)
-TRANS(FCVTPS_f, do_fcvt_f, a, FPROUNDING_POSINF, true)
-TRANS(FCVTPU_f, do_fcvt_f, a, FPROUNDING_POSINF, false)
-TRANS(FCVTMS_f, do_fcvt_f, a, FPROUNDING_NEGINF, true)
-TRANS(FCVTMU_f, do_fcvt_f, a, FPROUNDING_NEGINF, false)
-TRANS(FCVTZS_f, do_fcvt_f, a, FPROUNDING_ZERO, true)
-TRANS(FCVTZU_f, do_fcvt_f, a, FPROUNDING_ZERO, false)
-TRANS(FCVTAS_f, do_fcvt_f, a, FPROUNDING_TIEAWAY, true)
-TRANS(FCVTAU_f, do_fcvt_f, a, FPROUNDING_TIEAWAY, false)
+    write_vec_element(s, tcg_int, a->rd, 0, dst_mop_int);
+    return true;
+}
+
+TRANS(FCVTNS_f, do_fcvt_f, a, FPROUNDING_TIEEVEN, a->esz, true)
+TRANS(FCVTNU_f, do_fcvt_f, a, FPROUNDING_TIEEVEN, a->esz, false)
+TRANS(FCVTPS_f, do_fcvt_f, a, FPROUNDING_POSINF, a->esz, true)
+TRANS(FCVTPU_f, do_fcvt_f, a, FPROUNDING_POSINF, a->esz, false)
+TRANS(FCVTMS_f, do_fcvt_f, a, FPROUNDING_NEGINF, a->esz, true)
+TRANS(FCVTMU_f, do_fcvt_f, a, FPROUNDING_NEGINF, a->esz, false)
+TRANS(FCVTZS_f, do_fcvt_f, a, FPROUNDING_ZERO, a->esz, true)
+TRANS(FCVTZU_f, do_fcvt_f, a, FPROUNDING_ZERO, a->esz, false)
+TRANS(FCVTAS_f, do_fcvt_f, a, FPROUNDING_TIEAWAY, a->esz, true)
+TRANS(FCVTAU_f, do_fcvt_f, a, FPROUNDING_TIEAWAY, a->esz, false)
+
+TRANS_FEAT(FCVTNS_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_TIEEVEN, a->sf ? MO_64 : MO_32, true)
+TRANS_FEAT(FCVTNU_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_TIEEVEN, a->sf ? MO_64 : MO_32, false)
+TRANS_FEAT(FCVTPS_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_POSINF, a->sf ? MO_64 : MO_32, true)
+TRANS_FEAT(FCVTPU_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_POSINF, a->sf ? MO_64 : MO_32, false)
+TRANS_FEAT(FCVTMS_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_NEGINF, a->sf ? MO_64 : MO_32, true)
+TRANS_FEAT(FCVTMU_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_NEGINF, a->sf ? MO_64 : MO_32, false)
+TRANS_FEAT(FCVTZS_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_ZERO, a->sf ? MO_64 : MO_32, true)
+TRANS_FEAT(FCVTZU_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_ZERO, a->sf ? MO_64 : MO_32, false)
+TRANS_FEAT(FCVTAS_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_TIEAWAY, a->sf ? MO_64 : MO_32, true)
+TRANS_FEAT(FCVTAU_g_simd, aa64_fprcvt, do_fcvt_f, a,
+           FPROUNDING_TIEAWAY, a->sf ? MO_64 : MO_32, false)
 
 static bool trans_FJCVTZS(DisasContext *s, arg_FJCVTZS *a)
 {

-- 
2.43.0


