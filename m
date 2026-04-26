Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46174FF8863
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:48:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjG-0007BO-B7; Sun, 26 Apr 2026 09:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzjC-00076Y-7a
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:54 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzj9-0008RH-Ix
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:53 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2addb31945aso59549935ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210850; x=1777815650; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2IzZbTZBi1/HYn+Kd6HNy8yKoIRF/IKgPHtP/RDOts=;
 b=iFxjp62aSy8WrjbqR6WdVEaatpL0fR3hY6zRff8fWrYnmca7BjZaHmIt+ctY3EmISq
 t/KsgfVDTXw2tqervA4dJoBSAgn4j0du0Hsj3gmrhvtOBk/CFFSn0B9VHFeIgVaMLMXY
 r8XA1EOcJPIRMO+Iahu5MlETqcocU76HVwPR6wb+8PbUhJDrds2NOa/sDDlqcCqbfI9/
 Wq6QnignvH7TXx56M9SpfHdkxS2Ocs3kSwhanPSrL6F+tukwTGYk0bP1k4K94RbZwCW5
 VBhHy0QmNi/B+gBOWD23e9baRy3OUGjAPNaoEk09ITItqdHPImdyJoz+Jb0O8WoPdsVg
 tK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210850; x=1777815650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q2IzZbTZBi1/HYn+Kd6HNy8yKoIRF/IKgPHtP/RDOts=;
 b=FTzrHMwH4oQ/SCOwogqleUkaqpEZbFVGORg2Qf5KIpiZctmkknHw4J6L2F4VGx3HVr
 uPa6BNO5tthbuuzWQaO9tyt9g1naMcDvC6J8PiJl+cYbcKY8FG1AQtouNtpVGefZejvZ
 a6PGz2PXr8ieh2x32Lc0FVb8IIJ/T2W/dDKfpWDNWpbt1kRem0Poz+5truyyiijA+SUH
 hSCcJEmAqKqtqNu0kUHqBNizjkwRxdb4iSLCoScmlw5Fc/tHy6gx7xP3ZBoI5jVLLkhZ
 N8/2ddVUuDJAeqenN8nCZAv+7kPYkSO1L8yGOICFVjnW33SBtqdfBIO+EwxQsSIk+Q2Y
 rS8g==
X-Gm-Message-State: AOJu0Yyi5WcZVccu6sVimJrox6F6jy2Wf7jLegFxXfldpmE20FFbrwMM
 idKdbMKRGKf8cPN3Cyqf6XRKuW1uYmOU7WtW4Vt8L3izlRD5Yysr463OZPqwZ8ADCdPoHEgIM2D
 +SLIrFkU=
X-Gm-Gg: AeBDietgXyZX2/hzQupzRgMIqfgQH7O9kwc5Y79Ei1f3atxgacgRyPhwZACGY5WQHST
 rlBHFrMc+0AtGlxi4CbYRcc6wNjCAak3et7wAGR2LUqWfyT7s/yM/8Yc1JefObUj/pRauWHxcME
 vxMoBkEEowS7wI5GkB2VSA7I1kBkUYT00kA+Q89zCx95ib60Lost3hZEapa1iL9Wih4UADbJjc2
 rF6ScBY28vvNGRc/H/m/CS8vKUaT7qXPyRvCSdH6a4YTSVPXN9OUPqdUlfPbXQCJHVuf6y8z2MW
 0S0r+RkzspimAxvsF1XgraeVXUP8558VmdRvXE5XiYY8gUQBzQrCHr6kwuUUrEiZb3KpbNgdQtn
 s5mb1HgGvKccXqzRYTxmtHgJGLueT2khB7pEpF4A6lxys6G1B5yNXJLzm3RQ2tXda/MY6tPnWsR
 lWPJTZMtRyLovP5chOFrFDcFVfuDTIk1EIIZ1j0oInCAzWG8V4BF8=
X-Received: by 2002:a17:903:1b45:b0:2b2:4d36:7aa with SMTP id
 d9443c01a7336-2b5f9fb36ccmr431356495ad.35.1777210850140; 
 Sun, 26 Apr 2026 06:40:50 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 16/84] fpu: Drop parts_sqrt
Date: Sun, 26 Apr 2026 23:38:53 +1000
Message-ID: <20260426134002.865628-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

Use parts{64,128}_sqrt at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 91d8e48ce4..0a6bc6d580 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,12 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static void parts64_sqrt(FloatParts64 *a, float_status *s, const FloatFmt *f);
-static void parts128_sqrt(FloatParts128 *a, float_status *s, const FloatFmt *f);
-
-#define parts_sqrt(A, S, F) \
-    PARTS_GENERIC_64_128(sqrt, A)(A, S, F)
-
 static bool parts64_round_to_int_normal(FloatParts64 *a, FloatRoundMode rm,
                                         int scale, int frac_size);
 static bool parts128_round_to_int_normal(FloatParts128 *a, FloatRoundMode r,
@@ -4757,7 +4751,7 @@ float16 QEMU_FLATTEN float16_sqrt(float16 a, float_status *status)
     FloatParts64 p;
 
     float16_unpack_canonical(&p, a, status);
-    parts_sqrt(&p, status, &float16_params);
+    parts64_sqrt(&p, status, &float16_params);
     return float16_round_pack_canonical(&p, status);
 }
 
@@ -4767,7 +4761,7 @@ soft_f32_sqrt(float32 a, float_status *status)
     FloatParts64 p;
 
     float32_unpack_canonical(&p, a, status);
-    parts_sqrt(&p, status, &float32_params);
+    parts64_sqrt(&p, status, &float32_params);
     return float32_round_pack_canonical(&p, status);
 }
 
@@ -4777,7 +4771,7 @@ soft_f64_sqrt(float64 a, float_status *status)
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, status);
-    parts_sqrt(&p, status, &float64_params);
+    parts64_sqrt(&p, status, &float64_params);
     return float64_round_pack_canonical(&p, status);
 }
 
@@ -4840,7 +4834,7 @@ float64 float64r32_sqrt(float64 a, float_status *status)
     FloatParts64 p;
 
     float64_unpack_canonical(&p, a, status);
-    parts_sqrt(&p, status, &float64_params);
+    parts64_sqrt(&p, status, &float64_params);
     return float64r32_round_pack_canonical(&p, status);
 }
 
@@ -4849,7 +4843,7 @@ bfloat16 QEMU_FLATTEN bfloat16_sqrt(bfloat16 a, float_status *status)
     FloatParts64 p;
 
     bfloat16_unpack_canonical(&p, a, status);
-    parts_sqrt(&p, status, &bfloat16_params);
+    parts64_sqrt(&p, status, &bfloat16_params);
     return bfloat16_round_pack_canonical(&p, status);
 }
 
@@ -4858,7 +4852,7 @@ float128 QEMU_FLATTEN float128_sqrt(float128 a, float_status *status)
     FloatParts128 p;
 
     float128_unpack_canonical(&p, a, status);
-    parts_sqrt(&p, status, &float128_params);
+    parts128_sqrt(&p, status, &float128_params);
     return float128_round_pack_canonical(&p, status);
 }
 
@@ -4869,7 +4863,7 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *s)
     if (!floatx80_unpack_canonical(&p, a, s)) {
         return floatx80_default_nan(s);
     }
-    parts_sqrt(&p, s, &floatx80_params[s->floatx80_rounding_precision]);
+    parts128_sqrt(&p, s, &floatx80_params[s->floatx80_rounding_precision]);
     return floatx80_round_pack_canonical(&p, s);
 }
 
-- 
2.43.0


