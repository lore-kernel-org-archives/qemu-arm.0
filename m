Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3793449dye;
        Wed, 2 Jul 2025 06:02:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwC/yyfUctX0YscHEJLtBJdfjKAOnbMeqbjoB9GL0kZulKXdxoNkXzj8eZDPYl7S2eGbUxA/IjeumgkQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGAFFU08gUSn0q347qv3sqNs+MOVwLv8c9T1Ze8mCFFbuDenGFHYUcqCTXxagK5DHIccht6
X-Received: by 2002:a05:620a:d86:b0:7d4:547b:39a2 with SMTP id af79cd13be357-7d5c4658806mr392756985a.12.1751461336981;
        Wed, 02 Jul 2025 06:02:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751461336; cv=none;
        d=google.com; s=arc-20240605;
        b=je/O0DHAWyi2wOmRmVhAUvDlyKdIFqKlriANoHSf/DysAtdbT+vDYEKsiYkwz0i9AQ
         yph2q/0E3reT3sR7jE9WPHxqVX0CUg8IQ0TPO9odr1jNX5KPXkeNiHEHp8sKjFGpVBkl
         jPRCleYP4y/+ShFyYnOCZkoc06EGW7Qj7nZ0kE63JPGyOm2B07ksQrzWfWg5NCoVIo5b
         6j42Aw6S1WatlXclbpebbDqGkzGhUFxkDLnQBbv8B5M4iN4xrbjJdMgthwBzICfxHo8I
         Pd7BD1EazgXtnGKiRqUElEBcQ2YhSvnIyyZjoF+31E2wHvxkqetI9rme0ndxvobmsYBG
         px7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WwLn3WhHlvytYPJIhgkaCdKN0x2bjUBia0lEYjEMXSA=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=lBvWz/vQthVz28a3spPFUGw20fz+IHIehkFMQAOBOF3vM58bxe0sEhIQKZQfhdoZBj
         3MwkfZ+VArVD5Ivl+7JejQ/OTX4pHVhNRNoT/lbFGIyoWhtXX7jWXG25ztrwIrqnfgny
         iCYUlGKDUi7mQZo/GEY5twkENjnBu0ruPh3/3b4jUrUXVh0tPt5UX9z6XALZxQRvayio
         Q1kQyrgCBLQGiy+fCNQ+3TgJgMUPR93da+CF1tEVPQ+/6ddHMV6djYJ3sP0gTJJquKgM
         HAB+QW3kbt5h0a+RUe1S2EnE3NhxO8zmx3tUnLyy3V0dUDQFBMiZpxGdgq5qGbOF0Pns
         AtOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dltj1ZJ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d45f6540aesi579198985a.80.2025.07.02.06.02.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:02:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dltj1ZJ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwmo-0008Br-3g; Wed, 02 Jul 2025 08:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjN-0004It-QV
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:36 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjF-00026D-23
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:29 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2eacb421554so1272116fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459899; x=1752064699; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WwLn3WhHlvytYPJIhgkaCdKN0x2bjUBia0lEYjEMXSA=;
 b=Dltj1ZJ7/pyH75O3zYGrn5JEk5TIUEmooRHQ6P0KA2KFItYS1uidOHK2hb9y3+Zzch
 pPBF1aOqZ9pTTXHiIvB/a32Zdt8sQEbBH/xh2ZnrKoQf3jcSENCDAz7rcO/6TPveQLKn
 CHf8plSr+dc+fc9kTZwCgBfraJ2Xtm8leiHitVsP891aO5jYr7IDhUTqioe91RsuZja+
 2SdGOLx+wKduTynb8+F757KJz+d7l8tTqCIVvN2KH2QBL69SEZA+KFN0cOsINegQs76I
 oExijX2eAn1nnUUaXey+G8H/IPyrhSUA8vUg5/ymHdo2SuNj50n3fUmqSE1zOO8cG55H
 XRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459899; x=1752064699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WwLn3WhHlvytYPJIhgkaCdKN0x2bjUBia0lEYjEMXSA=;
 b=L6qB21SfMjQU3y7OWKAiSLqvrjHaSn/7ph5c6DsKZA7/Dds3q6SHfd64bhgGF6iTWT
 VBbaOJcGHcXoDacfSU+Fm3nveyfDRzyqEllLcm7cCbKWqirnm5JZU5C8OhXL0RhbBnFM
 iWZGyvodKl4Xt2jCJZi2xRO2ZaoNy6D831AHH/p4W8bQGjuYtU6I2Ct7wQMzcip7HduG
 9tTjjnQK4ykvVvDC8BcG/kIECgdMQWB1GXO3Sy057fl01oM6TBuNn7/Humd4eTKQmrmG
 MwcH0WnBvQbN7FiilmB9YMKup4rHrHFQy/At1FYzNohx9oGQfku1cx21YicvWWmnCxsi
 V5HA==
