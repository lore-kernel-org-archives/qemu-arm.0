Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2232FF885D
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:54:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzpN-0007Fq-HE; Sun, 26 Apr 2026 09:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznc-0005da-Be
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:38 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznZ-0001Lv-5t
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:26 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b461310af5so36495715ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211123; x=1777815923; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ghHQqqdOPpQtj4mRafd8WgiwBSS9PBadyD33IANm2ps=;
 b=JT6jexr7hD5wgc/xRMesK1A1eZSIW7cvElDSj0Z6AdLmZVia99+ttF4bSeEb88hORV
 kX+CT7aACdbeSLfA2weZxJcR3Qip6UiX0pJJCu9QRoMBbGgFN2/EtQhJaToMlDvRFbps
 vT1Iv0TKApzZwOs6U6j1Pv+V6cleetDSZNy8j/uxrdAJqRd96pa1h2LvDs1CE/KYTLOx
 KAfpihx3WGwn9cqKaDD0ElA/UqGNThKldngID/ALpRboEyTE+P7P44k9ZxkgT+Yrh7mW
 olk7ukqORepGn25wTjJ5MGFb8YdsdgaT906LCjJ8obiVX/ofC3FO3sW+KO5kvLWClvtR
 VzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211123; x=1777815923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ghHQqqdOPpQtj4mRafd8WgiwBSS9PBadyD33IANm2ps=;
 b=qWUm5uziFlFlMk6k5z254J++LCULaE0x92jW0AoP/kwM9m601+yyHEDch7vUk5nNP5
 c11wgS0M1upVcJVti2uXhzkoRJ0rTKawN8Erj9QcR3+PSf0oRjLd1v0yaohn0D5ImfjB
 bpHqyZqXcz/yPm7LR3P8PdNPj1iOcu6+1JPZh+HpKnRdDBzf4ZUX7SMdkyYmvGTo6fEc
 fPvJVUCiZ9KFvhFvn05X0UmHw1BAJPdi1brgb+t5NTVE6ysf87oTuxg4kwr0JThxoRUK
 KP6pIHbLW7uC7HOGJ60H9dYIU80yT02bSlzH6r8ymDRLZan1LWGXd9zOe8+JFMcNldsc
 9iSg==
X-Gm-Message-State: AOJu0YzhM8UAwQfURmIdg65mujI1in73Pfy5esAsDy5BREzwLjYzic1B
 hsM7RFbHKEaswo3IlZiLSA0o79fpPne2i5KLyNgRgPAWcFXT41ki1/SRgmGwKCZW2yZUkU0ngg8
 zAxFVugg=
X-Gm-Gg: AeBDieuWlKZJBSkANbCZwhZXHQGQvKpwyAv6j8qAMM55kcjHM5o3VXabWs23zKEDc4z
 xziiPuQVQAKl9WIObGQF9RjVSEjrOvse3zUGd4hO5tSfS4eBVE9m3WEceGFWG5hPAZaSfb/zX9G
 J1A5JErvX3jQsGLo/2uMbkmx/hTINsTxm27yopuaBuwlUk4HGINADP4h1bmETMo67c/kVLsVT/b
 9hcuZ3S/Af+0UTsSmHyFCBIMUYjfzclD9Jt2u6dryGT/wV8hOJ9rADFRhE+/c0OQJIVf1AGkRmy
 GUvUlYvCZ8s+3WxKoYm0nv9K9b2wGijJFAmR8WhT9uLiAFSmEuojD3/JUdwTy1vUCl6k26z0VF4
 1k6+fSazNDRjaJbTY4dgDZolcK24uadtab5OLgsOXkw1wtI6F8vvzAvfLvzJ5t0BsbaxY9iCUWv
 44YzfayaRHkZOOQdH4sC7vtpeIgPnd+Dl02j8GpoannqQkCbMFP1Y=
X-Received: by 2002:a17:903:b4f:b0:2b0:be79:e521 with SMTP id
 d9443c01a7336-2b5f9edef17mr338946705ad.26.1777211123431; 
 Sun, 26 Apr 2026 06:45:23 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 49/84] fpu: Inline float8_e4m3_pack_raw to single caller
Date: Sun, 26 Apr 2026 23:39:26 +1000
Message-ID: <20260426134002.865628-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
 fpu/softfloat.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 5d58caf5ea..18f2ca900f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -673,11 +673,6 @@ static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
     return ret;
 }
 
-static float8_e4m3 QEMU_FLATTEN float8_e4m3_pack_raw(const FloatParts64 *p)
-{
-    return pack_raw64(p, &float8_e4m3_params);
-}
-
 static float8_e5m2 QEMU_FLATTEN float8_e5m2_pack_raw(const FloatParts64 *p)
 {
     return pack_raw64(p, &float8_e5m2_params);
@@ -1474,7 +1469,7 @@ static float8_e4m3 float8_e4m3_round_pack_canonical(FloatParts64 *p,
                                                     bool saturate)
 {
     parts64_uncanon(p, s, &float8_e4m3_params, saturate);
-    return float8_e4m3_pack_raw(p);
+    return pack_raw64(p, &float8_e4m3_params);
 }
 
 static float8_e5m2 float8_e5m2_round_pack_canonical(FloatParts64 *p,
-- 
2.43.0


