Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B554F45A0D
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 20:07:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBI8R-00032j-JU; Fri, 10 Apr 2026 16:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI8P-0002tg-SH
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:07:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBI8N-0008UK-Pc
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 16:07:21 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so31933585e9.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775851638; x=1776456438; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4t86J5N0/PJWFmj1OvMCcQzKaGJ/HQALx536x36Hyc=;
 b=TjnMxIf/qNEsGj9s3K4vRY72dsH80ltv419suC336TKYeIHTLmShuPQqB4OfnAchRS
 7Nf8ZGh+15rKRtUd79ssQelZBCfklWYCxfZpx+ly5fiGumdXX7VcBUaY+q1z42ICC/Fz
 sHV8BLmxqU6fyssdCExOdJIEL87fz+oydY1aD4Lmd3oeXMONJ9dyts0BumKy0GUJNpQ/
 dr5lZwPo0OML3RJrs73wmKPwpNwtgWhLyl51yeS3ILTVTLDIggjInfPUvDqHUDuQr5Ug
 pww+gIN1s6o8arFz2IEe4686Jd69+PGV11Xk9jpra+z1ozhEwI/Sh4WV2WB2VQTjXQLq
 oHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775851638; x=1776456438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P4t86J5N0/PJWFmj1OvMCcQzKaGJ/HQALx536x36Hyc=;
 b=Bd8pkp+k/mRTBPwEta33mr4GOvbPg37ksGpcGlq2giASlyITdPqS179B9Ng8npYRs7
 La/SXDhYmKWJoRZZgNZKHK897YoePwkjGgk6dFgCWvzOwMWJOoW9FHCWaER0LHfX105U
 Iu9/dbngP0QEi1M/t+NcFwgwksu6bp1S9ylBS7XjgY2v8Prg7ZvKMIQxEaL5tkg9nnDO
 oAROKHhoAtz3Lg+w8GUBAYAe44duFX1cnp6P/hr7I8teX/KR2KYGUuc3e1xC4uQxAnKA
 Moc8KCGdOubTC7IGxAoVOPfYKv9jPgb1FQhrm7WWMICbBEMgb0t28vUGRtWvVR3fz+Nk
 J7Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiuMtbiZId7X7XGbkMFUfGMXsfB+4CM/XFBWDPlJUhcRwi2S7g/Qos+R+sGsqBgi6lMGJSCKo7tA==@nongnu.org
X-Gm-Message-State: AOJu0Yy69Jpga1BqMR2Ois1uktnfC/TJj9Izia4ciKy6xZ/3bhtUCWrc
 tLUriBfnHsR4PIk28Oa9nJdmup3STo8Xu7Z++Ky13VNUF/H8QWeQYsBKVS7tkjnJVBNXJp6DpfQ
 nQbD0DmM=
X-Gm-Gg: AeBDievGCKgUbwuE3LfYswqIDwC1yvOq9zeK+Z7O6VTgM8O6cwBXhiid+uO7T9+k2uS
 P7d+gSNHSV9fMMW79FXU0TLPXJNaYDYWi1QJ6l7eV43wcD9AfPdDpyLtbiYj1XrAfN4ab6dJS67
 jvGWKC8/VCW6MkNjCmEoZJh3mjzc2Qbe2STj7eyuS4mVZZlWjvIKmK4IBeSkQw7PycWpTjLy/ex
 y7XHw7zXorLhUWZPqlB/we2PGCeJpxQ+kd6il/wdqm2HAIkfCaKbZ7JoTgBPjOerWMHtptsQ4B9
 btalsnMp31FK9gAOt7ivOWXaUcETyHjfDOMLY+WcrhDtLXWkwkIP5PRvHLgbOXt2u2GoEgIWnu7
 GDVtlhJYRb+LTRby1etYL99OrYKyzZR2akAnm7OkjutHZU5rNFFXfZAM1MPomtbF/fV3z8rkcNr
 M1Lk3L4KJTCqJl1SOmZMDvaLf3oYkQxX3RaNnKCXWyBEgGKasl8YpaQziPTOBfO8yxr/NBQxio
X-Received: by 2002:a05:600c:528f:b0:488:a82f:bbb4 with SMTP id
 5b1f17b1804b1-488d689d0b8mr58824535e9.26.1775851638020; 
 Fri, 10 Apr 2026 13:07:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5734a94sm89632685e9.0.2026.04.10.13.07.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Apr 2026 13:07:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/9] target/arm: Compile mve_helper.c once
Date: Fri, 10 Apr 2026 22:06:26 +0200
Message-ID: <20260410200628.19378-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410200628.19378-1-philmd@linaro.org>
References: <20260410200628.19378-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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


