Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B2EFB5181
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:31:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAo-0007cC-W3; Mon, 06 Apr 2026 22:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAl-0007Yr-IH
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:11 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAg-0006yf-7I
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:10 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2aaf43014d0so31854355ad.2
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528884; x=1776133684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=kwIbC6HJA239b4Lgwzm1oyN4X79uPRSb4E9gQWvxJwwKfjMv5G/n/Sxwe57kUUKkOh
 YKEuqW68MuUqv24kWKKp0s5bKaJsObnkOJVJ082wjXbYVI0napgVjsJSlQrfc3V1Oph7
 OAuhUlUta2WDxqu5PUPCTfRg3G/BisI/AI7Cs11qwkBs0xin4K2+Fxu7SY/x6E92bqyy
 7dLX6B27Ofl1Oq+QaK0GviImHAWk0o8KUeP31goB0VZWLBXPXosQp2Es4Z4Uz2UXzKcC
 +8Gzssc6QfeMrDkTDiTrduad8dBsHKKv3NoMpQZhqifZVmqVECv42LYPwwALqUOy0NNT
 tyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528884; x=1776133684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FGhpyO9gJO4O10TYeQgNeX96IysIFLL6455aGE1zsuw=;
 b=Wyi8xwY7yUpCr9gWAdXsCeRWBe+upAcFvF7gM+vhm/hAhEU4HEcDZPvWvJ2Yb2tHt9
 gqyDxfjvlTHD4DKza0xT/JZkLqZ8wPl5O1nOKGW0GushFi8eW9WsYvTii9nlwK558NKX
 53riSmBZL131TiMu/GYWMqJ9pVFPIIRKmyTGr1k2HiGMH4Cm61RXkAMA2nqSmL2t1TnQ
 Ysm7N+k/pgNvn1xWApXAUzulp6LNLdGKxaGjVV/cwHwzq0hB1ngjithuFi43jnqIO6hN
 vsf4VnODY1+KQC2EKaGPZN9IUpYCa1vSK7eQWmzVJfaYyT0DRuoFb6x2U3MeKLVvonHZ
 lzYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkShq0juMdNVGnYkYU5P69ZLni6HBOPlefp1ugaC+bv9WNvW684M+CkJ1C8VSxAnny1ReHNsPjtQ==@nongnu.org
X-Gm-Message-State: AOJu0YwlT6HPc5qUe1g+fgPggrmCix9BjR0JwvughLJE34B3ftowRIYb
 ii9XSSlswA39RUjJRiUbkWM3JPFJgko7XYLGrvb23mTuBbvWlfvOcrJacE6aHx8R+Vw=
X-Gm-Gg: AeBDietB5qev0tLuyY3j2uDrZ5AZEsrGPUqwHCh5T97DH0eWj6lo6peQxfLVSGwcANd
 hsVMs3mBtzqLCi4kGt4DlF0YcpsqTV644IWHveWvDVAEmv01khKBg0p5adjMAhkc8bDSWUdnC1r
 tqNxAS8GlD/ebibQGROlQ9uHQRFrBXBSR6jEh3hxDWuIHFz87uw7RFxMm1nNfI200OdR98S1hfP
 rhbRTk+yVsRT4yeIF7itCUaO0lVGj+WlyjjYTvWRcMTlGFLG4RomhlSZEibuYJnXQ5cs88u5Ls7
 GZSt/y0jQDQE0Y+4jeVy+l/1SlvO9plnz2CeFqMNp55zarH229o2RLMOWPW4dtELJ179VJC6Qm9
 Wumiu/cRn4ObEv2HQKhgTOtFpPcAg9MogXHXTy6kiLepDY6iFv1ZDW2FcAX1/pMXKPHGlQCP+S+
 Q2NwPaCqOXRErKyJTiRtljXGqItNXd5clkrks/2Kmr1vU8WaZYiCP0ZPcvOLy63iohXT4qXCsZF
 c+F
X-Received: by 2002:a17:902:e845:b0:2b2:6df1:1108 with SMTP id
 d9443c01a7336-2b281867961mr158078725ad.15.1775528883807; 
 Mon, 06 Apr 2026 19:28:03 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 09/20] target/arm/tcg/op_helper.c: make compilation unit
 common
Date: Mon,  6 Apr 2026 19:27:37 -0700
Message-ID: <20260407022748.57629-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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

Remove unused header accel/tcg/cpu-ldst.h that has target specifics.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/op_helper.c | 1 -
 target/arm/tcg/meson.build | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index aa14f15eb62..75ad53ec6c6 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -23,7 +23,6 @@
 #include "helper.h"
 #include "internals.h"
 #include "cpu-features.h"
-#include "accel/tcg/cpu-ldst.h"
 #include "accel/tcg/probe.h"
 #include "cpregs.h"
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 70beec7a6c9..1fa26670587 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -37,7 +37,6 @@ arm_ss.add(files(
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
-  'op_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -74,6 +73,7 @@ arm_common_system_ss.add(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
+  'op_helper.c',
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
@@ -93,6 +93,7 @@ arm_user_ss.add(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
+  'op_helper.c',
   'tlb_helper.c',
   'translate-m-nocp.c',
   'translate-mve.c',
-- 
2.47.3


