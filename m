Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618C3FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:57:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGznD-0005Cd-01; Sun, 26 Apr 2026 09:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznA-0005Aw-KP
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:00 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzn8-000106-HC
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:00 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2b7d3ecc10dso14941785ad.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211097; x=1777815897; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRyWdsWWDBWhjEZurZCmmfQh5TH8x0OJuXWPwMpCiKw=;
 b=e6w9dCACOVfjK+FffcTQWYsde08GhMJCkv9wikHPM1hGClOhu1aKG1ObhJeyvl2KGt
 2Ryz8IMeIA4saLlleYOgIPnKAeSRgv0s0eSsdfBH55zw4ax71MWt0gZt237GLJrrP6fw
 9UJdRKYSKebSennIwKpNBYjh3DubcEriqYVfftM8b/tSjymvYccl6FrWUlY9C1KLyxKH
 l2TCAsFGaGza735B2F9vTIAhSqFB1rnETuTISALzUF3dLnCehycG1nxkIAe2F8EFToch
 67/DVvtifeZFLoUM/YL/MvkE5myoSqHuMJSZQ8ytRH6m2KnDpyQM1HqZJ25JKTv/0a7b
 i3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211097; x=1777815897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XRyWdsWWDBWhjEZurZCmmfQh5TH8x0OJuXWPwMpCiKw=;
 b=M63eO+RyE9QKoBWeZ75v/ACoi38vJTgHr9OrlVfNR3Ie7lVJvTX6VZ2d4F9NP9OFI+
 kHE919bfrz9h0HtUDprKPvexlyfYyjyFHe+3wNnqEAyRVgByLlSq6/X7Bo4al4OetE8I
 hDwpsn799T3iGphsLwf0fVLNHbSvx9a83f2AMt7gQPZTRXKi2RolnS3A0X4ttT6vYjhL
 idrpuHYR4AjTa0zMwKLSmNIIBAfgAWuSyZPbMl5HSIfmel8I0kDo15C6U2xa1zduRC3k
 WRYQRNrr8xfkOkq0Z+XSFGB9u50ch9Seuj3l4dplOjVS+rPcoht+yXYTxhmli5NDFov6
 OAng==
X-Gm-Message-State: AOJu0YyKDaVWURGN0JjxSgobZkcou7ujDvRNEzCzsCL/QkA7Z2bdyJR7
 mvJsKgQcr5uqEamVKuZz8PAchOOXSEWRE+LlcJqbM1WhZkygdJMmss34/5bfgNxTP6HiykJYouM
 i/oOVHEM=
X-Gm-Gg: AeBDiet1Ool60Zfu3URG6Vf5F/Vr5qjznebtu0FBvMcI9atBHVduilXMzoOn1kWD5rR
 xBrxPrsT/JtqoUl7iD9JfDqQRPKV/4I5hCY2jD0sMCJru2xX/hPmEXgkXiRixqnfapa2lj2rFiu
 BURHoi71LDTLOE3NAI1/pOJNFVXZI6tcxAfqrv/1de0eKVKr+qGScbQ9a+tI737umSweoaWo85h
 UWY3Pzx0jkG0t5N270oPE0DsXQD+PF7sUnrsj2U8pyqcZkYNvDvvUhtfd7f4hE4KaCyAu53Btoy
 JBQ+8bJK96SUCn3cU8lJgp9+2CGKbZlJJw0LhT+Djl0V/ulQ3XZttKZ3X8n4qgdEnpAF2quTwav
 zF/PfYzY8sjQvhlihKxzM+n5ycSIHuJE30EhWF/N5ObgbzhPduGEdS7ppLNQ/PbIGtRKC+xtan5
 j1wDSRNM0pWRztDqSR4tS/36D6NYwx0BSOE9tgIpZP
X-Received: by 2002:a17:903:17cb:b0:2b2:67cd:9963 with SMTP id
 d9443c01a7336-2b5f9fd5c04mr397208345ad.38.1777211097069; 
 Sun, 26 Apr 2026 06:44:57 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:44:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 40/84] fpu: Return struct from bfloat16_unpack_canonical
Date: Sun, 26 Apr 2026 23:39:17 +1000
Message-ID: <20260426134002.865628-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 108 +++++++++++++++++-------------------------------
 1 file changed, 37 insertions(+), 71 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 566154a729..19cca8fb85 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1482,11 +1482,11 @@ static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
     return float16a_unpack_canonical(f, s, &float16_params);
 }
 
