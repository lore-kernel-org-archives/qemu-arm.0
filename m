Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1159BFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:42:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzj3-00072y-JU; Sun, 26 Apr 2026 09:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzir-0006vi-L5
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:33 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzio-0008Lc-R0
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:40:32 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-35da9692ec3so8015220a91.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210829; x=1777815629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TlT+GS6oouXmdq2YCgctHeMhphC7kkcEJPxhLWLaRK0=;
 b=DNTB51ktkOOlM8mabPrH6wSXWkPd0YYI0UQoLq9CqA7P3c+FbdTgvjUzW34n7E9b9s
 uk8+Bu2TncJd3uF7+gN9uY0V6zsHc1hhsQnYAdZnL4WqgiIe3X5a8kD34rpxbXEZC1oY
 amIf8aYWgJ2VyQePhhFYmjDXIdwE9tE58Vx9ZlUWWcyQRr27xsLWElgFffFxpcSHKvh2
 zqz4DZU5aSf/tP9cDuUeBb22t7wVfrRWnWTchIQ1ysF6Ab16lKqBS6t+4Dpj+zrcmgAf
 v0gKbPUUX13sDtBP2lQhDWnU0jO9vlFIBqCuX63UL11SdztcoefHyZeSlQh0unhgAwZM
 jUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210829; x=1777815629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TlT+GS6oouXmdq2YCgctHeMhphC7kkcEJPxhLWLaRK0=;
 b=hwr0fQ3eUCWgu8ZdB2CISqBNiwibkMQwj/mQynxkT/bYts8uz79DKTi8jDzhzPYWl7
 jLKRDFkODguDNZF76T3veoL67HhmSuF/kWQGAkfJjZUvsrGPfGwI0XSaDXlHw+EHqQE8
 cXIb/M0XB5RT+H+sO9PfB2LJ2x5NfvYl3wAB8rz7OVAG+JkCxJJu6Mw+aZyfP4mYE3Uq
 G/KsqDCigLSb18ze3RTWwXMvEWeHP6LHtu0T5yUB30OGm/H7zKKztZibHLWROkuTrgbe
 tmtOWYj5ExLlqaMFRs1p+8/J7P8JeDDDjQNErGJ+bbkfGX/hrO7JghwZA/o6Pv/LlBCk
 4QzA==
X-Gm-Message-State: AOJu0YyJku2kL+mRhN/gTL/Ik0u9/j3Xo1z4mcyizKZ2UOXi5or4HwO4
 3T94IwyJSiiHqLHW89hhF9uMtfUQgMRqBnmyt3x9YawVKZeJ59yFc4tGOzRyYZErUHc=
X-Gm-Gg: AeBDiesGwsn5T3Udn2yATqdO/dXLGKb1Foqm4077+2uMtx47qh87mu9k647DTssDp9v
 hYJSGcnaISGSLh5NjTGzFW+5GkLy9wmBHZcsGMhFHcpcR96VEyMFBgBhAemwakC2zxyzdrVbfE9
 abQCZ6e/cMOgL6EPSgQwJjCady6RVHkBrPnbZFcNH7wRutL2zmLJkAXW/y9HyVWOixBjKETxZ2Z
 RiRzb1QfXM1FyvhDA9ezW/zj/+3JIj1H2x9sdMatqkzj2m9QIdHQMpst39trkxYnEJLvolHPUCc
 Wl5VGlWtcPWTSsNafz3Q20H6pQaZpYvFTjvCngm/U7naWZWRXiD7pa0RB1c+lPe31wuu9JnfAOF
 fvkyARz2IWd64Rc6/YbyLOKQQitYcj8NOkgFhMPwNLVAWCl3YvMpOh0CrVJkmC2rdCYLa6TVkCr
 3F2geAx44NVyD7uLh1kXD7BejQalvk7eBZ5RKaLjMM
X-Received: by 2002:a17:902:f551:b0:2b7:9ed0:4f92 with SMTP id
 d9443c01a7336-2b79ed0505amr160356565ad.32.1777210829465; 
 Sun, 26 Apr 2026 06:40:29 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:40:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 08/84] fpu: Drop parts_pick_nan_muladd
Date: Sun, 26 Apr 2026 23:38:45 +1000
Message-ID: <20260426134002.865628-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Use partsN() at the only call site.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c           | 12 ------------
 fpu/softfloat-parts.c.inc |  2 +-
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 98ddc00936..e5d8b9573a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -779,18 +779,6 @@ static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
                   FloatParts128 *: parts128_##NAME, \
                   FloatParts256 *: parts256_##NAME)
 
-static FloatParts64 *parts64_pick_nan_muladd(FloatParts64 *a, FloatParts64 *b,
-                                             FloatParts64 *c, float_status *s,
-                                             int ab_mask, int abc_mask);
-static FloatParts128 *parts128_pick_nan_muladd(FloatParts128 *a,
-                                               FloatParts128 *b,
-                                               FloatParts128 *c,
-                                               float_status *s,
-                                               int ab_mask, int abc_mask);
-
-#define parts_pick_nan_muladd(A, B, C, S, ABM, ABCM) \
-    PARTS_GENERIC_64_128(pick_nan_muladd, A)(A, B, C, S, ABM, ABCM)
-
 static void parts64_add_normal(FloatParts64 *a, FloatParts64 *b);
 static void parts128_add_normal(FloatParts128 *a, FloatParts128 *b);
 static void parts256_add_normal(FloatParts256 *a, FloatParts256 *b);
diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index 1a2eb7852d..e1ce2be924 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -696,7 +696,7 @@ static FloatPartsN *partsN(muladd_scalbn)(FloatPartsN *a, FloatPartsN *b,
      * off to the target-specific pick-a-NaN routine.
      */
     if (unlikely(abc_mask & float_cmask_anynan)) {
-        return parts_pick_nan_muladd(a, b, c, s, ab_mask, abc_mask);
+        return partsN(pick_nan_muladd)(a, b, c, s, ab_mask, abc_mask);
     }
 
     if (flags & float_muladd_negate_c) {
-- 
2.43.0


