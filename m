Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5A5FF8863
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:47:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzol-0006Nq-CA; Sun, 26 Apr 2026 09:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznn-0005gV-0W
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:41 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznk-0001Oa-37
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:38 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ab39b111b9so37864715ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211135; x=1777815935; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Mxa4m32oeXlXCbYEih/Wgv7PsGE1aRsWYB+Y9zn5Ik=;
 b=Loc8+b9VCzYzhT1T4NdsnUfNmALvNn+2s/xfEsAiH58WNWA3k9Z7EyoQl3QA0twF78
 gL6WqBMfYHKqJEH9T3HXqAwMohpGUGLyRiGEwOiTl3KmhlE0Ir6aJwAUyfFh+VXV7lSF
 aFY79KWuMA9Yt9Hu/L6oeEZ3aYY50/VkfkUe3wB9ZQHH/cC7eTMH11l3+GJhZs/meR49
 AdZ3uMaK0bypo2us/PoUEC8JHjPWf2h9/94vBmCzZQZxWcU2WddY2AKg9LGd+Rx9dcmX
 50800QE++Wd5ckA634H/SUSBMOndS8B/BA4W/7C0UjmKWHk7p9IjtA6zpKfO+j9H73nF
 Tg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211135; x=1777815935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4Mxa4m32oeXlXCbYEih/Wgv7PsGE1aRsWYB+Y9zn5Ik=;
 b=dFpn+UYfN6lpc3eNj2IH7tEECnqd78HvRpBS8BuHyfpSwTWiZwkjlLoiJJ37QErsgd
 1iIZ6scwb0jJWLlbyfUqnYF1SYQYXRV/Wz8BsbOiGilaxsgxHo+T34tswctX2TNcB/dn
 iQrb0WefyiWzkp59LYgI7lnRrqh8+58nJVcXs8e1NeJKQnnK95UzurOTnJbhiTz224qu
 BnBT/J1HbGgSiz+wPXUdvRN3Og8HWBIAqb+G/veuljbT1HlE1wIAdikXHaHng0hdsQVd
 6GTTuDdvLmlQNfgfJ+8cq6vvfwxtFGOYV1B3A57O3nW9zpzM9SUgnNSqdDuS6LveU4W7
 cIcQ==
X-Gm-Message-State: AOJu0YxiIngf6XQ47j0h6Nf9jnzEqBVl8MFvAu9YydWyEomsjIWg/mnX
 1/BDASwp5UBLtzLcygxKdkC8tf15GLwYV7uUF8NeMTeepz+0ojJGXeiHuWfx9AFdkDU=
X-Gm-Gg: AeBDieuA8y1CM7Z6hAeRq1Wo1wMep0RXGtJhVt/pMVV61XkI4ti0VvPIISPO0FruupP
 szQwtR3KCvlO39K+UlSQIie0xu+6ah3OAy7qR+gCGsyw88luCFGE7JJw0yj/gviAkyaMtIWVdHg
 tEmoXORxJaRr2Vba1uDRFyNk67uyH65H4D/tY9bDWTAq34CtKFioxqZUPmOGSjGV4BQoh7k0FKT
 vdajXmYiwBMW9/ix8MLzxj3gbEsLBSngQtH3uxMh52EaYjuFeU92fbCa0lspPl3ni1Xt0hLCdAG
 fTDluUxtaaQl3X84cCh1xYs84fStZ7fSqBfN+dRceSAFfqHmOWFmTaL3xrqvNngHz46JAStGbsC
 uNXqa2L8fc0+Zei+iBqR8mSgL+G397cp5jNtuy/VMnnx9UiyBOb0kL+2kUygyLhOmviMaBfi8W1
 f3TWTjD3d8+f0Gy0W25sWLrwNvM0sjkp1PLGZ5BJZV
X-Received: by 2002:a17:902:6ac4:b0:2b2:49a7:a5d0 with SMTP id
 d9443c01a7336-2b5f9ea2e11mr308008635ad.11.1777211134649; 
 Sun, 26 Apr 2026 06:45:34 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 53/84] fpu: Inline float32_pack_raw into callers
Date: Sun, 26 Apr 2026 23:39:30 +1000
Message-ID: <20260426134002.865628-54-richard.henderson@linaro.org>
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
 fpu/softfloat.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6d5125eb1b..d1acf383e9 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -673,11 +673,6 @@ static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
     return ret;
 }
 
-static float32 QEMU_FLATTEN float32_pack_raw(const FloatParts64 *p)
-{
-    return make_float32(pack_raw64(p, &float32_params));
-}
-
 static float64 QEMU_FLATTEN float64_pack_raw(const FloatParts64 *p)
 {
     return make_float64(pack_raw64(p, &float64_params));
@@ -1497,7 +1492,7 @@ static float32 float32_round_pack_canonical(FloatParts64 *p,
                                             float_status *s)
 {
     parts64_uncanon(p, s, &float32_params, false);
-    return float32_pack_raw(p);
+    return pack_raw64(p, &float32_params);
 }
 
 static FloatParts64 float64_unpack_canonical(float64 f, float_status *s)
@@ -2035,7 +2030,7 @@ float32_muladd_scalbn(float32 a, float32 b, float32 c,
     if ((flags & float_muladd_negate_result) && !is_nan(pr->cls)) {
         pr->sign ^= 1;
     }
-    return float32_pack_raw(pr);
+    return pack_raw64(pr, &float32_params);
 }
 
 float64 QEMU_SOFTFLOAT_ATTR
@@ -4721,7 +4716,7 @@ float32 float32_default_nan(float_status *status)
 
     parts64_default_nan(&p, status);
     p.frac >>= float32_params.frac_shift;
-    return float32_pack_raw(&p);
+    return pack_raw64(&p, &float32_params);
 }
 
 float64 float64_default_nan(float_status *status)
@@ -4772,7 +4767,7 @@ float32 float32_silence_nan(float32 a, float_status *status)
     p.frac <<= float32_params.frac_shift;
     parts64_silence_nan(&p, status);
     p.frac >>= float32_params.frac_shift;
-    return float32_pack_raw(&p);
+    return pack_raw64(&p, &float32_params);
 }
 
 float64 float64_silence_nan(float64 a, float_status *status)
-- 
2.43.0


