Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3691FFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:47:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzit-0006xz-JA; Sun, 26 Apr 2026 09:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzin-0006tp-4f
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:31 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzil-0008Jv-1e
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:28 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2b299b3c739so42910255ad.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210824; x=1777815624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6wsmVd73VCzlO8AzrX6yswqohzZ2bXhumdtuV1u1Y8=;
 b=h14aDPIAlScXyBCdQycR3weMp+AnleutMlOiS1ro3rGfI+Q+CDctHsNUliBdbrSJ7g
 KNcMwjgWlYETNb3bgp2jqRPop4bfi3UfBqyprPiZLPJSMigpEqYDtk2cHbpUIEcXDNdT
 J5XRQFCIJxPgML7PZG4MaVMOp+2r9NY0OZ+4tdYgoF7LnHBivYp7WRdXjeyrAxS17Xur
 K+Q5yj6vgCz3hdvcgBFheLFdEnFpZSe80hmDZoqYessbD9yNUfUAMYXV1gybUr/Rm2xf
 11JfXcpfM4eqOyCVSB35zSKFyt7N+NOlsfrVB/o1yAOdalQ9tfP85e6G63MYYPqZfJTD
 jdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210824; x=1777815624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x6wsmVd73VCzlO8AzrX6yswqohzZ2bXhumdtuV1u1Y8=;
 b=X/i4jHNz1LajhNjBZlDzd1o32c54UwZ1M4V1VYm6x5psruTD4QmTrGwmWexvPKDmaD
 MXxXGJVlhhrhYwhPZa76Ej5f11PmrAaznNjfftYvMluIXLSCnJLBER5p0n0W9qu2P8cM
 uYogKIA56uQL46jA28wReiMWHbZpX27ebdbpgguI/EdPA1ysN+Zo9+/Cr/mqH/G2sxU5
 of0QA4qXmV9A4it1TVUexxBu94RkL1XsFyuLcJwDWdagVPG64Mj4re0pht5RkYP4Gj7Q
 tOgo+J/rjbly7Eoi1Wz1BEcmW9FWAryqoT+tbT88ivFPSU9FI6hWY5oD4tRzFOCziXcg
 xi+g==
X-Gm-Message-State: AOJu0YxXmR+hB+lN8UEjqyrfTyHaCrQzx8Hsk9oqw8oBpLwrfr4ZOqIJ
 tGkn9IyxUgQUhWvJyrT0sUPdDlVDEv9baAFRF32ZAVzcVC/+mwpJqs5+E9TmSOcpnQY=
X-Gm-Gg: AeBDiesEj9imk6LPS9S5/vw0FQh8OBiz8QXB9VElFPFdjUBaRW9vq3BZEM0spRdTUGL
 KsT2lP/Sv011lR00lm/yaNnxMIk6RnByHCpUtqVT0KJ9/ecaBrNrvjrLfTRDMvTgneU4PDTeu25
 A/bCpzEoJI+6+l2/K3G624Y2gp+nuk/VjtENcKHDaRzD1QdfS6T+OBZ4+Vgqg6Dd4VNiDh9bV0S
 1ikukJQuXbNkoQKyRjDXLxaGg7NRRNYKEtWP6EYuyZ9MNp7qaRkNF0QZ+EuWF1Hp0cM63tEDz7Y
 +kzrJtNhiI/OPC//uqoP0ZfnIoDPzdaW4GEY1rOhJ+unpCy3XG4CN3g22mlbNfw/1mNn5IGlzmu
 d7PJuNqZsWumzmVozi5zz9i+9V1xu+Nhig9/WCGp6LouhNm+bUURrO3P7dunOtLaEkeBHVHhuMf
 9TU+/7tUzTnAXWj76owQ0Kqry5m0jt6WVp0Wxyb0fa
X-Received: by 2002:a17:903:1a88:b0:2b0:5ec1:97c1 with SMTP id
 d9443c01a7336-2b5f9e85ceemr395971105ad.7.1777210824355; 
 Sun, 26 Apr 2026 06:40:24 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 06/84] fpu: Drop parts_return_nan
