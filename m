Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7879CCF9EE
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:53:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE61-0006w4-SX; Wed, 29 Oct 2025 17:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE5z-0006te-Uo
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:52:44 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE5p-0007rr-2W
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:52:42 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so376617f8f.0
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774747; x=1762379547; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WnP83I4Pbpr8sS9CrOTJFfkYpAE0M6v2XmUQlH30ozc=;
 b=wNv6fBoH5NN0txuVk/lQxwlmZ4oCYELve6TRP66DRFT6wI50Uf4VOqm5F0i0yoTxc2
 qfycrMjKCjh59+NHig6aQ4tR9qjrfOtMl9AWvT2EoOxU/86JMSam0Dc53G4acDLHInFr
 nKbCEqfqgkObB9aTEgX/Dh9m7nKqPL42HPSVzqZ0Dcwpecsa+ZUbZBHz6w0y5QFC9jsp
 qTLfZhdToyeTtG0h/LGbnQD0MVbmNjWSAi+xrdEeX5WDPYp9B+ug9s1AknrS3t/UaVSl
 /Y/Ei2WvgW1KxhiIPo63Hxr5Qr8j9Nt7HC0ezcMWFLcWKdyAqRICXeWmmnY60XF//lpg
 xi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774747; x=1762379547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WnP83I4Pbpr8sS9CrOTJFfkYpAE0M6v2XmUQlH30ozc=;
 b=qWPa1lXVNnzhn2vNIAp0vQdNz8rS5NfCqcxRJ0pjU7v4QlFWvlMSU18EFV07ExtCEY
 XKDSqKDTG3xAB7xjWEPpYtGTidNx6OO9dK8HypVIkMkMgO5PIqWP6SkGiGhVg/muvunA
 3YgfP9hJTAGGKWDc96/2ti3J8Frvn4/oVjJPszXSTibk9FKPWd3rncTvbw9b+0lTPqkC
 SY+QEuJ7QFRy9jyECbM4FlK6MjkYClkfYAHBqyLk+HSheWwWfq/bmUWYOuEEYD9eE6MS
 S9tI60Zi2xtkITiYgakJPfB5x79K71l+MPs0FI/b61EY/H53/dM8rClrzLr7b5Qp8V/B
 j7Vg==
X-Gm-Message-State: AOJu0YwbocpaWuFn/ZKCUKrd3RN/GCm7v6zNX9wOuN6PbbwPez3fonHk
 v8hp1SUoGgXndzI2Ywnpp138LctOBgqL1zn62KvuYdIOxLBt3M29CbVqTfJxesHo2M7p+bX1GRc
 aEYW8K1s=
X-Gm-Gg: ASbGncvh0rSiaO/PBpElYTpFO8JhTrAP4luJJWiP2iRAxvL0MYj3yVIsAkRYaPHbHur
 W9qNXgNjdXGQI1/me/5dcCyfPFg7Yk2SgDZP+n5gknMvW1A+E/+s4KVbb4tzdAyUYmYEW92KTrr
 xA679xAadF3+chUuaUbo7LI1f6mupiYGzVJnCSJ1J5wi48ds2r9s9gF72zrqWOaxGBQFYJO41OG
 pXqNsn+PtKWmYxODdwrnM/hyb3sHS9HsrOHyLneaghpyzor2gWfS67u2WC3dCDDpsWzuHMZF1kt
 q7vUUHCQMxu7HaaqGlKiK/TB/yaS3nWu6fnoeQ2yHViy2Qvp12lLUoaXJ4viW49jFjdZoDC+evz
 RDUxRZmRCIi71oNoIcLZyJLZoojOXKiku3aHna5E9VscxD9vdZtloxL+2aFpksTCj9JLpt/vgav
 82dmnA2T7T1kBH7TkrtZQHpUp3m3dYHPfu7Oxpl/Vb6olW0qvchA==
X-Google-Smtp-Source: AGHT+IFcd6kRynCCxxcZRTAiEZ3OdFwV9UPoUU8KHKUZBm3/Dcd0dDlwAd2G33/Db715ibOYStxFMA==
X-Received: by 2002:adf:e19d:0:b0:429:b55d:25e with SMTP id
 ffacd0b85a97d-429b55d20bemr422317f8f.19.1761774746969; 
 Wed, 29 Oct 2025 14:52:26 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47718493c61sm52654575e9.4.2025.10.29.14.52.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:52:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 12/23] hw/arm/virt: Replace TARGET_AARCH64 -> target_aarch64()
Date: Wed, 29 Oct 2025 22:39:49 +0100
Message-ID: <20251029214001.99824-13-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Replace the target-specific TARGET_AARCH64 definition
by a call to the generic target_aarch64() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210144.58108-4-philmd@linaro.org>
---
 hw/arm/virt.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d3809754460..dda8edb2745 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -32,6 +32,7 @@
 #include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "qemu/option.h"
+#include "qemu/target-info.h"
 #include "monitor/qdev.h"
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
@@ -3263,7 +3264,8 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
     if (tcg_enabled()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a7")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a15")));
-#ifdef TARGET_AARCH64
+    }
+    if (tcg_enabled() && target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a35")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a55")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a72")));
@@ -3273,15 +3275,14 @@ static GPtrArray *virt_get_valid_cpu_types(const MachineState *ms)
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-v1")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("neoverse-n2")));
-#endif /* TARGET_AARCH64 */
     }
-#ifdef TARGET_AARCH64
+    if (target_aarch64()) {
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a53")));
         g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("cortex-a57")));
         if (kvm_enabled() || hvf_enabled()) {
             g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("host")));
         }
-#endif /* TARGET_AARCH64 */
+    }
     g_ptr_array_add(vct, g_strdup(ARM_CPU_TYPE_NAME("max")));
 
     return vct;
-- 
2.51.0


