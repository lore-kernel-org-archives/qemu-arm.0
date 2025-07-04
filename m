Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1259867dyc;
        Fri, 4 Jul 2025 07:38:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWCQme2pPTeR97PHP77s8lVzzkyPYksqLe2GXyz/FCUec4mFClprhAAHbxwhMCvJhCnDZxslCs4W9nXGw==@linaro.org
X-Google-Smtp-Source: AGHT+IFWUOkn2Kcs2lhfi7iPkY3E+0JdHKHrl6jY7Np6ku/DQfK77d8pxY4ffQwaPi638MLvcNi6
X-Received: by 2002:a05:620a:2292:b0:7d3:9203:206c with SMTP id af79cd13be357-7d5dcc76193mr359011985a.9.1751639927389;
        Fri, 04 Jul 2025 07:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639927; cv=none;
        d=google.com; s=arc-20240605;
        b=AZOnUBOFp4tHyrH1SjaQszDQMu5CeoFfB7rK/XjE7c9+Mog24eqZq4Il5lJWd2/vw5
         1LgvRD/kNTUKon/0THs41ffccU0RWKM5oKJTxOa9fDgWsEDzk+Z8a/nzIebepboIEQq8
         sn6gRfhvGGiABlafHa/cDkpwfylH0AkcMGqlGlgy2HDqJ0JdqnQn4S5AYInNQT57KwJS
         +txB3rZ6wqwHiyfdWaqiRRwurNdtj+PSaAZxlu+371lPLqEzScmy1uagyuLSOFYKxOIW
         ON/8SKsv/n7Kekc2R0d3vtoVOKufTyNaqAhuqtGfUjCtKomiTTiN7h4oOsuH1NfPWYA+
         oXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CY8GPK9LjD5vvFu1A4yXRIWcAh0FAk2ttUM/giYYY2o=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=g4j7Cd0om3LqfUxIaKtXi1mIOy+D22SlxQtiSECw1XRdQsmO9KItT3Npi2hZCwwzjs
         ZnzcgK5M/6xsJDn3/rKR4TxAJB25iKDlxlmwPqOOK3fx+VnKQbc/tYOfipoaX69uWBwX
         wvnaGTQ0b3eGxiB0QigIp1edJzKe2xLXwrr4VBaaz8wy/uMMfIwL5d12YBvJGRL4Ajc1
         0R/85LLmEqjwcMsOVHSJhQ5XIAjfCBoNu3z6AsY8ipQq6pIJBKvEkJYH/g7RtXvL+O59
         8965PQk58eOck3mUVIKxgcA+B7ZaslVIEt+Fz5El78ckADgi7nAd0m8v5dK/mwSqxAO/
         9d/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2fr6xug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbdca050si225519485a.57.2025.07.04.07.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:38:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b2fr6xug;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhS6-00076H-91; Fri, 04 Jul 2025 10:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhMD-0004pR-D5
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:47 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM9-0008E0-Bj
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:40 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-611998766c0so545402eaf.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639135; x=1752243935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CY8GPK9LjD5vvFu1A4yXRIWcAh0FAk2ttUM/giYYY2o=;
 b=b2fr6xug8Yd8HH0LGuwEfGrc4BJsGrQvs9FcHyv2PPMJbR2/4a80civbXD7scPm4SW
 /+hVZX9mc6UC4OPAajRFFG7BjzUbs5cHYRCE/S793T/8FuCHvVPPHomnmk5pfv0pn+9X
 ReL17/wW9FQhbGRx092S0JpOKtWyNdyA3LyRXK9xM94LKp7j0uH1UdN2KeT+AfDQXn3G
 P+Wf2vGCekoMZrHc/0z5q43ckh/7OKprGyBZuwesef4fvB9VH43bZN/NiFWxaMW8vVys
 /M7QWCmhCFUH4PrnWClxAiyrrNDcP8VmGHP1hO76vCheXzhum31If+knfXIgSgivhx1h
 E8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639135; x=1752243935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CY8GPK9LjD5vvFu1A4yXRIWcAh0FAk2ttUM/giYYY2o=;
 b=LJ+RRSSRGiTi7XkZjPZ9BftILTMPNtjuHbvdXhUquuXaqWUppFw9/hwhEsJO7WpWfv
 zX5GTrXsI3hUan9eR3sy6g3ZfRFgfHwjA42U0rmhmXDEUDGRNUu+Bm8n9qCG6Q8dIGyW
 UAiFFI/BFknsNrJNedXpuBFROkqs8AXTKoreZGrXOYOkEwyGziejK1ULSaXK7y9mlNvS
 Tkx7/9BU/6o/DOAtpb0y2QzFYimZuuocGS6fry9gohHd7z4D75EW3/0zUnm05XeM2ICs
 fQvLSS6ut4DCszaAhVVT6hN/+QUqEMSoLlUS/Nl4YAvJPRkqEx4csPPwrCqCNpTbCp1s
 1l0w==
