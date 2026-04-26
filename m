Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E545FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:46:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzke-0001Bm-Uu; Sun, 26 Apr 2026 09:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzkA-0000LC-9S
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:56 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzk7-0000Ok-Rr
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:41:54 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b7adb38d65so31850045ad.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777210910; x=1777815710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnjcB1gBfeizDNAfTlBZ6J0qkaFcfzSBWKWwURL1leo=;
 b=Sn6X45fdavGrS8+K0nmPRXsb/mNKnQ/zvdZGJ6ATLou3EJyMaBcFoyVJNCRKvCz8sB
 Ov2YIVJGlqW47CGd9V37pi2oxmPD+KJnkOTcaiLJWCmhnnn/x5GK+w8R0pnEeqZskpX0
 M5lIbQKraY76TTLEiW+fP9mzYYg6RLsj8fBlR7LbBb77ppgYUe70MFHSIdWM4oSyePvI
 YKUQ/DIsKYEDWh8UjECE12qpGUOIf9na03nfYk3/ZMVpk5K+31uAnFOatM/qwcRg2e4f
 2uPUH+cJFLmCfWIKS/P9EZ4lq7356BiC6Cly6SlxqRYD0jzKJxxBEBNuLSVFKKriTgmW
 +lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777210910; x=1777815710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZnjcB1gBfeizDNAfTlBZ6J0qkaFcfzSBWKWwURL1leo=;
 b=TOVI8xuQMWIQODiVpFqYOxIn9i9MZGWBBQi3xvTxPWYoRO69gioWjCvXT7LmDfaQEn
 rbTpS+tirdUsA1wY4GLk48p8LGadchNXVxavDxD8pJ8hvk0Qb1liUn7I1QQ7UJ0ir2Gz
 cAVa0VIKQSnukmHh0FEUdHGCpOPT37PU4U227LfNyY1z4SaRuOVmTMAD6DLOSON4NXnR
 lXBkkETNmmXUUHaxYYchrtDNdC8CJ176AJsGmxTozwkIfZX2YcsdBK9qaGsEyC0qaQaX
 iJBPsgOV7ciYTFXCBYmcYe585aDKk/8kRNCmFfzKR6jE4Q427cOdtzdufTvhIYBb/sY0
 ElKA==
X-Gm-Message-State: AOJu0YzsqgQ78eVfDNbQLZ3BBPKZVmfnHfPDb5p7uRCn2vbcy9tvkmWV
 P5LhSjpce+q2zI/MHd1rg9PNXUPQdbKGeGXtJ7l/wO42XPtw5qwpBP9KZ/ONM55L7R8=
X-Gm-Gg: AeBDievQEI+42NR0AxSLAbpSU1ptsH2lgpzQ6mVYyvsyKO+dHXtYzn1Wh/LtkfCrq19
 VIBvJXMv6Wqv3wpXklGnXIh1ilVYHw998UR4B82E/XMF7rTFiMn/Vj0KGopOx/bepYZoW5E8PBU
 bsJruW4obbKE8+JktAoaVz1V8rnkctjwT/7+m+K59Ao9stEqL7nFxpM5vK9aLcBtWsykL2MxPJT
 MbQxRoDN9ndJVhxCgrbkR61worMeFKzLcdKezP8vP6yPwYXpmxytH9WSlc0tEZS2zyWD8GNgYhK
 vO0XkEyOP/hgs8kXfNzXvQpIdf+1kc65HGL1I/lm1X9YiiRnL88OqJI81QBrFPHpQUc6g2ahqZh
 cxH5qKTm0tZ9YPSRxV0GW1bxW8P/t08+LKvMlc3slCjytqUsRB6QwNztM8TK1IfzC648zVuf5wO
 ARglcanHA1SGkaApPZRYKCiywFnKzzwHcj0xMdH39P
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id
 d9443c01a7336-2b5f9f3a802mr451228705ad.27.1777210910481; 
 Sun, 26 Apr 2026 06:41:50 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab30f29sm277940375ad.68.2026.04.26.06.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:41:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 39/84] fpu: Inline bfloat16_unpack_raw into callers
Date: Sun, 26 Apr 2026 23:39:16 +1000
Message-ID: <20260426134002.865628-40-richard.henderson@linaro.org>
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
 fpu/softfloat.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 3612d2fceb..566154a729 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -646,11 +646,6 @@ static FloatParts64 unpack_raw64(const FloatFmt *fmt, uint64_t raw)
     };
 }
 
-static void QEMU_FLATTEN bfloat16_unpack_raw(FloatParts64 *p, bfloat16 f)
-{
-    *p = unpack_raw64(&bfloat16_params, f);
-}
-
 static void QEMU_FLATTEN float32_unpack_raw(FloatParts64 *p, float32 f)
 {
     *p = unpack_raw64(&float32_params, f);
@@ -1490,7 +1485,7 @@ static FloatParts64 float16_unpack_canonical(float16 f, float_status *s)
 static void bfloat16_unpack_canonical(FloatParts64 *p, bfloat16 f,
                                       float_status *s)
 {
-    bfloat16_unpack_raw(p, f);
+    *p = unpack_raw64(&bfloat16_params, f);
     parts64_canonicalize(p, s, &bfloat16_params);
 }
 
@@ -4974,9 +4969,8 @@ float64 float64_silence_nan(float64 a, float_status *status)
 
 bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
 {
-    FloatParts64 p;
+    FloatParts64 p = unpack_raw64(&bfloat16_params, a);
 
-    bfloat16_unpack_raw(&p, a);
     p.frac <<= bfloat16_params.frac_shift;
     parts64_silence_nan(&p, status);
     p.frac >>= bfloat16_params.frac_shift;
@@ -5050,9 +5044,8 @@ float64 float64_squash_input_denormal(float64 a, float_status *status)
 bfloat16 bfloat16_squash_input_denormal(bfloat16 a, float_status *status)
 {
     if (status->flush_inputs_to_zero) {
-        FloatParts64 p;
+        FloatParts64 p = unpack_raw64(&bfloat16_params, a);
 
-        bfloat16_unpack_raw(&p, a);
         if (parts_squash_denormal(p, status)) {
             return bfloat16_set_sign(bfloat16_zero, p.sign);
         }
-- 
2.43.0


