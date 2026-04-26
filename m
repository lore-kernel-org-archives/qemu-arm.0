Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B764FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:55:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpa-0008Qf-Ea; Sun, 26 Apr 2026 09:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoS-000644-Cy
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:21 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzoH-0001af-IW
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:46:16 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2a871daa98fso61196325ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211168; x=1777815968; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=msDM/QRI7QIDCfItuOZ2/Z+lYJlpqN4Ugy4Q7HtDfI4=;
 b=G7u43X9jf5p7UQJKPHriAaoiYXSgh0RwCVpUtKMjs0+tw6iakAD4nsHlEw22c/NEcI
 Khli1da7XrzmTVrlO7dPbd/r4tcjfAZ699NiyD98ULJXD1zXEdVWKMY4jG8BWb/kUVN+
 Xa5Hb8h3u+M0A+wWQDBseNhP3uWWruVAqJb4sj3HcvSzx3qjyse1e5pOQfjrp3rXiHxG
 R7UszPvuxV9ssKAxvmtFOJ4qmwIpdj+BjihjBqQSoAxbkxkYCz6niALYfd64H1o5yl7D
 iSiPY3l5QcJUM83fKUvLKSdLpYhi6TwNR3d2L4YCa9k7/cLFpR7U1bOMloYxODDRjCyd
 7CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211168; x=1777815968;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=msDM/QRI7QIDCfItuOZ2/Z+lYJlpqN4Ugy4Q7HtDfI4=;
 b=BR8slSdlKBrMV5x8LTjdre3oQ0iZSbE/MWdkIZf9u85fq6I81MEFuB5AsXC4wiDoSj
 U6ZjHS1//sFRpsE/lfswcxHCXQ7opVJ83/LdzmM821RUp5R6Z02t3ejmFpCB+MXjifTh
 vp/XePDOdHrrpM3hK06wKBm/VdX1kw8ZwQuOl0Ky/dt1/CXAKoTbRYzQok51LUI68Ti0
 mwxxdKSBLS/Jeajx+X/AWncyd90kkSE6kTmM5KzeDAj/3E73CWJ5++c2tHbx2IwtzoBZ
 oLV4iMLf5Ue6NcENtw2QlcRid6+djOZTxWQSUoKNabV6Shv4qa/WoDKUF7feZbckhFJy
 KS8g==
X-Gm-Message-State: AOJu0YwwsFjAPcU+t2MK1EQhD890hs7jN359hv9HWb9euJ3AtP6qC+r+
 X9DWgyA6hkGB5tud7Mh6o3Q/T2qFMUJw5Tqm0yLNZFjiQS5M0UMTjFdXdXMyPB78zZM=
X-Gm-Gg: AeBDieuPeX8ZIpDEHCXNk/wfTycIZMkwvr8C67TjA8bPPq6se9glKzG6jLNEs4/D56Q
 qaezn8bfXHT5mlJJQMpx066r2zlWCCSScscJBediixOFVfu3tAI0jG4RxG4MG8jH3a+0pptdMl/
 kaC0axfH47VgYdhL6q7VBXETIL4gDN3hMoB7xrWVCgt4SnAxYzM1eGF++gJGaL7HimMKWH2bs/6
 XbevZd2Mvs9fxh4t60VwSC0iQeRsuqC6iiBAukcM6YLveW68Oa0c8RiFk7YjJ9ohzLNpdEEdcCV
 jj465nXDwe+gHxizEGyGSLWkFuGRKtgBNURwZpNIQeVGqR2RBOpxA1JuC76kv8VbyoNGoRVvzXv
 IOhB3HhRIXQ0hovZ7cMau38kYDZAv0L+bKs93l1H+4nralyQdPOnq1erjxN4YOLI5S8EyGqt1ZI
 Uz2g00sizRrbMxxQ/KzWsFf6CVuf2PlmDVqZrIkHxu7E6K7befryE=
X-Received: by 2002:a17:903:37c4:b0:2b7:abc0:3bd7 with SMTP id
 d9443c01a7336-2b7abc0448fmr151910765ad.9.1777211168046; 
 Sun, 26 Apr 2026 06:46:08 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:46:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 66/84] fpu: Return struct from parts{64,128}_round_to_int
