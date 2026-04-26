Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C9DFF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:47:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzit-0006xU-0c; Sun, 26 Apr 2026 09:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGziY-0006kV-U4
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:16 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGziW-0008F7-Vx
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:14 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2b25cf1b5f0so51268375ad.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210811; x=1777815611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKtv+p36Hy41OyLkt25kLH4CmBx913v33ogitpjaG94=;
 b=iluiijfz9KXD3wweyOpHYNQw9bD/u8u3WyvW87JCfLjMvNUGGp8z3JpLE8w7l+a7/U
 4PtJOSP7wnWxWv2u065xUHI4jRkcKRfdZg2L5e00QlzckxHk9Pu8b00oE4uZNiYoCahK
 Lz2eso94fKcqHG4PRuTax39MXohnJh3weox9Zh2qZ863JSee+No+131G5wzSZgvvuXNA
 /UxQPgk9pyo/glc3+dpz4ior16U8KHs8CJTokgNGLAd61yViBjUllzqDPLGNT4NaqJuM
 +BkNLeDZnWgA+7ce5O0oWftpFFt7M3+AtLjULG7gKUASGBXNCwrGVsZ3A+e1m34wTUY8
 YS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210811; x=1777815611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PKtv+p36Hy41OyLkt25kLH4CmBx913v33ogitpjaG94=;
 b=aFYGUUgGzwv8c2YEut2//PinwLwzuHQxfjf7y7hqamqEhIiznhw82qzdXYxHE6iNjN
 bA6q+5ViA97VUpSUMwqpEjHbeV2o5FyTc9FTMYtArtzuTFyVUGkkMCir9uMghMFJSYLu
 HSpP3zIFFNiJqIBqG2XP3F9ZxXdx+otkoF2dCtA7nelBFbfxSwRsqifpZCbOsvfErO8f
 Lftfd1Umecv67f6IVzclS1tQUCkJ8bsu/UKIdFZZzT/WYj0fE9PM0rJFqGscNX9TeJjN
 iwtbOxRogKRWKX25P84BTO3fLzT44+jEP0QlMZPZGsJcw7JrqyyiIKmLrHVd3vMUtRYE
 HqjA==
X-Gm-Message-State: AOJu0YzO2ZCzU0BjiOLqRRxm2w2mrFo3vk9yX16mEReDD/6SlwQqBHLp
 cuwC1RbSiaNdEVFS88ntOX13wSxnL4+2ssk6ct9rggmNF7xLdpi0hIyuaxzwS2wgCG0=
X-Gm-Gg: AeBDiev5OGH5VOhXlWorQghq3k4GSTCA9UKERAKweyuiu4r8eF1V/3D5GPIrp4+8NlR
 3WHfWMrtA9rwaVRY5Yx8+QUbVJ62jEMrOm5AfTvTsVqivsetAIJVfVsjWaGR3LuVW3t5QP6CKs/
 GYB5AF1p98hBQzxpS8E5GHbpvdRnvSfett0HkiYa79tbTZ5e0oCU9rvJHYKnC0PRABvAEuq25DA
 0ExPTNqadiwOHopa+hr2Ye1pO2+IsKfWTmO2xY0kmd9TpE1BzM0BkoxH3dMnX/Z+WsE62w+Yb2P
 tGZZ73ccOTB02zHGgospSLOO5lUy4arO4xGmHi8HpFuRo+4g7utnegTJaUAhJ+F5Axk1RBXD8Bh
 lUs6l7N2loh1JvKTaUhYE7xI3Y+Rt/FHbMMxX11WGqyjEBrJLUwc45Kdo22yO/Ab36J4QLl0iDh
 t3vu6vUpzl27GwjXco3efUPfP11tSnLqsumQmbpfO8
X-Received: by 2002:a17:903:1a4e:b0:2b0:4aeb:dedc with SMTP id
 d9443c01a7336-2b5f9f1c60cmr397206465ad.26.1777210811416; 
 Sun, 26 Apr 2026 06:40:11 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 01/84] fpu: Drop parts_canonicalize
