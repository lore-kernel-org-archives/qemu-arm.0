Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40F9FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:51:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzor-0006XK-R8; Sun, 26 Apr 2026 09:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznl-0005eA-3L
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznj-0001Nh-LX
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2a9296b3926so54891275ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211129; x=1777815929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6nFkQ6KIlNZ8kekfBTy8MBT9tZYGdlcL2ADdOiZc9I=;
 b=wR5nZyG+zXlCj4BgeRgYoB5pE8+GzvC4wMS0Y/HPiC6x5mM86A1rCvDgvKkErH23dP
 bsY1w/gvSzsaB4cLJgVkLsE9EGBpBNiJQOiwdPOsgHHQrrVYPCpNGz+LL1asZi4hvNhD
 U/FBTEAWUEfg4hLhpch1CC7RiJ02FQYv4ZRg3oK4cLkQq+0RbtxKq24rukmyIxvGxpXO
 CCaePIiEquLbg9B4eo8bcSdlDrsjP/XHWDzlBPG1VCjN6O0RMGyQkRR0Pri44B1g8pnV
 DkkL+960Ao4yBLT5l87Dv75bm65xTfSxAvi1vKZTxWZ4UiQ1yWFt7vfc7OFbfbluhD2G
 2bCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211129; x=1777815929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R6nFkQ6KIlNZ8kekfBTy8MBT9tZYGdlcL2ADdOiZc9I=;
 b=Eh/AGpLthR3IxV/Pgt7JkadaQ2IF8Aw/GKM/P6AWdIA0Cj+UPStUDMGk1uQL02lLFW
 5f3AkfdExRQuYaCjUk5sTCVNr4GAqDHOrMX9ovmgLDsVDuKru4inP7fseuSLMWR35lPu
 FihzoteDRKz6tj+hi3CH9Upfcce6WnX7HmS53a69UZ2Ki0UQufxjCVuk5vLq8of7IQPJ
 esaMjoAWbICs7WJRnpgo1k1O3lXUNJvfi0hn8m5nQe1z5R7O7+GKgCsBFsCnXUrmHWv+
 XMO5XTPFA9kx1/yn9p8W/RRSYknTCoYhiEuVQzrWCmUpEPaFyQM5DB8QIf9eqqHGBNem
 WsPw==
X-Gm-Message-State: AOJu0Yx//eRpVtb1ti7jOy6E8+FYshyJnUscbyZzfeoIvoX9GCz+20UM
 FP9t9xAhO7DTnK97uefQV0jB3sgFY9/R9Ac/0sAQ6IIwue5SJuVKz4Io12tcC3W5I4Y=
X-Gm-Gg: AeBDievs8xIiFqdWBKmFMO164f9TxniCHRgf15su0KdFfPhCOrC8QvS6PM5altIzvhF
 AKXnQNzNnWaqtyGvovujrAlBqzgHsde0bVfKgt2BWfU7Sy/d0YuIGLaPtWUeRdPV6uS9Yi9bpVr
 g/ag+a6vqyUJetFc6MmXEkTjo5MdkSqKd/tb76eDPcBTl8GO6I9h4UGD4vxQICEWt66rzEzS2kC
 AX/KFJjvNoMOXw5TggQmccAOiMlwMeaml7VkBmK+avTsDrl2rzf2B5Vrda7NthWHW4etPl1IloW
 kQux3xbmgOcEacju22fQ60QrvkVgYqlCB/xKmFTbj0fGRmCWsJPOvxjObcRn9tCPa5aNswsmzGv
 SSXqYIRcVL5QoHmyBVRSzF3Hv025DuGUGMVGhiDYJ38Ur8d8lBgjoLwFH0DY+f+SDuYtKTLqDhP
 nGUpUOOpmKaL5aHm5IUIkq2DBUhKpRPlPzx2NdsiNV
X-Received: by 2002:a17:903:3805:b0:2b0:6e6a:8504 with SMTP id
 d9443c01a7336-2b5f9f539ccmr421099585ad.27.1777211128956; 
 Sun, 26 Apr 2026 06:45:28 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 51/84] fpu: Inline float16_pack_raw into callers
Date: Sun, 26 Apr 2026 23:39:28 +1000
Message-ID: <20260426134002.865628-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5269e5f977..8cfe7f8f4b 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -673,11 +673,6 @@ static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
     return ret;
 }
 
-static float16 QEMU_FLATTEN float16_pack_raw(const FloatParts64 *p)
-{
-    return make_float16(pack_raw64(p, &float16_params));
-}
-
 static bfloat16 QEMU_FLATTEN bfloat16_pack_raw(const FloatParts64 *p)
 {
     return pack_raw64(p, &bfloat16_params);
@@ -1480,7 +1475,7 @@ static float16 float16a_round_pack_canonical(FloatParts64 *p,
                                              const FloatFmt *params)
 {
     parts64_uncanon(p, s, params, false);
-    return float16_pack_raw(p);
+    return pack_raw64(p, &float16_params);
 }
 
 static float16 float16_round_pack_canonical(FloatParts64 *p,
@@ -2022,7 +2017,7 @@ float16_muladd_scalbn(float16 a, float16 b, float16 c,
     if ((flags & float_muladd_negate_result) && !is_nan(pr->cls)) {
         pr->sign ^= 1;
     }
-    return float16_pack_raw(pr);
+    return pack_raw64(pr, &float16_params);
 }
 
 float16 float16_muladd(float16 a, float16 b, float16 c,
@@ -4722,7 +4717,7 @@ float16 float16_default_nan(float_status *status)
 
     parts64_default_nan(&p, status);
     p.frac >>= float16_params.frac_shift;
-    return float16_pack_raw(&p);
+    return pack_raw64(&p, &float16_params);
 }
 
 float32 float32_default_nan(float_status *status)
@@ -4772,7 +4767,7 @@ float16 float16_silence_nan(float16 a, float_status *status)
     p.frac <<= float16_params.frac_shift;
     parts64_silence_nan(&p, status);
     p.frac >>= float16_params.frac_shift;
-    return float16_pack_raw(&p);
+    return pack_raw64(&p, &float16_params);
 }
 
 float32 float32_silence_nan(float32 a, float_status *status)
-- 
2.43.0