Date: Sun, 26 Apr 2026 23:39:43 +1000
Message-ID: <20260426134002.865628-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 19 ++++++++++++-------
 fpu/softfloat-parts.c.inc | 21 ++++++++++++---------
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6d69b61c7f..b71bd49483 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2738,7 +2738,8 @@ float16 float16_round_to_int(float16 a, float_status *s)
 {
     FloatParts64 p = float16_unpack_canonical(a, s);
 
-    parts64_round_to_int(&p, s->float_rounding_mode, 0, s, &float16_params);
+    p = parts64_round_to_int(&p, s->float_rounding_mode, 0, s,
+                             &float16_params);
     return float16_round_pack_canonical(&p, s);
 }
 
@@ -2746,7 +2747,8 @@ float32 float32_round_to_int(float32 a, float_status *s)
 {
     FloatParts64 p = float32_unpack_canonical(a, s);
 
-    parts64_round_to_int(&p, s->float_rounding_mode, 0, s, &float32_params);
+    p = parts64_round_to_int(&p, s->float_rounding_mode, 0, s,
+                             &float32_params);
     return float32_round_pack_canonical(&p, s);
 }
 
@@ -2754,7 +2756,8 @@ float64 float64_round_to_int(float64 a, float_status *s)
 {
     FloatParts64 p = float64_unpack_canonical(a, s);
 
-    parts64_round_to_int(&p, s->float_rounding_mode, 0, s, &float64_params);
+    p = parts64_round_to_int(&p, s->float_rounding_mode, 0, s,
+                             &float64_params);
     return float64_round_pack_canonical(&p, s);
 }
 
@@ -2762,7 +2765,8 @@ bfloat16 bfloat16_round_to_int(bfloat16 a, float_status *s)
 {
     FloatParts64 p = bfloat16_unpack_canonical(a, s);
 
-    parts64_round_to_int(&p, s->float_rounding_mode, 0, s, &bfloat16_params);
+    p = parts64_round_to_int(&p, s->float_rounding_mode, 0, s,
+                             &bfloat16_params);
     return bfloat16_round_pack_canonical(&p, s);
 }
 
@@ -2770,7 +2774,8 @@ float128 float128_round_to_int(float128 a, float_status *s)
 {
     FloatParts128 p = float128_unpack_canonical(a, s);
 
-    parts128_round_to_int(&p, s->float_rounding_mode, 0, s, &float128_params);
+    p = parts128_round_to_int(&p, s->float_rounding_mode, 0, s,
+                              &float128_params);
     return float128_round_pack_canonical(&p, s);
 }
 
@@ -2782,8 +2787,8 @@ floatx80 floatx80_round_to_int(floatx80 a, float_status *status)
         return floatx80_default_nan(status);
     }
 
-    parts128_round_to_int(&p, status->float_rounding_mode, 0, status,
-                       &floatx80_params[status->floatx80_rounding_precision]);
+    p = parts128_round_to_int(&p, status->float_rounding_mode, 0, status,
+                              &floatx80_params[status->floatx80_rounding_precision]);
     return floatx80_round_pack_canonical(&p, status);
 }
 
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index ad53286efc..642ad5dfb9 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1255,24 +1255,27 @@ static bool partsN(round_to_int_normal)(FloatPartsN *a, FloatRoundMode rmode,
     return true;
 }
 
-static void partsN(round_to_int)(FloatPartsN *a, FloatRoundMode rmode,
-                                 int scale, float_status *s,
-                                 const FloatFmt *fmt)
+static FloatPartsN partsN(round_to_int)(const FloatPartsN *a,
+                                        FloatRoundMode rmode,
+                                        int scale, float_status *s,
+                                        const FloatFmt *fmt)
 {
     switch (a->cls) {
     case float_class_qnan:
     case float_class_snan:
-        *a = partsN(return_nan)(a, s);
-        break;
+        return partsN(return_nan)(a, s);
     case float_class_zero:
     case float_class_inf:
-        break;
+        return *a;
     case float_class_normal:
     case float_class_denormal:
-        if (partsN(round_to_int_normal)(a, rmode, scale, fmt->frac_size)) {
-            float_raise(float_flag_inexact, s);
+        {
+            FloatPartsN r = *a;
+            if (partsN(round_to_int_normal)(&r, rmode, scale, fmt->frac_size)) {
+                float_raise(float_flag_inexact, s);
+            }
+            return r;
         }
-        break;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


