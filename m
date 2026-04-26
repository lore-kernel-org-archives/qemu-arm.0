Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE33FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:45:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzje-0007rj-0O; Sun, 26 Apr 2026 09:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjc-0007hy-IQ
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:20 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzja-0000BM-Fn
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:20 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2b458ca2296so57784745ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210877; x=1777815677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Fdg86UxH5WehreH8Kl6Bnjzy/FswVWwLkkG8BlzOUE=;
 b=vCupFymoD1Mp0+hGFEnv3ay+J30sdXrjIBxZO2GwVWOxhBI9BRGx0AugtxokgkXiBa
 ce0GONgRZSZgsJ43oz7pelQP2qpnaJfznQYDtmdHOobVs5h0DvxzmWFzPr97MxASsLDh
 4DHrEGo+p2kxzZAWujTnsli88ulawfxVHGThoKmyoEOUo4Oh6vWha86xIW7G6vFIodLM
 /oaKIG/k7BMJpy9uIMRjNquEUaWNTUUnoBRIfV2WPtJ3pe6B3JTSDFZvpUZ/vuS49tjT
 iI1G+m8f7i2Xysu4PLJ32Hok+UgoWLaHQOGdjHbQLQZbSPrPTqAPhhSe5/I8DldwknEp
 3mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210877; x=1777815677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7Fdg86UxH5WehreH8Kl6Bnjzy/FswVWwLkkG8BlzOUE=;
 b=Sm4KK7afpwz/E4P6CWORjRn+KqnyzPtE1BBa4VwkWkkxcdLOxmWM0CY4tQ8c5u1JIv
 /rWippHHp6bZvSKkfw99PKbnLidiiHjfztNXdYbMayABXYKi6sVJDgnBVwgVI10330g0
 CBKo8jfet0OmWLMirl2UDTPAJrwEmL52QvM6aPeW3ustRv/BLZlFYfvhRB0cAg5K1K3j
 TnXWQ78G2iz1z6ljhqcN0OHVxpxnLSXzS1uhPtAATpNNU+RiGtDKQE5Yf5QhIxzQg3yM
 MbUpQfd7UQtY7hWMW176ETAsBK7FqXsaayl1V8hVZvVgAR/6ArV8urRtWpCjT6zBesUB
 oiLg==
X-Gm-Message-State: AOJu0Yxd36sZd0Poiokj6bV+SsKMkq185zM1a/8brhgkG+60mHvNaPVV
 /r/RRBmis5pNsFJ0fkjc5n4GAVrVSOHqQcqoNAZPCx+fVgFC7I2YVx05v7qvaYckQK6hrFkdQpl
 CpaCGcxA=
X-Gm-Gg: AeBDietDSQT8yRXAoqZ64sgcd6KT0wmy7ereiZFcdZVqDtGEmbywJY04UlXx3XsmHR1
 e6aPscmo7ElwmQSPprW2cQrmG+2sV0Qa00q3rudUNAFhK3yGLS4bTTokmpDxpZM+QoWgyuX2St6
 jwxlnxCpRIaNe8CIcxTK5wFcf05TitpWiEm75xMdqwtRJrBCGWx8c5xi8dF11H3UdEJWQQxrUrv
 QdbtrMORYaDy1AGIbLP3BSqVPqIA1GcReAknuKjgCmuPOGPYMEIZV8/Tgtf0ObxclPKojZpYjK4
 rT5TSMUQAAMy0dXQBPFOzL/7e2Kv1BCvDZwnjAVbDhFA0yf9LYZcQUu36k0JGm/pGOMWJiGLiVu
 zf6UPt+8E3xt9mr3tiJkiX2YTlvK4uS4ETvP+sBlbHjdHER7RJAG9h8bh4BbAvSPmYyu/DqBBfj
 FG5jLYexBt5UNiFfmNMScsI0EV6uLriJNx5nlu3JRv
X-Received: by 2002:a17:902:ce0a:b0:2b0:af2f:b27a with SMTP id
 d9443c01a7336-2b5f9ec3590mr383313245ad.11.1777210876753; 
 Sun, 26 Apr 2026 06:41:16 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 26/84] fpu: Drop parts_scalbn
Date: Sun, 26 Apr 2026 23:39:03 +1000
Message-ID: <20260426134002.865628-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Use parts{64,128}_scalbn at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 3aebe4a058..3e6f2a152a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,12 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static void parts64_scalbn(FloatParts64 *a, int n, float_status *s);
-static void parts128_scalbn(FloatParts128 *a, int n, float_status *s);
-
-#define parts_scalbn(A, N, S) \
-    PARTS_GENERIC_64_128(scalbn, A)(A, N, S)
-
 static void parts64_log2(FloatParts64 *a, float_status *s, const FloatFmt *f);
 static void parts128_log2(FloatParts128 *a, float_status *s, const FloatFmt *f);
 
@@ -4678,7 +4672,7 @@ float16 float16_scalbn(float16 a, int n, float_status *status)
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, status);
-    parts_scalbn(&p, n, status);
+    parts64_scalbn(&p, n, status);
     return float16_round_pack_canonical(&p, status);
 }
 
@@ -4687,7 +4681,7 @@ float32 float32_scalbn(float32 a, int n, float_status *status)
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, status);
-    parts_scalbn(&p, n, status);
+    parts64_scalbn(&p, n, status);
     return float32_round_pack_canonical(&p, status);
 }
 
@@ -4696,7 +4690,7 @@ float64 float64_scalbn(float64 a, int n, float_status *status)
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, status);
-    parts_scalbn(&p, n, status);
+    parts64_scalbn(&p, n, status);
     return float64_round_pack_canonical(&p, status);
 }
 
@@ -4705,7 +4699,7 @@ bfloat16 bfloat16_scalbn(bfloat16 a, int n, float_status *status)
     FloatParts64 p;
 
     bfloat16_unpack_canonical(&p, a, status);
-    parts_scalbn(&p, n, status);
+    parts64_scalbn(&p, n, status);
     return bfloat16_round_pack_canonical(&p, status);
 }
 
@@ -4714,7 +4708,7 @@ float128 float128_scalbn(float128 a, int n, float_status *status)
     FloatParts128 p;
 
     float128_unpack_canonical(&p, a, status);
-    parts_scalbn(&p, n, status);
+    parts128_scalbn(&p, n, status);
     return float128_round_pack_canonical(&p, status);
 }
 
@@ -4725,7 +4719,7 @@ floatx80 floatx80_scalbn(floatx80 a, int n, float_status *status)
     if (!floatx80_unpack_canonical(&p, a, status)) {
         return floatx80_default_nan(status);
     }
-    parts_scalbn(&p, n, status);
+    parts128_scalbn(&p, n, status);
     return floatx80_round_pack_canonical(&p, status);
 }
 
-- 
2.43.0