-static void bfloat16_unpack_canonical(FloatParts64 *p, bfloat16 f,
-                                      float_status *s)
+static FloatParts64 bfloat16_unpack_canonical(bfloat16 f, float_status *s)
 {
-    *p = unpack_raw64(&bfloat16_params, f);
-    parts64_canonicalize(p, s, &bfloat16_params);
+    FloatParts64 p = unpack_raw64(&bfloat16_params, f);
+    parts64_canonicalize(&p, s, &bfloat16_params);
+    return p;
 }
 
 static float8_e4m3 float8_e4m3_round_pack_canonical(FloatParts64 *p,
@@ -1873,11 +1873,9 @@ float64 float64r32_sub(float64 a, float64 b, float_status *status)
 static bfloat16 QEMU_FLATTEN
 bfloat16_addsub(bfloat16 a, bfloat16 b, float_status *status, bool subtract)
 {
-    FloatParts64 pa, pb, *pr;
-
-    bfloat16_unpack_canonical(&pa, a, status);
-    bfloat16_unpack_canonical(&pb, b, status);
-    pr = parts64_addsub(&pa, &pb, status, subtract);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 *pr = parts64_addsub(&pa, &pb, status, subtract);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -2013,11 +2011,9 @@ float64 float64r32_mul(float64 a, float64 b, float_status *status)
 bfloat16 QEMU_FLATTEN
 bfloat16_mul(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa, pb, *pr;
-
-    bfloat16_unpack_canonical(&pa, a, status);
-    bfloat16_unpack_canonical(&pb, b, status);
-    pr = parts64_mul(&pa, &pb, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 *pr = parts64_mul(&pa, &pb, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -2276,12 +2272,10 @@ float64 float64r32_muladd(float64 a, float64 b, float64 c,
 bfloat16 QEMU_FLATTEN bfloat16_muladd(bfloat16 a, bfloat16 b, bfloat16 c,
                                       int flags, float_status *status)
 {
-    FloatParts64 pa, pb, pc, *pr;
-
-    bfloat16_unpack_canonical(&pa, a, status);
-    bfloat16_unpack_canonical(&pb, b, status);
-    bfloat16_unpack_canonical(&pc, c, status);
-    pr = parts64_muladd_scalbn(&pa, &pb, &pc, 0, flags, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 pc = bfloat16_unpack_canonical(c, status);
+    FloatParts64 *pr = parts64_muladd_scalbn(&pa, &pb, &pc, 0, flags, status);
 
     /* Round before applying negate result. */
     parts64_uncanon(pr, status, &bfloat16_params, false);
@@ -2418,11 +2412,9 @@ float64 float64r32_div(float64 a, float64 b, float_status *status)
 bfloat16 QEMU_FLATTEN
 bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
 {
-    FloatParts64 pa, pb, *pr;
-
-    bfloat16_unpack_canonical(&pa, a, status);
-    bfloat16_unpack_canonical(&pb, b, status);
-    pr = parts64_div(&pa, &pb, status);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, status);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, status);
+    FloatParts64 *pr = parts64_div(&pa, &pb, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -2791,36 +2783,32 @@ float32 float64_to_float32(float64 a, float_status *s)
 
 float8_e4m3 bfloat16_to_float8_e4m3(bfloat16 a, bool saturate, float_status *s)
 {
-    FloatParts64 p;
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
 
-    bfloat16_unpack_canonical(&p, a, s);
     parts64_float_to_float(&p, s);
     return float8_e4m3_round_pack_canonical(&p, s, saturate);
 }
 
 float8_e5m2 bfloat16_to_float8_e5m2(bfloat16 a, bool saturate, float_status *s)
 {
-    FloatParts64 p;
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
 
-    bfloat16_unpack_canonical(&p, a, s);
     parts_float_to_e5m2(&p, s, saturate);
     return float8_e5m2_round_pack_canonical(&p, s, saturate);
 }
 
 float32 bfloat16_to_float32(bfloat16 a, float_status *s)
 {
-    FloatParts64 p;
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
 
-    bfloat16_unpack_canonical(&p, a, s);
     parts64_float_to_float(&p, s);
     return float32_round_pack_canonical(&p, s);
 }
 
 float64 bfloat16_to_float64(bfloat16 a, float_status *s)
 {
-    FloatParts64 p;
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
 
-    bfloat16_unpack_canonical(&p, a, s);
     parts64_float_to_float(&p, s);
     return float64_round_pack_canonical(&p, s);
 }
@@ -2982,9 +2970,8 @@ float64 float64_round_to_int(float64 a, float_status *s)
 
 bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
 {
-    FloatParts64 p;
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
 
-    bfloat16_unpack_canonical(&p, a, s);
     parts64_round_to_int(&p, s->float_rounding_mode, 0, s, &bfloat16_params);
     return bfloat16_round_pack_canonical(&p, s);
 }
@@ -3100,36 +3087,28 @@ int64_t float64_to_int64_scalbn(float64 a, FloatRoundMode rmode, int scale,
 int8_t bfloat16_to_int8_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
                                float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
     return parts64_float_to_sint(&p, rmode, scale, INT8_MIN, INT8_MAX, s);
 }
 
 int16_t bfloat16_to_int16_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
                                  float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
     return parts64_float_to_sint(&p, rmode, scale, INT16_MIN, INT16_MAX, s);
 }
 
 int32_t bfloat16_to_int32_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
                                  float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
     return parts64_float_to_sint(&p, rmode, scale, INT32_MIN, INT32_MAX, s);
 }
 
 int64_t bfloat16_to_int64_scalbn(bfloat16 a, FloatRoundMode rmode, int scale,
                                  float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
     return parts64_float_to_sint(&p, rmode, scale, INT64_MIN, INT64_MAX, s);
 }
 
@@ -3590,36 +3569,28 @@ uint64_t float64_to_uint64_scalbn(float64 a, FloatRoundMode rmode, int scale,
 uint8_t bfloat16_to_uint8_scalbn(bfloat16 a, FloatRoundMode rmode,
                                  int scale, float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
     return parts64_float_to_uint(&p, rmode, scale, UINT8_MAX, s);
 }
 
 uint16_t bfloat16_to_uint16_scalbn(bfloat16 a, FloatRoundMode rmode,
                                    int scale, float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
     return parts64_float_to_uint(&p, rmode, scale, UINT16_MAX, s);
 }
 
 uint32_t bfloat16_to_uint32_scalbn(bfloat16 a, FloatRoundMode rmode,
                                    int scale, float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
     return parts64_float_to_uint(&p, rmode, scale, UINT32_MAX, s);
 }
 
 uint64_t bfloat16_to_uint64_scalbn(bfloat16 a, FloatRoundMode rmode,
                                    int scale, float_status *s)
 {
-    FloatParts64 p;
-
-    bfloat16_unpack_canonical(&p, a, s);
+    FloatParts64 p = bfloat16_unpack_canonical(a, s);
     return parts64_float_to_uint(&p, rmode, scale, UINT64_MAX, s);
 }
 
@@ -4296,11 +4267,9 @@ static float16 float16_minmax(float16 a, float16 b, float_status *s, int flags)
 static bfloat16 bfloat16_minmax(bfloat16 a, bfloat16 b,
                                 float_status *s, int flags)
 {
-    FloatParts64 pa, pb, *pr;
-
-    bfloat16_unpack_canonical(&pa, a, s);
-    bfloat16_unpack_canonical(&pb, b, s);
-    pr = parts64_minmax(&pa, &pb, s, flags);
+    FloatParts64 pa = bfloat16_unpack_canonical(a, s);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, s);
+    FloatParts64 *pr = parts64_minmax(&pa, &pb, s, flags);
 
     return bfloat16_round_pack_canonical(pr, s);
 }
@@ -4496,10 +4465,9 @@ FloatRelation float64_compare_quiet(float64 a, float64 b, float_status *s)
 static FloatRelation QEMU_FLATTEN
 bfloat16_do_compare(bfloat16 a, bfloat16 b, float_status *s, bool is_quiet)
 {
-    FloatParts64 pa, pb;
+    FloatParts64 pa = bfloat16_unpack_canonical(a, s);
+    FloatParts64 pb = bfloat16_unpack_canonical(b, s);
 
-    bfloat16_unpack_canonical(&pa, a, s);
-    bfloat16_unpack_canonical(&pb, b, s);
     return parts64_compare(&pa, &pb, s, is_quiet);
 }
 
@@ -4587,9 +4555,8 @@ float64 float64_scalbn(float64 a, int n, float_status *status)
 
 bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
 {
-    FloatParts64 p;
+    FloatParts64 p = bfloat16_unpack_canonical(a, status);
 
-    bfloat16_unpack_canonical(&p, a, status);
     parts64_scalbn(&p, n, status);
     return bfloat16_round_pack_canonical(&p, status);
 }
@@ -4711,9 +4678,8 @@ float64 float64r32_sqrt(float64 a, float_status *status)
 
 bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
 {
-    FloatParts64 p;
+    FloatParts64 p = bfloat16_unpack_canonical(a, status);
 
-    bfloat16_unpack_canonical(&p, a, status);
     parts64_sqrt(&p, status, &bfloat16_params);
     return bfloat16_round_pack_canonical(&p, status);
 }
-- 
2.43.0


