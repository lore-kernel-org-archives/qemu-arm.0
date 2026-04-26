Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57885FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:54:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzoZ-00068v-Ai; Sun, 26 Apr 2026 09:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznZ-0005dV-DP
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:36 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznW-0001Ku-2E
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:23 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2ad617d5b80so54581485ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211121; x=1777815921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wY0NB6qgE+bAQHWWi7d8cQ7VHs8v7Rlo1nrFDJMYy0I=;
 b=Rv9YWQz6xo+qKxtv9+mVHnUMjaaZ9hdXSF0sqYBBmeZuc8l/r3zkQnrSdy4gBLc97i
 cGw7/cjkZFvoq+bWlcI6dPhwv8Is2/k1wrArLEdrmtvYiYuazfsZzhZqiMs0MZdtUp9p
 P7kmMO57zUbb30PRve1iYPunhF2dKVwutjOsElf3j2SGjp+5qI+cX0HeRdjQRB+EUKJl
 xlOt+yeMs1w9rJTvNHjXlCJAWe1smooVmrd24uwFL0OF3qi9c/xEOckr4AKE6k+Qzj7B
 5lAhrNRfMBDZsva+/tGpk0kQoXdXb7Gm7cQ9SovZiWIyvLHPosd5VnKMW+HdFuVVglKv
 ICBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211121; x=1777815921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wY0NB6qgE+bAQHWWi7d8cQ7VHs8v7Rlo1nrFDJMYy0I=;
 b=Ceo4np+1N2wWqFNPr98LsNp+WGh8r5bP0Yrn36nY8ZxpgUpZccsB7iKJUspvySSgPx
 2PDhxPqDW7r0J2NXx7ee+lDwJXKekLTxmHrCCGdStHCVxVVos6+lnuGy3BHg3zMhOM2W
 TYB0LGf9/1fFCS8KX+m51xz7+aEYov4/nKT3zsBs+7gZQmFXNj+8xxw6MmLSYG64FBNf
 7JSyzIW8HcIa2V2UQFnjuKnEhaYI951VxxDL74ElPECN5MJMn+lk5uOjZ+VKPrcWRJUy
 nJmWgzM0VbDUY0VaHjG1Q+TwRCvcYxkmZGITraFNsihb+2EDWwR1aloP1myRZhTFj0Us
 6h1A==
X-Gm-Message-State: AOJu0YxG46cibGD0rhgttIcLXyvAX7vJZOxLtkCHY/E25ewjEzRC4e6Q
 NOmLvH8w/z//Fhvro6M1SEJF8TCg+0Zzi4zQ5yH/yPsxBhGiPrOfVbHrV4MZ2sxjrjo=
X-Gm-Gg: AeBDievy+Di/ANyCsLt4Ky6jZPRNFhTiidIJ0BXUE5DmhG6ETVngqs1xnQOfnnD4XdC
 /I9Izvg/D/UFc8YPVIdGUgawDPNakh6+Z7nXkzSTSSKnm5uVh3vZTK0Kw2r5ySXOD44GMGpub5D
 rAHtHne3gH+7v4m1+J/TOwc7qvbpOiRS7VsngPhnpc67th68OxZI52tsnL5HM1L0TJzp9+i6oYx
 5V36abGaL8zFtAobPEbnlqNqHHI7P30PxL+mwUoxMrc2I3lX74I4sSdeAY/np2AGi+fQnnHv1zR
 t21kzgYNWPzCYYiUkkiQ6S4Y1nvD9hYkDsl/Ksmh7MIFQ8zu19OX9WaWyZs+X1fikZhd1CmOf12
 ebLoad/XeuFcwedq6xyrAADEdr0yQQuLEMihMTsa8shh5/2On6DrxorJ6/TyZj9Tg8qgzV1DLeC
 lycAgamGiN3qRYyE88BmRtbhPSb4dCVR0CePrrWyoy
X-Received: by 2002:a17:902:f98e:b0:2b2:481b:de5f with SMTP id
 d9443c01a7336-2b5f9e86057mr286214455ad.5.1777211117120; 
 Sun, 26 Apr 2026 06:45:17 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 47/84] fpu: Change parts_float_to_float_narrow to
 parts128_to_parts64
Date: Sun, 26 Apr 2026 23:39:24 +1000
Message-ID: <20260426134002.865628-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

Rename and return FloatParts64 structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 77585fa11f..99f0036d0d 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2563,29 +2563,31 @@ static void parts128_float_to_float(FloatParts128 *a, float_status *s)
     }
 }
 
-static void parts_float_to_float_narrow(FloatParts64 *a, FloatParts128 *b,
-                                        float_status *s)
+static FloatParts64 parts128_to_parts64(FloatParts128 *b, float_status *s)
 {
-    a->cls = b->cls;
-    a->sign = b->sign;
-    a->exp = b->exp;
+    FloatParts64 r = {
+        .cls = b->cls,
+        .sign = b->sign,
+        .exp = b->exp,
+    };
 
-    switch (a->cls) {
+    switch (r.cls) {
     case float_class_denormal:
         float_raise(float_flag_input_denormal_used, s);
         /* fall through */
     case float_class_normal:
-        frac64_truncjam(a, b);
+        frac64_truncjam(&r, b);
         break;
     case float_class_snan:
     case float_class_qnan:
         /* Discard the low bits of the NaN. */
-        a->frac = b->frac_hi;
-        parts64_return_nan(a, s);
+        r.frac = b->frac_hi;
+        parts64_return_nan(&r, s);
         break;
     default:
         break;
     }
+    return r;
 }
 
 static void parts_float_to_float_widen(FloatParts128 *a, FloatParts64 *b,
@@ -2773,18 +2775,16 @@ bfloat16 float64_to_bfloat16(float64 a, float_status *s)
 float32 float128_to_float32(float128 a, float_status *s)
 {
     FloatParts128 p128 = float128_unpack_canonical(a, s);
-    FloatParts64 p64;
+    FloatParts64 p64 = parts128_to_parts64(&p128, s);
 
-    parts_float_to_float_narrow(&p64, &p128, s);
     return float32_round_pack_canonical(&p64, s);
 }
 
 float64 float128_to_float64(float128 a, float_status *s)
 {
     FloatParts128 p128 = float128_unpack_canonical(a, s);
-    FloatParts64 p64;
+    FloatParts64 p64 = parts128_to_parts64(&p128, s);
 
-    parts_float_to_float_narrow(&p64, &p128, s);
     return float64_round_pack_canonical(&p64, s);
 }
 
@@ -2812,7 +2812,7 @@ float32 floatx80_to_float32(floatx80 a, float_status *s)
     FloatParts128 p128;
 
     if (floatx80_unpack_canonical(&p128, a, s)) {
-        parts_float_to_float_narrow(&p64, &p128, s);
+        p64 = parts128_to_parts64(&p128, s);
     } else {
         parts64_default_nan(&p64, s);
     }
@@ -2825,7 +2825,7 @@ float64 floatx80_to_float64(floatx80 a, float_status *s)
     FloatParts128 p128;
 
     if (floatx80_unpack_canonical(&p128, a, s)) {
-        parts_float_to_float_narrow(&p64, &p128, s);
+        p64 = parts128_to_parts64(&p128, s);
     } else {
         parts64_default_nan(&p64, s);
     }
-- 
2.43.0


