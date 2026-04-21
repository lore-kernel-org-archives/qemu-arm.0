Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1503EA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:19:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Rx-0008Il-L0; Tue, 21 Apr 2026 01:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3Rf-00084d-Id
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:51 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RZ-0006Xy-E7
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:47 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so3584871a91.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748477; x=1777353277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Su7VYGRrcdszkKPYCMhXf5vTOdniXRif5U1SUu2ox64=;
 b=Imjm8jddpqnSNyBaUs9LOpOFT2cSqIeAV0Ys9u9RXSt+gq9J4x0fcwuZWq3vSRiaCe
 v7217yl+aed6Avy0osnEnoERlp45kgYGk+Y0B7YVLeeq96n4HmnLN0fyCUqqFVNA09Vi
 PS/VstQD5S8N8X7wk7Jx9CpOOHtqwTTkneftgyYuxM5YycSNSaiDyMglp2hhSKmmL5uq
 HPBxuA9Hr8jBiDqIMIYwgj2dO0UOqHDxAYKLDuo1cHijC++NpRt3NGaIbwVPiR9KLVq9
 i6KJarQ/j0rxG+HAHN73/YN+ErfViQ7pYA0WgUyniknawYVaWrJRpCUsYpMNVTxfBF7U
 7JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748477; x=1777353277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Su7VYGRrcdszkKPYCMhXf5vTOdniXRif5U1SUu2ox64=;
 b=oR8CPr1nxl6iTtXCucl3ordKDeu4gP3n4xampflsbpgJgbdynLQWoXOVW6KQwdkwfh
 Uz48JRSzJOuwMPSlWwQS9+bfUfkcPAnPCf1fb+W2PTqjDwi/rhIBAz92MGJzsLK3hYSa
 85Ij0Yn3F/zdGMBj9T+NoY1ztCmtfbU8joFg5EWUAwPZNoiUefUe+f2owgsnYp4gkhhV
 AfK4GJQ12R6h7C2LSrryRA2xMb99dtUv2YpUlE65ZoWcpwWtMb+hB4dmFyQxJoH16whu
 b1Z0XiYpT4wPkqfbRHf+uO2pjAlelX9IKuy0k8PRe96p5mGOpXr2G0WeDJhfF9/MKPji
 rmeQ==
X-Gm-Message-State: AOJu0YxJQ5LWWy29vnROx5g1x7UWQ3XfHGB1npNamFavzukdo0XCd5RG
 rN3iUwWHagrGQkk2IOGkiDqegK+ZNQDM/Ioz5Me/7Ghkh9ux14ffqCdWItdHWz1LB2sKr3nZvUZ
 sA4A2bXo=
X-Gm-Gg: AeBDietwLxWTYydC4XsprQDRJlWdonqUxB8zfC1419gGqpy5erf9Ap/ZhUFzLQfpg/U
 hyVCX+CL7ZYoOBvfG6TcSkwNwjZWhITX0HHhjHtnPg3r98UL6Kb2chYemqlv1ciEomlhR+xwlJM
 ojaxtg742ftXW/eCLne4KRTaDXtN6vQQmB22foN5cID93sTqUJfctEkPtcQGNDz9wVbdOiStYgD
 X9ndTwgIIQh12QzbrQi2yBIfi5YV0LlyJkllU1h4OdcT8wxAqHS0+Ygl2ZB9PxUiW/Wnk/HF2kF
 0c/sIf1QLc00V8ct+lMF3WNN55DgmKNmUI2977as5S6M3ZE3qDyD/wfIXEHBDFlo1GL+H84uT+1
 RajFuCEyVIaHvXbU4w8VM7Ya3ewFwuRUbOx+Zb7xSL9Q7WDBh1I1okaBd9nFVX075Jlt348nkQ8
 C/yfGaQGJLpgMicWwICexoZhABR5dioZ8v7kzOJXK+J/01Au/ok2A=
X-Received: by 2002:a17:90b:2d8c:b0:35b:93d8:6aaa with SMTP id
 98e67ed59e1d1-3614048b3f5mr15922589a91.19.1776748477071; 
 Mon, 20 Apr 2026 22:14:37 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/37] fpu: Add scalbn argument to fp8 conversion routines
Date: Tue, 21 Apr 2026 15:13:28 +1000
Message-ID: <20260421051346.41106-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

All Arm fp8 conversions have a power-of-2 scaling factor.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h | 16 ++++++++++------
 fpu/softfloat.c         | 35 +++++++++++++++++++++--------------
 2 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 8389a07b04..6f86848b7e 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -195,13 +195,17 @@ float128 uint128_to_float128(Int128, float_status *status);
 
 float8_e4m3 float4_e2m1_to_float8_e4m3(float4_e2m1, float_status *status);
 
-bfloat16 float8_e4m3_to_bfloat16(float8_e4m3, float_status *status);
-float8_e4m3 bfloat16_to_float8_e4m3(bfloat16, bool sat, float_status *status);
-float8_e4m3 float32_to_float8_e4m3(float32, bool sat, float_status *status);
+bfloat16 float8_e4m3_to_bfloat16(float8_e4m3, int scale, float_status *status);
+float8_e4m3 bfloat16_to_float8_e4m3(bfloat16, int scale,
+                                    bool sat, float_status *status);
+float8_e4m3 float32_to_float8_e4m3(float32, int scale,
+                                   bool sat, float_status *status);
 