Date: Sun, 26 Apr 2026 23:38:38 +1000
Message-ID: <20260426134002.865628-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Use the specific parts{64,12}_canonicalize at each site.
Drop the forward declarations.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 91c34307c8..f9997f5236 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -806,14 +806,6 @@ static FloatParts128 *parts128_pick_nan_muladd(FloatParts128 *a,
 #define parts_pick_nan_muladd(A, B, C, S, ABM, ABCM) \
     PARTS_GENERIC_64_128(pick_nan_muladd, A)(A, B, C, S, ABM, ABCM)
 
-static void parts64_canonicalize(FloatParts64 *p, float_status *status,
-                                 const FloatFmt *fmt);
-static void parts128_canonicalize(FloatParts128 *p, float_status *status,
-                                  const FloatFmt *fmt);
-
-#define parts_canonicalize(A, S, F) \
-    PARTS_GENERIC_64_128(canonicalize, A)(A, S, F)
-
 static void parts64_uncanon_normal(FloatParts64 *p, float_status *status,
                                    const FloatFmt *fmt, bool saturate);
 static void parts128_uncanon_normal(FloatParts128 *p, float_status *status,
@@ -1723,28 +1715,28 @@ static void float4_e2m1_unpack_canonical(FloatParts64 *p, float4_e2m1 f,
                                          float_status *s)
 {
     float4_e2m1_unpack_raw(p, f);
-    parts_canonicalize(p, s, &float4_e2m1_params);
+    parts64_canonicalize(p, s, &float4_e2m1_params);
 }
 
 static void float8_e4m3_unpack_canonical(FloatParts64 *p, float8_e4m3 f,
                                          float_status *s)
 {
     float8_e4m3_unpack_raw(p, f);
-    parts_canonicalize(p, s, &float8_e4m3_params);
+    parts64_canonicalize(p, s, &float8_e4m3_params);
 }
 
 static void float8_e5m2_unpack_canonical(FloatParts64 *p, float8_e5m2 f,
                                          float_status *s)
 {
     float8_e5m2_unpack_raw(p, f);
-    parts_canonicalize(p, s, &float8_e5m2_params);
+    parts64_canonicalize(p, s, &float8_e5m2_params);
 }
 
 static void float16a_unpack_canonical(FloatParts64 *p, float16 f,
                                       float_status *s, const FloatFmt *params)
 {
     float16_unpack_raw(p, f);
-    parts_canonicalize(p, s, params);
+    parts64_canonicalize(p, s, params);
 }
 
 static void float16_unpack_canonical(FloatParts64 *p, float16 f,
@@ -1757,7 +1749,7 @@ static void bfloat16_unpack_canonical(FloatParts64 *p, bfloat16 f,
                                       float_status *s)
 {
     bfloat16_unpack_raw(p, f);
-    parts_canonicalize(p, s, &bfloat16_params);
+    parts64_canonicalize(p, s, &bfloat16_params);
 }
 
 static float8_e4m3 float8_e4m3_round_pack_canonical(FloatParts64 *p,
@@ -1801,7 +1793,7 @@ static void float32_unpack_canonical(FloatParts64 *p, float32 f,
                                      float_status *s)
 {
     float32_unpack_raw(p, f);
-    parts_canonicalize(p, s, &float32_params);
+    parts64_canonicalize(p, s, &float32_params);
 }
 
 static float32 float32_round_pack_canonical(FloatParts64 *p,
@@ -1815,7 +1807,7 @@ static void float64_unpack_canonical(FloatParts64 *p, float64 f,
                                      float_status *s)
 {
     float64_unpack_raw(p, f);
-    parts_canonicalize(p, s, &float64_params);
+    parts64_canonicalize(p, s, &float64_params);
 }
 
 static float64 float64_round_pack_canonical(FloatParts64 *p,
@@ -1878,7 +1870,7 @@ static void float128_unpack_canonical(FloatParts128 *p, float128 f,
                                       float_status *s)
 {
     float128_unpack_raw(p, f);
-    parts_canonicalize(p, s, &float128_params);
+    parts128_canonicalize(p, s, &float128_params);
 }
 
 static float128 float128_round_pack_canonical(FloatParts128 *p,
@@ -1910,7 +1902,7 @@ static bool floatx80_unpack_canonical(FloatParts128 *p, floatx80 f,
     floatx80_unpack_raw(p, f);
 
     if (likely(p->exp != floatx80_params[floatx80_precision_x].exp_max)) {
-        parts_canonicalize(p, s, &floatx80_params[floatx80_precision_x]);
+        parts128_canonicalize(p, s, &floatx80_params[floatx80_precision_x]);
     } else {
         /* The explicit integer bit is ignored, after invalid checks. */
         p->frac_hi &= MAKE_64BIT_MASK(0, 63);
@@ -5611,7 +5603,7 @@ static void parts_s390_divide_to_integer(FloatParts64 *a, FloatParts64 *b,
         parts_uncanon(r, status, fmt, false);
         r_flags = status->float_exception_flags;
         r->frac &= (1ULL << fmt->frac_size) - 1;
-        parts_canonicalize(r, status, fmt);
+        parts64_canonicalize(r, status, fmt);
 
         /* POp table "Results: DIVIDE TO INTEGER (Part 2 of 2)" */
         if (is_q_smallish) {
-- 
2.43.0


