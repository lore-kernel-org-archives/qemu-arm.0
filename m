Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10603FF8864
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:57:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzkf-0001HN-FM; Sun, 26 Apr 2026 09:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjz-0000CF-Em
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:45 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjx-0000Kg-KI
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-35d965648a2so8269572a91.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210900; x=1777815700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6upzFsCqjF1qCcR6K3CQOkyVSNbVZef2UmzHbmwztpk=;
 b=yFvNlSPYNiCf7l8SrZeyukOpl1sjMZxKpvawbR7KzVD6AlVMGDuqU+1OGC5OHmxBAS
 sz7tAlCDY3b7E9k6o5rzraZcPpDNnBcsQM+fccvRUlvh8YDlBHMJYpAFYBmn/icpL+RZ
 ub/dMyD1J1D45W9jYNlbp3AyB2tMzTcq1rCFBtCkreoXWCuWV0Ma4oJRODgYV/Fzsgok
 B3+CJ8ascEoiJuagDxGSN3ZWRgc1elkR9VEVE5G7Ko21JUFSwdwdmLi2RF1kyc4H+kWm
 Rq0p2vf3EOLaxwt5m5wfCfVaUiGojBoYDN6wjV2GMpw6nrip6mw9G5vqKpikI6TpEKqS
 K6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210900; x=1777815700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6upzFsCqjF1qCcR6K3CQOkyVSNbVZef2UmzHbmwztpk=;
 b=C16FE5QcT6eChpuMECqT2Ol8yR4SiJvPqQpWewO0WjkD4voUz4sdkGEXxX3r7XFA2g
 t61xWdD/TQTydZiuxapPa7s/ytfIQrLbE7MCUbIXue7eTkQNrbV63hsWIbNWUCpgOzZ2
 OkSvIZi6Z4nscif8VYDb4VHKkXW5wjg8hPGB/uK8socfX/cAic2BabPJuh0b6JGtjZwI
 81chF5kaPumzLD8u4gMO5SMrl1Pra7ifzLjvgauJVAmPwzvEoeD5legFaNs5vM5v4hGA
 BW7WO44dfFYc6tydm27zCKI83qiz4UhtE+xFPjV6RXlA4rHQFlwp4aPyG1FLoWMr7H/L
 ooqg==
X-Gm-Message-State: AOJu0Yw0ucI0TF24uuj2Qbl02A/W98upm7uVx088oDO39S4nruzsy8bb
 vGNAMRXYwuA1OJQbuloxEUB9jXK3jhjd/fvEqXlv6/DDNKHskuWIMasAt+rUPhtjSE4=
X-Gm-Gg: AeBDieuKQhYMBA/6sUSeFQ5VbCNO0+J1Xfg5mERhcsUj3SY1kjyz7Z0ogn4wRmhgXWf
 UZ583OOWqqdT5DnO2JJfV3GJL0wOWiTczYkMtrdh97rgLfBMUfItJbJtB1z039aIR9WqO/2xamq
 rXDc3AqfOCbX0/IO++2EELYwCxNY/1e8Vv0LneAL+R/NKe9x+dovEGiU4Wu8PQqcR55LRq6yocp
 1/kHegKBm+hKU3UPSnqmY6eorxVPsMkZfQN0tvD9l4FZ5dzhtAXs/gLPmWIxsNtR/4hyAdfOZV/
 Ja632frcfk+UvA6p7uEWVzH6FlWQ+yqz0DE45pdSkpBomZLeiSeGKdRNst0SEU8p8XvegYy2+/K
 ijFYBPFa8VLjhdutNSmtQKGN4aBGKHWca4A1YuaQB2P5ox7a7UPsKruF3oE0G2qYlywx8bM+jpK
 ctz6SSx+NtTG3juQTZQ/dbXWFAbEN2oyZOU9vUJpv+91DuUgqPjQw=
X-Received: by 2002:a17:903:328b:b0:2b2:4bf9:1766 with SMTP id
 d9443c01a7336-2b5f9fe5d26mr312513155ad.33.1777210900226; 
 Sun, 26 Apr 2026 06:41:40 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 35/84] fpu: Return struct from float8_e5m2_unpack_canonical
Date: Sun, 26 Apr 2026 23:39:12 +1000
Message-ID: <20260426134002.865628-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Inline float8_e5m2_unpack_raw at the same time.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index c1b03f30ab..bc6450954e 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -646,11 +646,6 @@ static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
     };
 }
 
-static void QEMU_FLATTEN float8_e5m2_unpack_raw(FloatParts64 *p, float8_e5m2 f)
-{
-    *p = unpack_raw64(&float8_e5m2_params, f);
-}
-
 static void QEMU_FLATTEN float16_unpack_raw(FloatParts64 *p, float16 f)
 {
     *p = unpack_raw64(&float16_params, f);
@@ -1477,11 +1472,11 @@ static FloatParts64 float8_e4m3_unpack_canonical(float8_e4m3 f, float_status *s)
     return p;
 }
 
-static void float8_e5m2_unpack_canonical(FloatParts64 *p, float8_e5m2 f,
-                                         float_status *s)
+static FloatParts64 float8_e5m2_unpack_canonical(float8_e5m2 f, float_status *s)
 {
-    float8_e5m2_unpack_raw(p, f);
-    parts64_canonicalize(p, s, &float8_e5m2_params);
+    FloatParts64 p = unpack_raw64(&float8_e5m2_params, f);
+    parts64_canonicalize(&p, s, &float8_e5m2_params);
+    return p;
 }
 
 static void float16a_unpack_canonical(FloatParts64 *p, float16 f,
@@ -2703,9 +2698,7 @@ bfloat16 float8_e4m3_to_bfloat16(float8_e4m3 a, float_status *s)
 
 bfloat16 float8_e5m2_to_bfloat16(float8_e5m2 a, float_status *s)
 {
-    FloatParts64 p;
-
-    float8_e5m2_unpack_canonical(&p, a, s);
+    FloatParts64 p = float8_e5m2_unpack_canonical(a, s);
     parts64_float_to_float(&p, s);
     return bfloat16_round_pack_canonical(&p, s);
 }
-- 
2.43.0


