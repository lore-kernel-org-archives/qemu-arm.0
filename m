Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp751211njc;
        Tue, 25 Jun 2024 11:47:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUcDDNmQFMYYOMeN+GRx9/5L/nOFht9d72MqRyA8iOY1KiDUCAxBf1Xkp9g2EIz+ii4Ugp3TSLMH39ifha6T+10Q71rBuB
X-Google-Smtp-Source: AGHT+IFtcmFZXUJ5W7IxZwOxwG8coC+Q21LS13OcFN9c4n7bTPk5FdomIiwgGe2mjG9qy1aosyuZ
X-Received: by 2002:ac8:5908:0:b0:444:9a68:102a with SMTP id d75a77b69052e-444d9219bf8mr82713171cf.35.1719341255415;
        Tue, 25 Jun 2024 11:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719341255; cv=none;
        d=google.com; s=arc-20160816;
        b=FL7o3Z5bAFCw6DtiRY5aY+MUMVEDsL+IzrOlOemCvBRFZIzDMa4hhWcbkrF37Bp7IB
         5lOzn8zVX/rTPLWceDoWXvjBPjTMmFPaiXjS/KawUNvv8qV1tR3h5qg/uPNmbzrjl/4A
         LWEn7FmQwne3Roh+eMoEG+NwLywAxDf+uyk+Bw7raAac9p5dIqauajpsxN95TX3vqMQH
         dSVsUISxwJiGF3RvR5pJzlPlV7NwBkIQ2Pc52BYuIteR2sVwYLfolkN3n8/ldIUrfvBJ
         Go5fttEgAhmqr1jjIVTaYAbtnwvwBDNoM0HWvtr2uZAJQvDU6qN9FMG/Tuk32SZ7XCX/
         vLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eN1Efob1I3xatF3I5F8UROtAF2gQdoNN9Kj4+5dUxQA=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=kShlZ7H0FtKBoJvoRONEULlIZzD8fjtqKKLTOTVqVrYUOYSgSUNqcrw8M68rbkoNe9
         DOclKd9pMlS4T8T6Sy6O95aq9BJdq7YCzTeQy/kuDgjZ+rzChfUlPnSJuxWtqEY6/sZX
         TMnJwVKKx6vyxX0sUM9YAj02ou8aufsa5NpIXfzmTDy1MeqtpGjlsiJGmMWFYZctzd5A
         V/yKtG9m1Y9ztWTzD84UAiGi725A7jHLIBA7uYNaobiBRtL3zktx91WKnIfcjoUpo7vU
         BhrB1rkWPNU+yPJTiG8ePpKmhBwCjIEMokh4CW7yfJt1tTD6lSYyF8lnb/Ccd6DYIZgt
         ceSA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rpN3HY1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2c08066si120613211cf.265.2024.06.25.11.47.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 11:47:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rpN3HY1N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMBAJ-0002QR-QB; Tue, 25 Jun 2024 14:46:12 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB4c-0000zW-H7
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:39:34 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB3g-00066O-LC
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:39:09 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1fa07e4f44eso30304225ad.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340543; x=1719945343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eN1Efob1I3xatF3I5F8UROtAF2gQdoNN9Kj4+5dUxQA=;
 b=rpN3HY1NkKwLWpqvSKZIf+0IdOz+PbMOmA1oNFTNIQhCYhgyavba0eZBRTIkYh5ymn
 lIOVsmOb4LeYUc9C0DEXgeFosEAobiN6E2aGzYZqO6jhgEnL6rF8Ztdh4C6drPXicciK
 ypcHPGT2TzZ1WGdaQwTFI/Ncu47FhUGxO8WifJHZnhFsPRIXEFFy/V7r3fxSIay9r5x6
 Yk4VVm+hzlY8rkqkV6NVZSoSyPigPq/Pr4whdvBLCMho3fOa3UwUxh9JqvPSS6wd+vXr
 zWKmuTWZUCtU7QoGBF+c5mvizLEGiQGxMt7Jl4Nf6XayOnb1KFtyE6oRxnrNA7OVO//l
 8HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340543; x=1719945343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eN1Efob1I3xatF3I5F8UROtAF2gQdoNN9Kj4+5dUxQA=;
 b=IOvOz4lft11yoXQRj9HObfJ7i5A0G8rTF0ZjpiZUJMAEdsn3LKbEWsGs2e8QkkrOqH
 1oJf9BV/uQYG7EIB5cN/1vVUH/XI2s6gFKcLSb92qrQ6BxQ707ll629kSJVHwoGRD/wr
 6JwKRZ+Nv9CQigqUfO4cm1CWr21DzuHThx0kz0APMJIxEN02GrjcCnDM358Atdj5zqTP
 aB60M0XBvo8zwKCEDXfCqK33/ASd5VXWyA5M3wM7+VekkyWhLIFASwT38iaNDoDIyozM
 vipZnNcAp+WDQ7xxmvmKSUuJTktYcP3IHiIzmY1H/fB8bilU0kRiisx7guQlSTv2gpmM
 ZLtA==
