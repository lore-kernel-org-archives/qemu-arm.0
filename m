Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE5EFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:42:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjE-000792-DJ; Sun, 26 Apr 2026 09:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzj9-00075D-Ev
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:51 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzj6-0008QE-BD
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:51 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c76b9efc299so3779414a12.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210845; x=1777815645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eMeYdKdLROxUfcpDykwRMbJ11IFu4aFIiW8kpwXCk4=;
 b=iWZtwmpTf19F+zDVR12wCHFQsgq1eytJLX5SU1A4+YBb/BCnSfsSEUas4BdCQE3I2z
 89HitZAc8VoJnw6hc0GKcqK0pWVNi7t4iZCxK7qqJNa4dj7TriFgLNUclB0k/e3Blj8b
 iSKd1Pq9govLN3PiVmgYurUBGDI8ClX0C5af5hPQ0nZJy1hda9A1iQHqyiVtCAnpCOU7
 0efLoBZhd0AP2ZAwg+pHqBM8ZpHRD0jcEp9s7Kbow0LwwQfn9hxKoD+SYwVKt8W8s5r/
 HsrOUEv9pYp5vd2/9lERffK+4pfcpj+SoI+npNL+Tariet+xrQLBqIhEk1gszNHYzOCE
 R56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210845; x=1777815645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8eMeYdKdLROxUfcpDykwRMbJ11IFu4aFIiW8kpwXCk4=;
 b=WE3jYqZriMEPlQ94L9Ku2SteEHoDlTba2OW14lfrZJZwByMNVVGMX6M34T1CDTZIr9
 2fEw0SkHv7nkgJBRxuWHbfufDStfodQLsofmIniXiUNLbklcumDxAfWLNAmwkzMaYToC
 wZxfwuEQNp/M4hvQr3eV44CND1188GLPhSVLWLH86Wf3FZRIEmqdzm+yYstByEriC5RZ
 3umU/fAgmznFo9MvEiYmE+D2ffn1pVlvwXc+96T2Ox/2YfPEnGn7O9e8wrUaUmrbQSaa
 gGaH8W2Lkcq8etgkeV3s7YbOyXHylr8Gsj2S7MhVEEw/+OtGYbvjmM3ucnn+iH5g06Qq
 4z2w==
X-Gm-Message-State: AOJu0YxBgCJx7HIigyyHwKWWmpv/bcdGHiKIj0OY2pedIz/UayDRVs3J
 DsNecB3CwAKAKm7QEbtaKIkLMQjj3GfoxDp3DV74QoBdGCjG9h4Z+SYycDkbhelrl2okZRI4xrF
 6Bq/05IE=
X-Gm-Gg: AeBDiet0rxN831H/gZfVu/DYjcwYc9vXogrUvl0l9362JvX/Osg9XSD+3ed2oKqDPmt
 akZ3nVIZem2lF0qNkfL3lCyrFIlBJ2pqIv4OIi8s3ybGTdokKTUBuhWg6XOlWzxUJBNcbSUmYA6
 0s1hNxhG3eK5m7DsLKyEmQgbNKR+uczjU4yPWGj3jOZxklxP0enScWmQsdoUfuoNofWIICe0DIN
 IIuZ+Zga7Y51nrAxsJDeMFs4LsaTlQ2kd4waBl0M9MJ94lYKJTim1aSyNA38y1UVcWWtQLZ4Yt5
 eso1TyCSKi2tdoHH/81Ee46fxWygkg5UMFv2QCiLdb6GaDl7PzCIIp2dppUUqxO6jyc9qvo6xaw
 WkALAA6LduqIRdkTJXJiIareOCMTsVULqKyNtU7c31v+Cxf6NRo6oPrj2sBaV8oTqdKnWbWNbHJ
 WrF+XFr4EUJfd31eCymGRxt0aYdUD/q8rlm+ZWWCQ9
X-Received: by 2002:a17:903:1988:b0:2b7:97b9:54fa with SMTP id
 d9443c01a7336-2b797b95512mr165293775ad.32.1777210845252; 
 Sun, 26 Apr 2026 06:40:45 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 14/84] fpu: Drop parts_div
Date: Sun, 26 Apr 2026 23:38:51 +1000
Message-ID: <20260426134002.865628-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Use parts{64,128}_div at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index aa62fea47d..b885eae629 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,14 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static FloatParts64 *parts64_div(FloatParts64 *a, FloatParts64 *b,
-                                 float_status *s);
-static FloatParts128 *parts128_div(FloatParts128 *a, FloatParts128 *b,
-                                   float_status *s);
-
-#define parts_div(A, B, S) \
-    PARTS_GENERIC_64_128(div, A)(A, B, S)
-
 static FloatParts64 *parts64_modrem(FloatParts64 *a, FloatParts64 *b,
                                     uint64_t *mod_quot, float_status *s);
 static FloatParts128 *parts128_modrem(FloatParts128 *a, FloatParts128 *b,
@@ -2505,7 +2497,7 @@ float16 float16_div(float16 a, float16 b, float_status *status)
 
     float16_unpack_canonical(&pa, a, status);
     float16_unpack_canonical(&pb, b, status);
-    pr = parts_div(&pa, &pb, status);
+    pr = parts64_div(&pa, &pb, status);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -2517,7 +2509,7 @@ soft_f32_div(float32 a, float32 b, float_status *status)
 
     float32_unpack_canonical(&pa, a, status);
     float32_unpack_canonical(&pb, b, status);
-    pr = parts_div(&pa, &pb, status);
+    pr = parts64_div(&pa, &pb, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -2529,7 +2521,7 @@ soft_f64_div(float64 a, float64 b, float_status *status)
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
-    pr = parts_div(&pa, &pb, status);
+    pr = parts64_div(&pa, &pb, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -2598,7 +2590,7 @@ float64 float64r32_div(float64 a, float64 b, float_status *status)
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
-    pr = parts_div(&pa, &pb, status);
+    pr = parts64_div(&pa, &pb, status);
 
     return float64r32_round_pack_canonical(pr, status);
 }
@@ -2610,7 +2602,7 @@ bfloat16_div(bfloat16 a, bfloat16 b, float_status *status)
 
     bfloat16_unpack_canonical(&pa, a, status);
     bfloat16_unpack_canonical(&pb, b, status);
-    pr = parts_div(&pa, &pb, status);
+    pr = parts64_div(&pa, &pb, status);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -2622,7 +2614,7 @@ float128_div(float128 a, float128 b, float_status *status)
 
     float128_unpack_canonical(&pa, a, status);
     float128_unpack_canonical(&pb, b, status);
-    pr = parts_div(&pa, &pb, status);
+    pr = parts128_div(&pa, &pb, status);
 
     return float128_round_pack_canonical(pr, status);
 }
@@ -2636,7 +2628,7 @@ floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
         return floatx80_default_nan(status);
     }
 
-    pr = parts_div(&pa, &pb, status);
+    pr = parts128_div(&pa, &pb, status);
     return floatx80_round_pack_canonical(pr, status);
 }
 
@@ -5488,7 +5480,7 @@ static void parts_s390_divide_to_integer(FloatParts64 *a, FloatParts64 *b,
 
         /* Compute precise quotient */
         q_buf = *a;
-        q = parts_div(&q_buf, b, status);
+        q = parts64_div(&q_buf, b, status);
 
         /*
          * Check whether two closest integers can be precisely represented,
-- 
2.43.0


