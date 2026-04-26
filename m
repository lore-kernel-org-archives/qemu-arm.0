Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0A3FF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:51:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzor-0006WA-OF; Sun, 26 Apr 2026 09:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznp-0005kM-Jj
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:41 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznm-0001Q5-MU
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:41 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c76b994f7a8so3645791a12.3
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211137; x=1777815937; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/ftQiotywHoX9E8XzX0XwrkoezWs1gu+rPw1xNgooc=;
 b=zp/geZ44w0T0bPk8QitWMKyLuRH9rE6gOLXL6hECF/TlLapTBcHAkdjjvCp2jMZY6H
 3eRiRC45k1duzDufustSewh+smvRj9c7JCDY34fu8qquyYXPnm3zAP09K95N6M90A/F0
 JGxk8vBqs+umyQRIDxTUgoDpxgG5bAauAKV9WSm7TNIwryvqG7dZGG+O3l1LuXZqlUI6
 /gTM3zw82mucJEsDtT2BbWuhsch7i8mT+hyfcG67+kTZM078xg3PMAz2ZLxBDfX5s9lw
 eH8RouU2isd+4v7PNlsae2SRHfwXOYu/LBfg32N43zBzK/y8TLwGv/BXjEeFXsTq5BOi
 iKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211137; x=1777815937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L/ftQiotywHoX9E8XzX0XwrkoezWs1gu+rPw1xNgooc=;
 b=F3u4pk7lj2ciA//ZXCJTRFtLuFcCSAHi2MRhgdrU43Hb+3BFGBridIpUwbpm+OySWE
 ET0aQTRGwk55smqt9uXqkYCP6fQw3bqS+CoXD+mmo06uFSUwjLURuFXf48k7BsO8dvWr
 WPyOEQeIDCEZHzMMO6DYr1vURpMLA4RZocPFaKh23miaYR8ih6tydra3+aJvGGfeK3D1
 ug4pugLdv91ZScP8/2M6Eb1ARZlKG9PCB2ZTFgfTG01L9Jy7YxiF+yUtJzidhOWT0Fhw
 rIw1Q4MHTq5i/9K8fU45n3j9XOYhV277K1DUY3oUaDWGuCFt6FC7r4/ZvgeqdCk6pG2K
 t4pg==
X-Gm-Message-State: AOJu0Yw/Sx6VfmPxQCISJMQTh7dtNU6bFC+rfW/EYNMFSKqBJZDo3bOG
 rbBJk0wKPYErs20uZQBF9iofsHG89V/76pdQZeVn06JKbp3VRzkE8muDkta869wLsZc=
X-Gm-Gg: AeBDiet2BqGwyHPM7k+CP/tM1pokpNWVOyS9riH+w9tJS5uuZjXvPFCo33v3wg+0Q76
 bNZ6zeLaDvvEB4Hhde6xpxBJ2Oceeu4lL7//2M0DKYKyxYbmdloL307AyILc4xU8pDmliuGqFQn
 cFcysltJHcqMS2D1kFrhrcHU71MF4upb+Sl9GgUJVI+y61vGCBuCn0UY04dJCXtD/ckpGjQAg1Y
 u3lwhIMG8W1ThkkpXowiv0bTft1w998cvf5XjEr4G7lLWFuhw2yKfqtgFi//TnofoOpIxBn8b3t
 b73VGVoyRibj+7eydrDB0H518oWDwKLMppfjCrJMPrQCb8gxK6uOL+0LpgFfWiGIfW2PUSRDcaa
 RJzc8BIgkqbVGpXYMO0jPB0LPiRUAaxfOl2lADcCh2+RaY+fb1DxXqBqqW1MNF1UoN1eFzrjEKf
 kGDcwoZRA5aEaZG0jNOmcqYU+Y+47/onkbOqWpNr4T
X-Received: by 2002:a17:902:74c2:b0:2b0:6d33:e7c0 with SMTP id
 d9443c01a7336-2b5f9ecaea6mr315321275ad.1.1777211137204; 
 Sun, 26 Apr 2026 06:45:37 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 54/84] fpu: Inline float64_pack_raw into callers
Date: Sun, 26 Apr 2026 23:39:31 +1000
Message-ID: <20260426134002.865628-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
 fpu/softfloat.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index d1acf383e9..302612fe42 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -673,11 +673,6 @@ static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
     return ret;
 }
 
-static float64 QEMU_FLATTEN float64_pack_raw(const FloatParts64 *p)
-{
-    return make_float64(pack_raw64(p, &float64_params));
-}
-
 static float128 QEMU_FLATTEN float128_pack_raw(const FloatParts128 *p)
 {
     const int f_size = float128_params.frac_size - 64;
@@ -1506,7 +1501,7 @@ static float64 float64_round_pack_canonical(FloatParts64 *p,
                                             float_status *s)
 {
     parts64_uncanon(p, s, &float64_params, false);
-    return float64_pack_raw(p);
+    return pack_raw64(p, &float64_params);
 }
 
 static float64 float64r32_pack_raw(FloatParts64 *p)
@@ -1548,7 +1543,7 @@ static float64 float64r32_pack_raw(FloatParts64 *p)
         g_assert_not_reached();
     }
 
-    return float64_pack_raw(p);
+    return pack_raw64(p, &float64_params);
 }
 
 static float64 float64r32_round_pack_canonical(FloatParts64 *p,
@@ -2047,7 +2042,7 @@ float64_muladd_scalbn(float64 a, float64 b, float64 c,
     if ((flags & float_muladd_negate_result) && !is_nan(pr->cls)) {
         pr->sign ^= 1;
     }
-    return float64_pack_raw(pr);
+    return pack_raw64(pr, &float64_params);
 }
 
 static bool force_soft_fma;
@@ -4725,7 +4720,7 @@ float64 float64_default_nan(float_status *status)
 
     parts64_default_nan(&p, status);
     p.frac >>= float64_params.frac_shift;
-    return float64_pack_raw(&p);
+    return pack_raw64(&p, &float64_params);
 }
 
 float128 float128_default_nan(float_status *status)
@@ -4777,7 +4772,7 @@ float64 float64_silence_nan(float64 a, float_status *status)
     p.frac <<= float64_params.frac_shift;
     parts64_silence_nan(&p, status);
     p.frac >>= float64_params.frac_shift;
-    return float64_pack_raw(&p);
+    return pack_raw64(&p, &float64_params);
 }
 
 bfloat16 bfloat16_silence_nan(bfloat16 a, float_status *status)
-- 
2.43.0


