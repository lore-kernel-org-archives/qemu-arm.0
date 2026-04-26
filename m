Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B362CFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:42:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjk-0008Kh-5d; Sun, 26 Apr 2026 09:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzji-0008FA-8D
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:26 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjf-0000DB-M9
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:25 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2b2589c26e3so87798835ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210882; x=1777815682; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NyU4A+u0K627SpCWSf5AVXl3t/Ptjy14KhSD0YCWd3c=;
 b=IWZzAs3c9o8RDhmFXsGeSaw5NQ6ankOjEPC7USN6OyFr3xe2iDXkME0+hOJbeX7ZM2
 DEcs7dSkLHQPPYurt4TcWMPMXY8hZlD3BYhZL3AfiySwtEoThK3AyWotYru1MPh2yXxq
 YHKHyhQCDM7CfSwJlxylxAOI3hUbr1Itzg4Zh0Br8y1Q5168kwsRil+48mYt3t253deB
 w5XKth8R9abocOesZAhvoP9OUQHQJSfWSFSJnA9UELLOgnHUHK3v9KM8DsVYA3U49rzC
 OjFJV8NFBhvOUEDkkalhQMNMQOo+G41xVHIld5K7PWP+ibI3mhwowInajNzpG8cbVRe/
 0IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210882; x=1777815682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NyU4A+u0K627SpCWSf5AVXl3t/Ptjy14KhSD0YCWd3c=;
 b=jB/6IgUGJm0wDpL7dPq5PwUkDM+Sw+mJTXTLiTxMwNCXecQ8mu2U62Sfo/yWlqfZxO
 AliOB6D3+x869TzxR2cpvPFHozI0/DPfSDHNSKCv+ZI9llTjDyyRd3W8H43mpGpyzj/d
 wZlS3X1naQs23dSdkYNOvtUSW1Xmk2tOBnhy05lsYZ1MbEEVN3xITSwEuZNOMAnzFOus
 4rJNMafypTNOFeNaPqv6gALFHalDZOU2xqEJ6YoHetZeO14xG3fEVl9zxktvehNrW80s
 27lcyNTZSYLF79LDQbVvlTeh2pfOgnk1P/w+G7lZoQOQpR2p70tqZgnbBWGCymL4qDcY
 GQnA==
X-Gm-Message-State: AOJu0YyjFiDEpVaxu7LG5GhzpNTp49MwUjf5j11TzI9g9mIhRAYnBGra
 dxeymzVsXZZ7HkDm6Hm6/MB4STK0c1Bs+edWvpTA9vPZ0Joc9n81C9YH6fhga8qqyUiZMMrF65c
 a1DMfRfU=
X-Gm-Gg: AeBDiet4kZNnAPJG27CzlFOZiovHtifgZYgpHtISkAySSPdbrFhX+sKNYyL7lzq1KxR
 h4QgJ5oGGhtdRG1zChtdi+bFcaGID50Pzv+/O7hJKFZ+1s8uPhW2wNJMuv4N6Wc6AW2SgFLz2F1
 fjMYGYwlZ+DRRxgO36hKOjLHHsr9ukLZDcu9C3fwGAOMF8ZYGZzgdAtJ9hH3iZYtR0SNrfzt/GC
 gXhn7E2+19oRYM10+jHrUflvccvtnYQQ3I/AJLfWseXDaKlOSvQI+SlP4OaV+tr++/wEilomrv/
 eb+DpOPpFpmD1stJW/aF5tg8OQK6UvqDIW5C1od4qE1YAJouxW4qzKsPrlOS6EUTV8kplTrbGcz
 0blCxfHynGZDa2d3vVxBkmNdx/Rko7UxB0zfyczZjDnUFbRQprmKm5eBIN0JcUZ2AlbDOzFjC1v
 46kXMyH5zbbz392HY0tjO0Wh1UkL/TuB+ftJORTEFqwDHMFcTjzaw=
X-Received: by 2002:a17:903:1cb:b0:2b4:5dad:2523 with SMTP id
 d9443c01a7336-2b5fa003d32mr418467575ad.35.1777210881931; 
 Sun, 26 Apr 2026 06:41:21 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 28/84] fpu: Drop parts_float_to_float
Date: Sun, 26 Apr 2026 23:39:05 +1000
Message-ID: <20260426134002.865628-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Use parts{64,128}_float_to_float at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6a38d161f7..b1c2f884fc 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2695,9 +2695,6 @@ static void parts128_float_to_float(FloatParts128 *a, float_status *s)
     }
 }
 
