Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9512DF531DE
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Apr 2026 00:55:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wCS3F-0001NJ-H7; Mon, 13 Apr 2026 20:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS3E-0001KJ-6w
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:48 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wCS3C-0000Qm-Kz
 for qemu-arm@nongnu.org; Mon, 13 Apr 2026 20:54:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488a29e6110so54481815e9.3
 for <qemu-arm@nongnu.org>; Mon, 13 Apr 2026 17:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776128085; x=1776732885; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8I8sMfUjE9OPiCjHOtIHvdlLp0H2EpYtT8DnL8qDn10=;
 b=j69XT89ztEFgVIZcfhbIam13lTZGxKoJeXmMrLY2dxuHVrAPZE3ui7XiJsZ2sjY3gf
 BThXeijWRwamveyn8vFnWMds5pgfAyxh6VDzrDGAFENjsQPJ9HBUGXAjsLpq5A8CO2rt
 ck6WW6EDnKpbyi2MJI85dbb0pTTFFXpiT7QcWIssTZGCNta1V5MQIoSotXnQB1lzyzzi
 CrDzp4BPSjI6S7yTu/ygWKJsmPOu3o1D1wR+qLkbRA9e5JTvDWzAANLZ/m6nBpAZRzo0
 +tXXMQAmQ8rWsyHEJptTk8kyZmgixhgO+G2vPWhSfPmJgR7PP8I+2AtINoUcmNuobEr4
 MafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776128085; x=1776732885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8I8sMfUjE9OPiCjHOtIHvdlLp0H2EpYtT8DnL8qDn10=;
 b=dDaFwmv4wFvI6/vD6roAUe9Vcgwllt9nWEt2p/WadCGqTkLqDzVrIXIUb7Kr9jImU2
 V8PLw7N5kfj5E7DEEPjx/qeK8GyE20+/1Ej+Ts3XtJgyorHB2hcacyPnakIUA3CEZFy1
 BenCReBYA6YdP7aRgkOkRZaAimmtA1lKA29mOKT0LdZEgjUZ1Ry/9NBwM7u1PYxIXAtL
 51DdbRHSmX2UUvPcKDv0ZJ6Vwvs+YtJe13mQH59uADPZeOjfdxpP2iYKFbV/AKRwfQHD
 tHO677asi0CeulEwhzMiJvqW6uKKnGGCzR/8d7N1jXDghewa6m0j52c8rjbKBgwMAxB2
 hnwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Hxt6zj/6yqjs4gnikk6sQEvKzwaTEgINA20ZzOZdpRUIDZzHQvyuhzWfJhiZjnKgRwF81C8GWsw==@nongnu.org
X-Gm-Message-State: AOJu0YwbM/mHtrC5jVyDhDY3ww4mWkkJbmiYe0E7K4UC+brk3bSNM20S
 r1Iy1Mu9gJBwkHNvLteTF6ndMXQLwhpNjaNpsZ2xxhK8cLfRfDCb6luL0solVJ560jw=
X-Gm-Gg: AeBDiev0wHcEwG5qUJvwolHfaP+eTcRk6GBzbHqUOV6VHrT/WtcEdBYQS01eihClL9l
 r1EZk9AOV/wBq9WnXPjE/luDWggLP7s3Mx4cz1EY82qEpnCh6Tblzity84WV59E9YfA+DsJ77u7
 pe8aQto0/gYBDr+4Oem08foTR8Jxiq1FFpyF8WWCqtUuW1ambjxGozNps461KSzauBrOcfXB1i+
 U7EZfhD2XS67X7jn0BJJygS7KoPcj9ZsIpxD+PlEu+s6w6zSsNvSxxS7N0P97v87AJQFkRyHzIj
 rVFHb3t7JZZ/cRbBrrkF1EFVa+q8SiK/SeV0x1V6GhDNV2I2A7gdkjYhLblrzWwmOER5g4tYevn
 O/1oQjRnoexkHvrOVSXIDxQtIK/WRQJJegXgZHxGKA9peRDvBkYNYz/P5cJ1fZmuO+qOi8Yk1PB
 pZdzHOI2B3xeri/lW7FQqSu6T33ueVwj+f3W2wWJxc2DUf73ojS3rMLe0nZiBfPZotxeelFFId
X-Received: by 2002:a05:600c:a411:b0:488:ac01:72de with SMTP id
 5b1f17b1804b1-488d67ec72cmr165966585e9.5.1776128084918; 
 Mon, 13 Apr 2026 17:54:44 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ee019e44sm12624915e9.15.2026.04.13.17.54.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Apr 2026 17:54:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 7/9] target/arm: Compile mve_helper.c once
Date: Tue, 14 Apr 2026 02:53:46 +0200
Message-ID: <20260414005348.4767-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414005348.4767-1-philmd@linaro.org>
References: <20260414005348.4767-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mve_helper.c | 2 +-
 target/arm/tcg/meson.build  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/mve_helper.c b/target/arm/tcg/mve_helper.c
index 64ab804abcb..09ae2334167 100644
--- a/target/arm/tcg/mve_helper.c
+++ b/target/arm/tcg/mve_helper.c
@@ -23,7 +23,7 @@
 #include "helper-mve.h"
 #include "internals.h"
 #include "vec_internal.h"
-#include "accel/tcg/cpu-ldst.h"
+#include "accel/tcg/cpu-ldst-common.h"
 #include "tcg/tcg.h"
 #include "fpu/softfloat.h"
 #include "crypto/clmul.h"
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 506f031f1aa..95e9da151e5 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -33,7 +33,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 arm_ss.add(files(
   'cpu32.c',
   'm_helper.c',
-  'mve_helper.c',
 ))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
@@ -71,6 +70,7 @@ arm_common_system_ss.add(
   'debug.c',
   'hflags.c',
   'gengvec.c',
+  'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'psci.c',
@@ -94,6 +94,7 @@ arm_user_ss.add(
   'debug.c',
   'gengvec.c',
   'hflags.c',
+  'mve_helper.c',
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
-- 
2.53.0