Date: Sun, 26 Apr 2026 23:38:43 +1000
Message-ID: <20260426134002.865628-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Use parts{64,128}_return_nan at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 17 ++++++-----------
 fpu/softfloat-parts.c.inc |  8 ++++----
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 571b5f09f3..50a625fd0a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,11 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static void parts64_return_nan(FloatParts64 *a, float_status *s);
-static void parts128_return_nan(FloatParts128 *a, float_status *s);
-
-#define parts_return_nan(P, S)     PARTS_GENERIC_64_128(return_nan, P)(P, S)
-
 static FloatParts64 *parts64_pick_nan(FloatParts64 *a, FloatParts64 *b,
                                       float_status *s);
 static FloatParts128 *parts128_pick_nan(FloatParts128 *a, FloatParts128 *b,
@@ -2831,7 +2826,7 @@ static void parts_float_to_e5m2(FloatParts64 *a, float_status *s, bool saturate)
     switch (a->cls) {
     case float_class_snan:
     case float_class_qnan:
-        parts_return_nan(a, s);
+        parts64_return_nan(a, s);
         break;
 
     case float_class_inf:
@@ -2858,7 +2853,7 @@ static void parts_float_to_e5m2(FloatParts64 *a, float_status *s, bool saturate)
 static void parts64_float_to_float(FloatParts64 *a, float_status *s)
 {
     if (is_nan(a->cls)) {
-        parts_return_nan(a, s);
+        parts64_return_nan(a, s);
     }
     if (a->cls == float_class_denormal) {
         float_raise(float_flag_input_denormal_used, s);
@@ -2868,7 +2863,7 @@ static void parts64_float_to_float(FloatParts64 *a, float_status *s)
 static void parts128_float_to_float(FloatParts128 *a, float_status *s)
 {
     if (is_nan(a->cls)) {
-        parts_return_nan(a, s);
+        parts128_return_nan(a, s);
     }
     if (a->cls == float_class_denormal) {
         float_raise(float_flag_input_denormal_used, s);
@@ -2896,7 +2891,7 @@ static void parts_float_to_float_narrow(FloatParts64 *a, FloatParts128 *b,
     case float_class_qnan:
         /* Discard the low bits of the NaN. */
         a->frac = b->frac_hi;
-        parts_return_nan(a, s);
+        parts64_return_nan(a, s);
         break;
     default:
         break;
@@ -2912,7 +2907,7 @@ static void parts_float_to_float_widen(FloatParts128 *a, FloatParts64 *b,
     frac_widen(a, b);
 
     if (is_nan(a->cls)) {
-        parts_return_nan(a, s);
+        parts128_return_nan(a, s);
     }
     if (a->cls == float_class_denormal) {
         float_raise(float_flag_input_denormal_used, s);
@@ -5474,7 +5469,7 @@ float32 float32_exp2(float32 a, float_status *status)
             break;
         case float_class_snan:
         case float_class_qnan:
-            parts_return_nan(&xp, status);
+            parts64_return_nan(&xp, status);
             return float32_round_pack_canonical(&xp, status);
         case float_class_inf:
             return xp.sign ? float32_zero : a;
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 0d4a63fbff..3bde254bfe 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -941,7 +941,7 @@ static void partsN(sqrt)(FloatPartsN *a, float_status *status,
             break;
         case float_class_snan:
         case float_class_qnan:
-            parts_return_nan(a, status);
+            partsN(return_nan)(a, status);
             return;
         case float_class_zero:
             return;
@@ -1263,7 +1263,7 @@ static void partsN(round_to_int)(FloatPartsN *a, FloatRoundMode rmode,
     switch (a->cls) {
     case float_class_qnan:
     case float_class_snan:
-        parts_return_nan(a, s);
+        partsN(return_nan)(a, s);
         break;
     case float_class_zero:
     case float_class_inf:
@@ -1735,7 +1735,7 @@ static void partsN(scalbn)(FloatPartsN *a, int n, float_status *s)
     switch (a->cls) {
     case float_class_snan:
     case float_class_qnan:
-        parts_return_nan(a, s);
+        partsN(return_nan)(a, s);
         break;
     case float_class_zero:
     case float_class_inf:
@@ -1770,7 +1770,7 @@ static void partsN(log2)(FloatPartsN *a, float_status *s, const FloatFmt *fmt)
             break;
         case float_class_snan:
         case float_class_qnan:
-            parts_return_nan(a, s);
+            partsN(return_nan)(a, s);
             return;
         case float_class_zero:
             float_raise(float_flag_divbyzero, s);
-- 
2.43.0