-bfloat16 float8_e5m2_to_bfloat16(float8_e5m2, float_status *status);
-float8_e5m2 bfloat16_to_float8_e5m2(bfloat16, bool sat, float_status *status);
-float8_e5m2 float32_to_float8_e5m2(float32, bool sat, float_status *status);
+bfloat16 float8_e5m2_to_bfloat16(float8_e5m2, int scale, float_status *status);
+float8_e5m2 bfloat16_to_float8_e5m2(bfloat16, int scale,
+                                    bool sat, float_status *status);
+float8_e5m2 float32_to_float8_e5m2(float32, int scale,
+                                    bool sat, float_status *status);
 
 /*----------------------------------------------------------------------------
 | Software half-precision conversion routines.
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 91c34307c8..bcec7d38c8 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2853,7 +2853,8 @@ static void parts_float_to_ahp(FloatParts64 *a, float_status *s)
     }
 }
 
-static void parts_float_to_e5m2(FloatParts64 *a, float_status *s, bool saturate)
+static void parts_float_to_e5m2(FloatParts64 *a, float_status *s,
+                                int scale, bool saturate)
 {
     switch (a->cls) {
     case float_class_snan:
@@ -2873,8 +2874,10 @@ static void parts_float_to_e5m2(FloatParts64 *a, float_status *s, bool saturate)
 
     case float_class_denormal:
         float_raise(float_flag_input_denormal_used, s);
-        break;
+        /* fall through */
     case float_class_normal:
+        a->exp += MIN(MAX(scale, -0x7f), 0x7f);
+        break;
     case float_class_zero:
         break;
     default:
@@ -2955,21 +2958,21 @@ float8_e4m3 float4_e2m1_to_float8_e4m3(float4_e2m1 a, float_status *s)
     return float8_e4m3_round_pack_canonical(&p, s, false);
 }
 
-bfloat16 float8_e4m3_to_bfloat16(float8_e4m3 a, float_status *s)
+bfloat16 float8_e4m3_to_bfloat16(float8_e4m3 a, int scale, float_status *s)
 {
     FloatParts64 p;
 
     float8_e4m3_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts_scalbn(&p, scale, s);
     return bfloat16_round_pack_canonical(&p, s);
 }
 
-bfloat16 float8_e5m2_to_bfloat16(float8_e5m2 a, float_status *s)
+bfloat16 float8_e5m2_to_bfloat16(float8_e5m2 a, int scale, float_status *s)
 {
     FloatParts64 p;
 
     float8_e5m2_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts_scalbn(&p, scale, s);
     return bfloat16_round_pack_canonical(&p, s);
 }
 
@@ -2993,21 +2996,23 @@ float64 float16_to_float64(float16 a, bool ieee, float_status *s)
     return float64_round_pack_canonical(&p, s);
 }
 
-float8_e4m3 float32_to_float8_e4m3(float32 a, bool saturate, float_status *s)
+float8_e4m3 float32_to_float8_e4m3(float32 a, int scale,
+                                   bool saturate, float_status *s)
 {
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts_scalbn(&p, scale, s);
     return float8_e4m3_round_pack_canonical(&p, s, saturate);
 }
 
-float8_e5m2 float32_to_float8_e5m2(float32 a, bool saturate, float_status *s)
+float8_e5m2 float32_to_float8_e5m2(float32 a, int scale,
+                                   bool saturate, float_status *s)
 {
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    parts_float_to_e5m2(&p, s, saturate);
+    parts_float_to_e5m2(&p, s, scale, saturate);
     return float8_e5m2_round_pack_canonical(&p, s, saturate);
 }
 
@@ -3078,21 +3083,23 @@ float32 float64_to_float32(float64 a, float_status *s)
     return float32_round_pack_canonical(&p, s);
 }
 
-float8_e4m3 bfloat16_to_float8_e4m3(bfloat16 a, bool saturate, float_status *s)
+float8_e4m3 bfloat16_to_float8_e4m3(bfloat16 a, int scale,
+                                    bool saturate, float_status *s)
 {
     FloatParts64 p;
 
     bfloat16_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts_scalbn(&p, scale, s);
     return float8_e4m3_round_pack_canonical(&p, s, saturate);
 }
 
-float8_e5m2 bfloat16_to_float8_e5m2(bfloat16 a, bool saturate, float_status *s)
+float8_e5m2 bfloat16_to_float8_e5m2(bfloat16 a, int scale,
+                                    bool saturate, float_status *s)
 {
     FloatParts64 p;
 
     bfloat16_unpack_canonical(&p, a, s);
-    parts_float_to_e5m2(&p, s, saturate);
+    parts_float_to_e5m2(&p, s, scale, saturate);
     return float8_e5m2_round_pack_canonical(&p, s, saturate);
 }
 
-- 
2.43.0