-#define parts_float_to_float(P, S) \
-    PARTS_GENERIC_64_128(float_to_float, P)(P, S)
-
 static void parts_float_to_float_narrow(FloatParts64 *a, FloatParts128 *b,
                                         float_status *s)
 {
@@ -2744,7 +2741,7 @@ float8_e4m3 float4_e2m1_to_float8_e4m3(float4_e2m1 a, float_status *s)
     FloatParts64 p;
 
     float4_e2m1_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float8_e4m3_round_pack_canonical(&p, s, false);
 }
 
@@ -2753,7 +2750,7 @@ bfloat16 float8_e4m3_to_bfloat16(float8_e4m3 a, float_status *s)
     FloatParts64 p;
 
     float8_e4m3_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return bfloat16_round_pack_canonical(&p, s);
 }
 
@@ -2762,7 +2759,7 @@ bfloat16 float8_e5m2_to_bfloat16(float8_e5m2 a, float_status *s)
     FloatParts64 p;
 
     float8_e5m2_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return bfloat16_round_pack_canonical(&p, s);
 }
 
@@ -2772,7 +2769,7 @@ float32 float16_to_float32(float16 a, bool ieee, float_status *s)
     FloatParts64 p;
 
     float16a_unpack_canonical(&p, a, s, fmt16);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float32_round_pack_canonical(&p, s);
 }
 
@@ -2782,7 +2779,7 @@ float64 float16_to_float64(float16 a, bool ieee, float_status *s)
     FloatParts64 p;
 
     float16a_unpack_canonical(&p, a, s, fmt16);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float64_round_pack_canonical(&p, s);
 }
 
@@ -2791,7 +2788,7 @@ float8_e4m3 float32_to_float8_e4m3(float32 a, bool saturate, float_status *s)
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float8_e4m3_round_pack_canonical(&p, s, saturate);
 }
 
@@ -2811,7 +2808,7 @@ float16 float32_to_float16(float32 a, bool ieee, float_status *s)
 
     float32_unpack_canonical(&p, a, s);
     if (ieee) {
-        parts_float_to_float(&p, s);
+        parts64_float_to_float(&p, s);
         fmt = &float16_params;
     } else {
         parts_float_to_ahp(&p, s);
@@ -2826,7 +2823,7 @@ soft_float32_to_float64(float32 a, float_status *s)
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float64_round_pack_canonical(&p, s);
 }
 
@@ -2853,7 +2850,7 @@ float16 float64_to_float16(float64 a, bool ieee, float_status *s)
 
     float64_unpack_canonical(&p, a, s);
     if (ieee) {
-        parts_float_to_float(&p, s);
+        parts64_float_to_float(&p, s);
         fmt = &float16_params;
     } else {
         parts_float_to_ahp(&p, s);
@@ -2867,7 +2864,7 @@ float32 float64_to_float32(float64 a, float_status *s)
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float32_round_pack_canonical(&p, s);
 }
 
@@ -2876,7 +2873,7 @@ float8_e4m3 bfloat16_to_float8_e4m3(bfloat16 a, bool saturate, float_status *s)
     FloatParts64 p;
 
     bfloat16_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float8_e4m3_round_pack_canonical(&p, s, saturate);
 }
 
@@ -2894,7 +2891,7 @@ float32 bfloat16_to_float32(bfloat16 a, float_status *s)
     FloatParts64 p;
 
     bfloat16_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float32_round_pack_canonical(&p, s);
 }
 
@@ -2903,7 +2900,7 @@ float64 bfloat16_to_float64(bfloat16 a, float_status *s)
     FloatParts64 p;
 
     bfloat16_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return float64_round_pack_canonical(&p, s);
 }
 
@@ -2912,7 +2909,7 @@ bfloat16 float32_to_bfloat16(float32 a, float_status *s)
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return bfloat16_round_pack_canonical(&p, s);
 }
 
@@ -2921,7 +2918,7 @@ bfloat16 float64_to_bfloat16(float64 a, float_status *s)
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts64_float_to_float(&p, s);
     return bfloat16_round_pack_canonical(&p, s);
 }
 
@@ -2996,7 +2993,7 @@ float128 floatx80_to_float128(floatx80 a, float_status *s)
     FloatParts128 p;
 
     if (floatx80_unpack_canonical(&p, a, s)) {
-        parts_float_to_float(&p, s);
+        parts128_float_to_float(&p, s);
     } else {
         parts128_default_nan(&p, s);
     }
@@ -3028,7 +3025,7 @@ floatx80 float128_to_floatx80(float128 a, float_status *s)
     FloatParts128 p;
 
     float128_unpack_canonical(&p, a, s);
-    parts_float_to_float(&p, s);
+    parts128_float_to_float(&p, s);
     return floatx80_round_pack_canonical(&p, s);
 }
 
-- 
2.43.0