X-Gm-Message-State: AOJu0YzbceL3pyt7YoojYHt5piB1LGsYigQTDF92keZaMrxMoCzN10St
 34qMUQJJBqu4kwP0KkVXBjix0IK06786hLSu57JiUPtElxxHlUyM6rWMoHMhqgtXzqCwFkP6VPk
 5cGyNoUE=
X-Gm-Gg: ASbGncvFkeQRFz9ikuEPsm+OdmXkIgWb/EZ9qnvMmSbAh4OweQhS+gg6VSD0+j66mCL
 ohyR0Wiqrr2KnKfx2tVgZ7ZUSnPABvpxTyPMUJc6Za4Iwi3eMwZwJTtZVk+aVq91KYGYoxLFez9
 thhiqDcsDDOHmmGSR4Hp1n5vWWO2adcTfH3lLBROMNmAmcxbgn0jT4o4xs8w01xJZ3Lw5W7NBrM
 RiW/IrS3CErWInbaZdN6H7tTP5zAtvcHVoJyMLEnPq/05rH9If3comSFkrFW2pKQlreAzFVKBlv
 xmga4l6U9+MbWZD93kDMIpxTUMhlipQoARko1WpbTC53AeqDOdkBeC3iI5er6SY+06PcJCygS3q
 1ZQphToWbUh5zdJYK0r6Aukpjpdqe4z6h50rdpQrOC8gfgjhNF8iwGVKd9rM=
X-Received: by 2002:a05:6820:1e82:b0:611:befc:38e5 with SMTP id
 006d021491bc7-6138fd6a38cmr2315074eaf.4.1751639135429; 
 Fri, 04 Jul 2025 07:25:35 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 078/108] target/arm: Implement SVE2p1 WHILE (predicate pair)