X-Gm-Message-State: AOJu0YxSusZMQzbPkSR7+uaQxkv2UFZm9jfefCt9VP2ungfasIqX/U49
 8kCoe/g1Z79XSh/MAtra+E6IhEe8Hq543uHPTyNXTqxlMnVTrIJKBjjNx9sJkJ0=
X-Received: by 2002:a17:903:32ce:b0:1fa:643:f424 with SMTP id
 d9443c01a7336-1fa238e46ddmr109487635ad.14.1719340542474; 
 Tue, 25 Jun 2024 11:35:42 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 05/13] target/arm: Convert SDOT, UDOT to decodetree
Date: Tue, 25 Jun 2024 11:35:28 -0700
Message-Id: <20240625183536.1672454-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625183536.1672454-1-richard.henderson@linaro.org>
References: <20240625183536.1672454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: nk5zoh76Mb6a

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  7 +++++
 target/arm/tcg/translate-a64.c | 54 ++++++++++++++++++----------------
 2 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 613cc9365c..7411d4ba97 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -61,6 +61,7 @@
 
 @qrrr_b         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=0
 @qrrr_h         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=1
+@qrrr_s         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=2
 @qrrr_sd        . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=%esz_sd
 @qrrr_e         . q:1 ...... esz:2 . rm:5 ...... rn:5 rd:5  &qrrr_e
 @qr2r_e         . q:1 ...... esz:2 . ..... ...... rm:5 rd:5 &qrrr_e rn=%rd
@@ -946,6 +947,9 @@ SQRDMULH_v      0.10 1110 ..1 ..... 10110 1 ..... ..... @qrrr_e
 SQRDMLAH_v      0.10 1110 ..0 ..... 10000 1 ..... ..... @qrrr_e
 SQRDMLSH_v      0.10 1110 ..0 ..... 10001 1 ..... ..... @qrrr_e
 
+SDOT_v          0.00 1110 100 ..... 10010 1 ..... ..... @qrrr_s
+UDOT_v          0.10 1110 100 ..... 10010 1 ..... ..... @qrrr_s
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
@@ -1020,6 +1024,9 @@ SQRDMLAH_vi     0.10 1111 10 .. .... 1101 . 0 ..... .....   @qrrx_s
 SQRDMLSH_vi     0.10 1111 01 .. .... 1111 . 0 ..... .....   @qrrx_h
 SQRDMLSH_vi     0.10 1111 10 .. .... 1111 . 0 ..... .....   @qrrx_s
 
+SDOT_vi         0.00 1111 10 .. .... 1110 . 0 ..... .....   @qrrx_s
+UDOT_vi         0.10 1111 10 .. .... 1110 . 0 ..... .....   @qrrx_s
+
 # Floating-point conditional select
 
 FCSEL           0001 1110 .. 1 rm:5 cond:4 11 rn:5 rd:5     esz=%esz_hsd
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 32c24c7422..f2e7d8d75c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5592,6 +5592,18 @@ TRANS(SQRDMULH_v, do_gvec_fn3_no8_no64, a, gen_gvec_sqrdmulh_qc)
 TRANS_FEAT(SQRDMLAH_v, aa64_rdm, do_gvec_fn3_no8_no64, a, gen_gvec_sqrdmlah_qc)
 TRANS_FEAT(SQRDMLSH_v, aa64_rdm, do_gvec_fn3_no8_no64, a, gen_gvec_sqrdmlsh_qc)
 
