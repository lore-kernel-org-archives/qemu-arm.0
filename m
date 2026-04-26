Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248ABFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:49:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzjE-000797-Rl; Sun, 26 Apr 2026 09:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGziy-00071T-LL
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:41 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzix-0008Ng-0i
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:40 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2b7adb38d65so31846385ad.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210838; x=1777815638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8mF2w2Bv+oA3MTgv0hQ1Dx793tAYzL7cdErwHzJOq0=;
 b=sGTJiSEp2w2bX9D3m0pYJN51VAAfDT5ieeBWmikyL8hjEIF7TuQXq9bc01fNbaBdl1
 DJEazEw+/HDpETs2ekN/qcEsu5vgSIIZff2gGDe8epKX52CUBloFj6u9/vuSI9u0fov4
 sB1FSY3E2lYyBqrlFualRMqy6Fa3hbKlLrvneMsfT4FZtsmixR5leSux6haXqeB1K8lA
 f4fffM2Sig8dPsVbplczdCQmbTuvh6orsxN0y94yG5mYvaJ3iYb5N1Q7NYlcaVlE2FUU
 4Fx6N+yN66BDx2aLPfqOhtT/sIQgwf06xYqkmEfDVGEEE6eLCs6+XlyunN9ffPv6uK2e
 saVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210838; x=1777815638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W8mF2w2Bv+oA3MTgv0hQ1Dx793tAYzL7cdErwHzJOq0=;
 b=C1mRunUj29swU7VNk32Vki7l9lRXxjMoTbF5J9L/+N+RBBfhvP0lJjRa4rPjwbc83X
 305PxuNtfTwxONYO0eLOKiwN0vp11sdGOuQMACUYs5kF5BGhGJhWjOCCYed6NmJCynCv
 7g/L+tgJS+Soo2zH3lDK8LskPdDiBBDM0QqHCpJFiJrUiwM+jJuuHu//KJJtBJoqFVxS
 kdGAG2z3pJw3MdwtmzD2ELHNsvbKqs0AyfFN4dwxZaoYM4ubLENhNqLgB8Ov980ezy8x
 Fu49fLfrTFD/3zXSIlsWrh7iDBW5X47l9pm12mbi98i0KdStfW0RWxHxxqhZUHp+Tf0a
 F7Og==
X-Gm-Message-State: AOJu0YwI75KYGbV2VaWUfkcCMIMdK0wf+U4MVBKMbMnjIqLhXp+7zp0t
 X2NW/ZNYqSI42nlmkXdmTwOokIeudPXIst4dalluYPfaLyTUH2jK1yI9XzLELgE47mw=
X-Gm-Gg: AeBDiesQDhRCC5DhfKUFslh8TT8mxFrDgmIv/zs2ecLvGO1vLLprvfcDAW+aWIDvY58
 Cw9zWjUTFAJh8/E0bfjM93UkwC/l8LjIs0VmgGKIr1BcNYkziXXaVEY9I5Z0VX3/slqXmmtMhbq
 +DBufkviHrUPzdyrwdmYNUiHjUUxluL4FcJFvDiOvgXpsK2TttHMtgU95hGnK/V0LHp4BioBCGY
 K5Dng7GYEbh1sY2EXdesM3X5le06Eix5OPVI7ObK4/TZTj18U/CZDttbrYwSvW0HxILbmWG1saL
 v4ZpuxMhsrNEV6gP1j4KBYTWGWv+eJi0MK9Oos8R82pJM+SMIxpSEvV+UDLK146TsvJMpHjg/90
 oNfXYhgGtzrEmqgzzhbCfowNLVIlLzfGcGgZ+/k3rPsySdAxGO5aIxKEhAozP4T91tQvJJTyVOo
 7TfI3wXBcAYHvOr59BJYK1mVqtxCJnA3L2oZKFNycM
X-Received: by 2002:a17:903:17cf:b0:2b0:6829:9414 with SMTP id
 d9443c01a7336-2b5f9e64c6cmr397266395ad.8.1777210837582; 
 Sun, 26 Apr 2026 06:40:37 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 11/84] fpu: Drop parts_addsub