X-Gm-Message-State: AOJu0Yz59cnXV/kgi22dCuOfobZ0cWE4sfeIyhuP9+kP+BDeVMhhiFT2
 2tJo8KSTfqIY7+0mpFh3RsRZ879P6iA9B5tdRp3+LL1aUAovoDdtSXjQWkyTsHFrKHfd/Nmff4H
 zGvX2aow=
X-Gm-Gg: ASbGncumKoDp/wwLk/26PsR5kGkabc26rPcUxN3yToqHsW+5qAaoGrcDatab/3AZR/7
 ifBHZ4pjLUZOjNFHqnoVlGtjpKH018FfOSQ0o6fr9EnAqkUuHdGvvORxrp/dBzWSOiBueqFRo1p
 fJ0Pv7c06YUAvGLB/ibd8eVSdk+VofU5ERO4cv8WdcSQCnDO3mOxYVSzSjzG8v3A7gLncprlZl8
 f9MmMxoaF4nQEd7bkvoQmGfm4T7hxrnYzYJf/MbtaRSVir+HPEfOfSV64DeNnovsYDPFw7pim8c
 w3n2WjLqjhrdtqKgSAnSl5DpbDFHlzX2TFIwZS3+zRBZxKZH6xXQLbVhJDQurp5LovSDtw==
X-Received: by 2002:a05:6870:a1a8:b0:2d4:ce45:6993 with SMTP id
 586e51a60fabf-2f5c7d80446mr2144549fac.30.1751459899370; 
 Wed, 02 Jul 2025 05:38:19 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 53/97] target/arm: Move do_urshr, do_srshr to vec_internal.h
Date: Wed,  2 Jul 2025 06:33:26 -0600
Message-ID: <20250702123410.761208-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x31.google.com
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
X-TUID: EnS05c7D7kOc

Unify two copies of these inline functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_internal.h | 21 +++++++++++++++++++++
 target/arm/tcg/mve_helper.c   | 21 ---------------------
 target/arm/tcg/sve_helper.c   | 21 ---------------------
 3 files changed, 21 insertions(+), 42 deletions(-)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index a1c10c60a1..5efd257c50 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -230,6 +230,27 @@ int64_t do_sqrdmlah_d(int64_t, int64_t, int64_t, bool, bool);
 #define do_usat_h(val)  MIN(MAX(val, 0), UINT16_MAX)
 #define do_usat_s(val)  MIN(MAX(val, 0), UINT32_MAX)
 
+static inline uint64_t do_urshr(uint64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else if (sh == 64) {
+        return x >> 63;
+    } else {
+        return 0;
+    }
+}
+
+static inline int64_t do_srshr(int64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else {
+        /* Rounding the sign bit always produces 0. */
+        return 0;
+    }
+}
+
 /**
  * bfdotadd:
  * @sum: addend
diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 506d1c3475..b9b2faa3a7 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -2164,27 +2164,6 @@ DO_VSHLL_ALL(vshllt, true)
     DO_VSHRN(OP##tb, true, 1, uint8_t, 2, uint16_t, FN)         \
     DO_VSHRN(OP##th, true, 2, uint16_t, 4, uint32_t, FN)
 
-static inline uint64_t do_urshr(uint64_t x, unsigned sh)
-{
-    if (likely(sh < 64)) {
-        return (x >> sh) + ((x >> (sh - 1)) & 1);
-    } else if (sh == 64) {
-        return x >> 63;
-    } else {
-        return 0;
-    }
-}
-
-static inline int64_t do_srshr(int64_t x, unsigned sh)
-{
-    if (likely(sh < 64)) {
-        return (x >> sh) + ((x >> (sh - 1)) & 1);
-    } else {
-        /* Rounding the sign bit always produces 0. */
-        return 0;
-    }
-}
-
 DO_VSHRN_ALL(vshrn, DO_SHR)
 DO_VSHRN_ALL(vrshrn, do_urshr)
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index f9052f2164..0e59ad2262 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -2050,27 +2050,6 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
    when N is negative, add 2**M-1.  */
 #define DO_ASRD(N, M) ((N + (N < 0 ? ((__typeof(N))1 << M) - 1 : 0)) >> M)
 
-static inline uint64_t do_urshr(uint64_t x, unsigned sh)
-{
-    if (likely(sh < 64)) {
-        return (x >> sh) + ((x >> (sh - 1)) & 1);
-    } else if (sh == 64) {
-        return x >> 63;
-    } else {
-        return 0;
-    }
-}
-
-static inline int64_t do_srshr(int64_t x, unsigned sh)
-{
-    if (likely(sh < 64)) {
-        return (x >> sh) + ((x >> (sh - 1)) & 1);
-    } else {
-        /* Rounding the sign bit always produces 0. */
-        return 0;
-    }
-}
-
 DO_ZPZI(sve_asr_zpzi_b, int8_t, H1, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_h, int16_t, H1_2, DO_SHR)
 DO_ZPZI(sve_asr_zpzi_s, int32_t, H1_4, DO_SHR)
-- 
2.43.0