+static bool do_dot_vector(DisasContext *s, arg_qrrr_e *a,
+                          gen_helper_gvec_4 *fn)
+{
+    if (fp_access_check(s)) {
+        gen_gvec_op4_ool(s, a->q, a->rd, a->rn, a->rm, a->rd, 0, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(SDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_sdot_b)
+TRANS_FEAT(UDOT_v, aa64_dp, do_dot_vector, a, gen_helper_gvec_udot_b)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -5914,6 +5926,18 @@ static gen_helper_gvec_4 * const f_vector_idx_sqrdmlsh[2] = {
 TRANS_FEAT(SQRDMLSH_vi, aa64_rdm, do_int3_qc_vector_idx, a,
            f_vector_idx_sqrdmlsh)
 
+static bool do_dot_vector_idx(DisasContext *s, arg_qrrx_e *a,
+                              gen_helper_gvec_4 *fn)
+{
+    if (fp_access_check(s)) {
+        gen_gvec_op4_ool(s, a->q, a->rd, a->rn, a->rm, a->rd, a->idx, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(SDOT_vi, aa64_dp, do_dot_vector_idx, a, gen_helper_gvec_sdot_idx_b)
+TRANS_FEAT(UDOT_vi, aa64_dp, do_dot_vector_idx, a, gen_helper_gvec_udot_idx_b)
+
 /*
  * Advanced SIMD scalar pairwise
  */
@@ -10890,14 +10914,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     int rot;
 
     switch (u * 16 + opcode) {
-    case 0x02: /* SDOT (vector) */
-    case 0x12: /* UDOT (vector) */
-        if (size != MO_32) {
-            unallocated_encoding(s);
-            return;
-        }
-        feature = dc_isar_feature(aa64_dp, s);
-        break;
     case 0x03: /* USDOT */
         if (size != MO_32) {
             unallocated_encoding(s);
@@ -10947,8 +10963,10 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         break;
     default:
+    case 0x02: /* SDOT (vector) */
     case 0x10: /* SQRDMLAH (vector) */
     case 0x11: /* SQRDMLSH (vector) */
+    case 0x12: /* UDOT (vector) */
         unallocated_encoding(s);
         return;
     }
@@ -10961,11 +10979,6 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x2: /* SDOT / UDOT */
-        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0,
-                         u ? gen_helper_gvec_udot_b : gen_helper_gvec_sdot_b);
-        return;
-
     case 0x3: /* USDOT */
         gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_usdot_b);
         return;
@@ -12043,13 +12056,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x0b: /* SQDMULL, SQDMULL2 */
         is_long = true;
         break;
-    case 0x0e: /* SDOT */
-    case 0x1e: /* UDOT */
-        if (is_scalar || size != MO_32 || !dc_isar_feature(aa64_dp, s)) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0x0f:
         switch (size) {
         case 0: /* SUDOT */
@@ -12099,12 +12105,14 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x09: /* FMUL */
     case 0x0c: /* SQDMULH */
     case 0x0d: /* SQRDMULH */
+    case 0x0e: /* SDOT */
     case 0x10: /* MLA */
     case 0x14: /* MLS */
     case 0x18: /* FMLAL2 */
     case 0x19: /* FMULX */
     case 0x1c: /* FMLSL2 */
     case 0x1d: /* SQRDMLAH */
+    case 0x1e: /* UDOT */
     case 0x1f: /* SQRDMLSH */
         unallocated_encoding(s);
         return;
@@ -12180,12 +12188,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 
     switch (16 * u + opcode) {
-    case 0x0e: /* SDOT */
-    case 0x1e: /* UDOT */
-        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
-                         u ? gen_helper_gvec_udot_idx_b
-                         : gen_helper_gvec_sdot_idx_b);
-        return;
     case 0x0f:
         switch (extract32(insn, 22, 2)) {
         case 0: /* SUDOT */
-- 
2.34.1