Date: Sun, 26 Apr 2026 23:38:48 +1000
Message-ID: <20260426134002.865628-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Use parts{64,128}_addsub at each call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 117c335d66..dc5ce53105 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,14 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static FloatParts64 *parts64_addsub(FloatParts64 *a, FloatParts64 *b,
-                                    float_status *s, bool subtract);
-static FloatParts128 *parts128_addsub(FloatParts128 *a, FloatParts128 *b,
-                                      float_status *s, bool subtract);
-
-#define parts_addsub(A, B, S, Z) \
-    PARTS_GENERIC_64_128(addsub, A)(A, B, S, Z)
-
 static FloatParts64 *parts64_mul(FloatParts64 *a, FloatParts64 *b,
                                  float_status *s);
 static FloatParts128 *parts128_mul(FloatParts128 *a, FloatParts128 *b,
@@ -1923,7 +1915,7 @@ float16_addsub(float16 a, float16 b, float_status *status, bool subtract)
 
     float16_unpack_canonical(&pa, a, status);
     float16_unpack_canonical(&pb, b, status);
-    pr = parts_addsub(&pa, &pb, status, subtract);
+    pr = parts64_addsub(&pa, &pb, status, subtract);
 
     return float16_round_pack_canonical(pr, status);
 }
@@ -1945,7 +1937,7 @@ soft_f32_addsub(float32 a, float32 b, float_status *status, bool subtract)
 
     float32_unpack_canonical(&pa, a, status);
     float32_unpack_canonical(&pb, b, status);
-    pr = parts_addsub(&pa, &pb, status, subtract);
+    pr = parts64_addsub(&pa, &pb, status, subtract);
 
     return float32_round_pack_canonical(pr, status);
 }
@@ -1967,7 +1959,7 @@ soft_f64_addsub(float64 a, float64 b, float_status *status, bool subtract)
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
-    pr = parts_addsub(&pa, &pb, status, subtract);
+    pr = parts64_addsub(&pa, &pb, status, subtract);
 
     return float64_round_pack_canonical(pr, status);
 }
@@ -2064,7 +2056,7 @@ static float64 float64r32_addsub(float64 a, float64 b, float_status *status,
 
     float64_unpack_canonical(&pa, a, status);
     float64_unpack_canonical(&pb, b, status);
-    pr = parts_addsub(&pa, &pb, status, subtract);
+    pr = parts64_addsub(&pa, &pb, status, subtract);
 
     return float64r32_round_pack_canonical(pr, status);
 }
@@ -2086,7 +2078,7 @@ bfloat16_addsub(bfloat16 a, bfloat16 b, float_status *status, bool subtract)
 
     bfloat16_unpack_canonical(&pa, a, status);
     bfloat16_unpack_canonical(&pb, b, status);
-    pr = parts_addsub(&pa, &pb, status, subtract);
+    pr = parts64_addsub(&pa, &pb, status, subtract);
 
     return bfloat16_round_pack_canonical(pr, status);
 }
@@ -2108,7 +2100,7 @@ float128_addsub(float128 a, float128 b, float_status *status, bool subtract)
 
     float128_unpack_canonical(&pa, a, status);
     float128_unpack_canonical(&pb, b, status);
-    pr = parts_addsub(&pa, &pb, status, subtract);
+    pr = parts128_addsub(&pa, &pb, status, subtract);
 
     return float128_round_pack_canonical(pr, status);
 }
@@ -2133,7 +2125,7 @@ floatx80_addsub(floatx80 a, floatx80 b, float_status *status, bool subtract)
         return floatx80_default_nan(status);
     }
 
-    pr = parts_addsub(&pa, &pb, status, subtract);
+    pr = parts128_addsub(&pa, &pb, status, subtract);
     return floatx80_round_pack_canonical(pr, status);
 }
 
-- 
2.43.0