Date: Fri,  4 Jul 2025 08:20:41 -0600
Message-ID: <20250704142112.1018902-79-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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
X-TUID: qzXsIAceovdc

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    |  3 +++
 target/arm/tcg/sve_helper.c    | 40 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c | 14 ++++++++----
 target/arm/tcg/sve.decode      |  8 +++++++
 4 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 0b1b588783..eac23e75b9 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -941,6 +941,9 @@ DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_whilel, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
 DEF_HELPER_FLAGS_3(sve_whileg, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
 
+DEF_HELPER_FLAGS_3(sve_while2l, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+DEF_HELPER_FLAGS_3(sve_while2g, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+
 DEF_HELPER_FLAGS_4(sve_subri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_subri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_subri_s, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index b8f3fbb816..30394f4880 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4139,6 +4139,26 @@ uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
     return pred_count_test(oprbits, count, false);
 }
 
+uint32_t HELPER(sve_while2l)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    uint32_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    uint32_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    uint32_t oprbits = oprsz * 8;
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+
+    count <<= esz;
+    memset(d, 0, 2 * sizeof(*d));
+    if (count <= oprbits) {
+        do_whilel(&d[0], esz_mask, count, oprbits);
+    } else {
+        do_whilel(&d[0], esz_mask, oprbits, oprbits);
+        do_whilel(&d[1], esz_mask, count - oprbits, oprbits);
+    }
+
+    return pred_count_test(2 * oprbits, count, false);
+}
+
 /* D must be cleared on entry. */
 static void do_whileg(ARMPredicateReg *d, uint64_t esz_mask,
                       uint32_t count, uint32_t oprbits)
@@ -4172,6 +4192,26 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
     return pred_count_test(oprbits, count, true);
 }
 
+uint32_t HELPER(sve_while2g)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    uint32_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    uint32_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
+    uint32_t oprbits = oprsz * 8;
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+
+    count <<= esz;
+    memset(d, 0, 2 * sizeof(*d));
+    if (count <= oprbits) {
+        do_whileg(&d[1], esz_mask, count, oprbits);
+    } else {
+        do_whilel(&d[1], esz_mask, oprbits, oprbits);
+        do_whileg(&d[0], esz_mask, count - oprbits, oprbits);
+    }
+
+    return pred_count_test(2 * oprbits, count, true);
+}
+
 /* Recursive reduction on a function;
  * C.f. the ARM ARM function ReducePredicated.
  *
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index cb60b533e9..de6ffe7511 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3109,7 +3109,8 @@ static bool trans_CTERM(DisasContext *s, arg_CTERM *a)
 }
 
 typedef void gen_while_fn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
-static bool do_WHILE(DisasContext *s, arg_while *a, bool lt, gen_while_fn *fn)
+static bool do_WHILE(DisasContext *s, arg_while *a,
+                     bool lt, int scale, gen_while_fn *fn)
 {
     TCGv_i64 op0, op1, t0, t1, tmax;
     TCGv_i32 t2;
@@ -3164,7 +3165,7 @@ static bool do_WHILE(DisasContext *s, arg_while *a, bool lt, gen_while_fn *fn)
         }
     }
 
-    tmax = tcg_constant_i64(vsz >> a->esz);
+    tmax = tcg_constant_i64((vsz << scale) >> a->esz);
     if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
@@ -3205,8 +3206,13 @@ static bool do_WHILE(DisasContext *s, arg_while *a, bool lt, gen_while_fn *fn)
     return true;
 }
 
-TRANS_FEAT(WHILE_lt, aa64_sve, do_WHILE, a, true, gen_helper_sve_whilel)
-TRANS_FEAT(WHILE_gt, aa64_sve2, do_WHILE, a, false, gen_helper_sve_whileg)
+TRANS_FEAT(WHILE_lt, aa64_sve, do_WHILE, a, true, 0, gen_helper_sve_whilel)
+TRANS_FEAT(WHILE_gt, aa64_sve2, do_WHILE, a, false, 0, gen_helper_sve_whileg)
+
+TRANS_FEAT(WHILE_lt_pair, aa64_sme2_or_sve2p1, do_WHILE,
+           a, true, 1, gen_helper_sve_while2l)
+TRANS_FEAT(WHILE_gt_pair, aa64_sme2_or_sve2p1, do_WHILE,
+           a, false, 1, gen_helper_sve_while2g)
 
 static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
 {
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index c90d975ebf..968b2a57e9 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -796,6 +796,14 @@ WHILE_gt        00100101 esz:2 1 rm:5 000 sf:1 u:1 0 rn:5 eq:1 rd:4  &while
 # SVE2 pointer conflict compare
 WHILE_ptr       00100101 esz:2 1 rm:5 001 100 rn:5 rw:1 rd:4
 
+# SVE2.1 predicate pair
+%pd_pair        1:3 !function=times_2
+@while_pair     ........ esz:2 . rm:5 .... u:1 . rn:5 . ... eq:1 \
+                &while rd=%pd_pair sf=1
+
+WHILE_lt_pair   00100101 .. 1 ..... 0101 . 1 ..... 1 ... .  @while_pair
+WHILE_gt_pair   00100101 .. 1 ..... 0101 . 0 ..... 1 ... .  @while_pair
+
 ### SVE Integer Wide Immediate - Unpredicated Group
 
 # SVE broadcast floating-point immediate (unpredicated)
-- 
2.43.0

