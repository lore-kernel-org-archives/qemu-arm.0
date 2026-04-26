Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013FEFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:49:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzkc-0000uO-Rs; Sun, 26 Apr 2026 09:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzk4-0000G5-Rl
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:51 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzk3-0000MU-Aj
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2b2d3a9e149so48498455ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210905; x=1777815705; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t2oP1AoPp9GVb73a8OxFUw9mtARZFRgHS2lzcILL9oU=;
 b=XYW+Xj+u/Yp2jS8KUoRexC8323XaO4zY3voJnf/O2bXkZfaYzctRww/c3vOqa9yymk
 ZFLIjmF0LXoL+VhLoqXP4lMAB0GUBwXFjFA15Oj+mKSD8XmBFRXWrd0Ntm6pQOYpDNWz
 Uy0jNaR+5jiUsy6Qe+c0IUlZk4sPCNhTmwNu5Z/INRSJmxQL7f83So89I2HCF1kWXoWK
 aG68VPxC37b7s43pbfE/2BueKMo/wME5ZYZ4yvQxS6gda0QApyYjT+KqIPyJ1PmVo5Mm
 5VcmE4LaOXLSeEeP0Q0CoPyBTSjsddqAy/PcwicjuRirofDwT7BlMLt+4I92qPGKmv/3
 hXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210905; x=1777815705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t2oP1AoPp9GVb73a8OxFUw9mtARZFRgHS2lzcILL9oU=;
 b=Y7DgZZLMVyI02+ZWP6tJ0pMTXXkAeY5i0SyUEWBTGNfm1454/vRuTWwP86XzlHWrNs
 oP7wf2agxzx/H8ckbYtMmn5k+so4aE3JHpQoR/i13T2ysTi57OoPWhXkIfycMm3UdjqA
 Fpd7hhPMebshvSf+uxL/1fi0FwlyguP9Ai32u7jaN2TJFZ54BfWcLgLS/th3OdVnNvCG
 7wqeJjfqJJ01qys6Kof8roK+njFvX0pCNMkQ7mz4fcPyMJvojZvT4x/R6Aa3dPS0wOA4
 VvCpLynPCVK2emuLm+6GBeE/ZC8OoAZXNOgD/LCmo++aUc2+7mbzK7dfL+0u81rU624c
 1gKQ==
X-Gm-Message-State: AOJu0Yxoe2i09lPmbBvMrDbjsG9QiysUntZOGMwvBvU8Ns8jEgaVNOlx
 FrB58CPgofFsFkO1aQc9L699rhlZD+NhfB+ZlzuY81HHMTGcVYDT+6op6NoYyHJ3PLI=
X-Gm-Gg: AeBDietuEXF+a7x3af3h+8aiTVhI8Mtxk3HL/+SlX+eQG990gd9QXIr1MRWKNDKVLug
 x0fGXai0yB2EglXq67dYdUBvq4cr64v1vxDDbQbuK65JdPkjDvDSGZcRueOouXZJKgYcUBIq3XA
 AFAer48ve1kVRq/bdeKCLXEq0IIWLQkkUJfy9gq0EvaTE3ehxm6yG/ERjJBpTYK4tMgnC1t8YPk
 AZqFKOG140UqjeLjtAkEFMLvTE8c/85gtnWh4cT8P6PZYTxEZKPU6vGXQ9i34zJboTQ7Cw7KF9g
 Aim3bnNOp5wqnXOq36yUj3VY14afXBpIdpVRmGkL0m71HmoqsR1rQuJ+OGvYbzj6oQ9DfInj6/F
 wTUnKP+7M96swgA6LuhyDzIzXUtFbddY0gz98bl8caqkpQ9mJlj9Q+HgdxiJTCgcAlRQgptgB4g
 snG6iYLbZ7natMSW547ubnwY+qmPxZoz8vaOUUrEFnYebqCatWkPc=
X-Received: by 2002:a17:903:1ae7:b0:2b4:5e85:efc with SMTP id
 d9443c01a7336-2b5f9ea55b6mr335417835ad.18.1777210905330; 
 Sun, 26 Apr 2026 06:41:45 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 37/84] fpu: Return struct from float16a_unpack_canonical
Date: Sun, 26 Apr 2026 23:39:14 +1000
Message-ID: <20260426134002.865628-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index cdf95a8517..dee5dcd0d2 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -1474,17 +1474,18 @@ static FloatParts64 float8_e5m2_unpack_canonical(float8_e5m2 f, float_status *s)
     return p;
 }
 
-static void float16a_unpack_canonical(FloatParts64 *p, float16 f,
-                                      float_status *s, const FloatFmt *params)
+static FloatParts64 float16a_unpack_canonical(float16 f, float_status *s,
+                                              const FloatFmt *params)
 {
-    *p = unpack_raw64(&float16_params, f);
-    parts64_canonicalize(p, s, params);
+    FloatParts64 p = unpack_raw64(&float16_params, f);
+    parts64_canonicalize(&p, s, params);
+    return p;
 }
 
 static void float16_unpack_canonical(FloatParts64 *p, float16 f,
                                      float_status *s)
 {
-    float16a_unpack_canonical(p, f, s, &float16_params);
+    *p = float16a_unpack_canonical(f, s, &float16_params);
 }
 
 static void bfloat16_unpack_canonical(FloatParts64 *p, bfloat16 f,
@@ -2701,9 +2702,8 @@ bfloat16 float8_e5m2_to_bfloat16(float8_e5m2 a, float_status *s)
 float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 p;
+    FloatParts64 p = float16a_unpack_canonical(a, s, fmt16);
 
-    float16a_unpack_canonical(&p, a, s, fmt16);
     parts64_float_to_float(&p, s);
     return float32_round_pack_canonical(&p, s);
 }
@@ -2711,9 +2711,8 @@ float32 float16_to_float32(float16 a, bool ieee, float_status *s)
 float64 float16_to_float64(float16 a, bool ieee, float_status *s)
 {
     const FloatFmt *fmt16 = ieee ? &float16_params : &float16_params_ahp;
-    FloatParts64 p;
+    FloatParts64 p = float16a_unpack_canonical(a, s, fmt16);
 
-    float16a_unpack_canonical(&p, a, s, fmt16);
     parts64_float_to_float(&p, s);
     return float64_round_pack_canonical(&p, s);
 }
-- 
2.43.0


