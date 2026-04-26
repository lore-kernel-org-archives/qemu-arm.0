Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD019FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:49:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjG-0007B3-42; Sun, 26 Apr 2026 09:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjC-00076W-7e
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:54 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzj7-0008QR-Rt
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:52 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2ad9516a653so46569875ad.0
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210848; x=1777815648; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8b2W9gnYSMYefVuUFksO85W3oVzQ2QH9P08u6esF1Pc=;
 b=igbknsB2XASvMr8/uyiqr80p6lgkY66IFZEOF6ftr8Xxm+AJwPat6q8YL41p8SdzL/
 QHyaiISRrMfjfWXVcamZwQ4P6FGwpWjGwulW9lmA6zFRFIjNTLjg9sPcjIoC5EiWKOUL
 jvLKGR4ku/Hz7VcQTvhM/aKzoBnERB4XAMqQd6Nn6PNUzlXaqoTs3Iw5ysRz5+Ii1Mk5
 GYq7GmQVTCrk1UUZZdY5gvEQmJ24B5lm33Dqz0SeiaveeFpPHtti2PInh4rMa/HSm7hw
 5wa1Y0ReP2eDQ6HYEfF4wSWUjfNiurKIJ98VrJ2nvXXTIfupHl6PrnRLVdMiNePn5gQt
 XMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210848; x=1777815648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8b2W9gnYSMYefVuUFksO85W3oVzQ2QH9P08u6esF1Pc=;
 b=QELu5RZoqKodjx6PEGsnCsWMmJgiRvKAbdgbAtopIotO/q3m3vXF5z2oD1WWpNKewg
 QVAxgM7XKVAacsQwgJjOoy0q+IKoyFt8e55LWbRozuQY+l0EcjO6trl/YUlzjkLHNHpw
 uVFWTFB4OntTaVNFg0KX+75Em/+51tacpekfcyeNRVRzJJFHw+TgpX3F0DH6h1HXtKTa
 hKc27LlAAh0eZZRbPhidRZpLAC+ar/cKS4B4IlzRjOO00gCfbnPcv8PKXFFr2BABHDP7
 ABSX/IF8qq0Rw2Mtarpz8nA2Y9xIlLEPDdbfKYilUp1jtGSYqOK3vxuR2pqbg9ZCi1vm
 ufiw==
X-Gm-Message-State: AOJu0YzJfwNUkyJ1qbpjkD/ddCNlsfEoOgbfxD2aeczVhO0KBKzElVZW
 4N3RO9qUuIlh2TZqvqBE+puS737vsdF9S5fa+QArVXgfjai9UB+q6TFu6qe4vuSuPTM=
X-Gm-Gg: AeBDietjf3Erhfr8ix+mu/IiALWF8hmVjxWht34J7yEDSMl/i7/YLA9kN2hBQKPYx4E
 C6rlwzFPQeubWNHjYIKWDdwmmqnxOTP14SJKdaxQClsRcC6Kb0G6kZ0u1NkjGbD69HTdFfB91rn
 EGEU8gOdCYgsiIYtcGGjT4N4WxwSJw7NPptSKebOmEdRHPqmRPwg/zb22xgJAf2qVP+0yv1HZMc
 qewZdbCIdZccvMrYDErTjIkZNcIYbSRUsAIl8iOrMP3LWbFW3CLfA929UlONt794VLK3TVkl1Ox
 0mdnZnhOnugWxCuYjqJ1GZ0cbw1/DlFJj+hu9RoxZGr2kh49sL/EqGXgX8sRgu7AD8wG79QsEGe
 y5pkCIC3MYMd6ghgfeppBIFwQzyh0HvtXdD9kkSHfFmw7YHctu/4XYewV2iYY9KSN0Z9tKyvGrv
 WdvnxLR/cwy2vB8WSYGXENW5fqQ1gwN8OlhITHY+08
X-Received: by 2002:a17:903:17c3:b0:2b0:708f:4dc7 with SMTP id
 d9443c01a7336-2b5f9f3b367mr433182745ad.29.1777210847608; 
 Sun, 26 Apr 2026 06:40:47 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 15/84] fpu: Drop parts_modrem
Date: Sun, 26 Apr 2026 23:38:52 +1000
Message-ID: <20260426134002.865628-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Use parts{64,128}_modrem at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index b885eae629..91d8e48ce4 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,14 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static FloatParts64 *parts64_modrem(FloatParts64 *a, FloatParts64 *b,
-                                    uint64_t *mod_quot, float_status *s);
-static FloatParts128 *parts128_modrem(FloatParts128 *a, FloatParts128 *b,
-                                      uint64_t *mod_quot, float_status *s);
-
-#define parts_modrem(A, B, Q, S) \
-    PARTS_GENERIC_64_128(modrem, A)(A, B, Q, S)
-
 static void parts64_sqrt(FloatParts64 *a, float_status *s, const FloatFmt *f);
 static void parts128_sqrt(FloatParts128 *a, float_status *s, const FloatFmt *f);
 
@@ -2642,7 +2634,7 @@ float32 float32_rem(float32 a, float32 b, float_status *status)
 
     float32_unpack_canonical(&pa, a, status);
     float32_unpack_canonical(&pb, b, status);
-    pr = parts_modrem(&pa, &pb, NULL, status);
+    pr = parts64_modrem(&pa, &pb, NULL, status);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -2653,7 +2645,7 @@ float64 float64_rem(float64 a, float64 b, float_status *status)
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
-    pr = parts_modrem(&pa, &pb, NULL, status);
+    pr = parts64_modrem(&pa, &pb, NULL, status);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -2664,7 +2656,7 @@ float128 float128_rem(float128 a, float128 b, float_status *status)
 
     float128_unpack_canonical(&pa, a, status);
     float128_unpack_canonical(&pb, b, status);
-    pr = parts_modrem(&pa, &pb, NULL, status);
+    pr = parts128_modrem(&pa, &pb, NULL, status);
 
     return float128_round_pack_canonical(pr, status);
 }
@@ -2688,7 +2680,7 @@ floatx80 floatx80_modrem(floatx80 a, floatx80 b, bool mod,
         !floatx80_unpack_canonical(&pb, b, status)) {
         return floatx80_default_nan(status);
     }
-    pr = parts_modrem(&pa, &pb, mod ? quotient : NULL, status);
+    pr = parts128_modrem(&pa, &pb, mod ? quotient : NULL, status);
 
     return floatx80_round_pack_canonical(pr, status);
 }
-- 
2.43.0


