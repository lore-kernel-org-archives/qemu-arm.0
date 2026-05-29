Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5E3CD6E50
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:37:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSyKI-0006Lh-Gq; Fri, 29 May 2026 10:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSyK8-0006Hm-7U
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:36:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSyK5-0007SN-Qx
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:36:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49048e043e5so61833665e9.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780065388; x=1780670188; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j9by9Ed5YpVI05gWl9P8GGtmpfCFymKnhYv6jHWkLsQ=;
 b=pfim/YkC0aI9HNSc4CTA9giGsE5YlmIFhQeZ2HrPVfQAi3/nPImLsWFm7RA+jhBCTi
 jdqhRTgx3UTVGnbLQuW5w3r7j6p54LtAvN0UrjfllKtTeKHrDMXp/C5ww6lfT+WS8w9S
 N/dC9fnns2GhBuv3FGTH4I/mvW5JUpvg68CFUl5wLd/1gG2cvDO3emCMDCYlC0NhZAPl
 HcJ+IFeVaCUGHBSbGIKY9ZEmXhHCkxRs4u3H4DYtRHkusJOJnoT5r0sMxueK4zsAFL0Z
 tIU+BKyq/Cq4vdZJyD4xVBvr36jDu/NOzUJ0GUieDn7lyCxn1uacrWc5g0ncU50fRG3O
 Ruxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780065388; x=1780670188;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j9by9Ed5YpVI05gWl9P8GGtmpfCFymKnhYv6jHWkLsQ=;
 b=TfEqH4IWj98eserzGA6fbS4e6GHlujX92+ZUU+csYk+m9avXMPUhaChkmRDdiZQtdy
 4fsCjMGkvgtTlo2OeI13cWXrGnh1MD7CPpDjeMDrbYPMByp5DqoPCmstwJYFD5vXDjWE
 1iTuqrcx7T6MTqCuGtdwbmzGIEwatUkemzdweZu6ZLkSItluZe4NSOR2VhCrn6MHtnat
 EC9YUyzogZSwU4J2e6OsetatbjezXzqoPMrfcyp56pXbNj2rkOK0LCyqXzpbq0YSq3K9
 jWrWBxBT6WV70ZAalbqxLKyZxkSGHbgyM+H1T8aj5MOqmK42fmzziTVj8O7GGX3dGfwI
 7W8w==
X-Gm-Message-State: AOJu0YyPCtDULoNrSnJGLqm6iy0ZQSWPfcNeHzAFrEIiSZDrcYkz1VMR
 wr5Op4/nzOyyteLEuoXNgoyw2f+FO7D1Hx6DJXh1UHYvtztHE0YzfXM+H9JbtGu9esUV1cpA/J8
 7Kw87
X-Gm-Gg: Acq92OFB5r42I6dWcBMuefL19Aa0dYyYv4OMcxJ3OV+ivqVcQUCr+x9pqq1ERrq1f9b
 atevWVycpe59J/qhlnXIFANfvwcqO8uMbJNiLISCDR6u3T98x03NnZHETOiZfwSWpddnwE1l84w
 a/Bv8DAgdtu1OMFSOiinskSK95fUjbsb7NlojejWY2UlT+v/71iLvl/WXS6bXaDo4rDsClmNxx9
 CsMcBHO/kPK7Can96GAsHFFrUW9LTC26sUXvD1JKf6CqZ0ONLyjKkhSyNCsUIU3xXF1FXWlk3T2
 H+7mvRRVsau8/F1TdpV/Ul3UzFAJPmFpf0ZuepFawA4CgEUYkybK/BvPjyGHedn40EeN1xJET7I
 clBBU9wpJfYNNRcJY43eaLmcut+3kJ6pVQ8EWhn2rf5FOBrZ4o194bWilmO5uyDvdXk07N2QE0F
 9p4915CgyxRWtDVWbvs0yxKTH2fnK/EGshQJ7NQweeNSWB0TGEBz1lr7GzlFLrbvkyiAv75qD2Z
 yjcsv4tzScNiM7gmgeiKMJGW3EI2TwvOF5qSkQbm2g=
X-Received: by 2002:a05:600c:3587:b0:48e:635a:18d2 with SMTP id
 5b1f17b1804b1-4909c07258cmr59660925e9.2.1780065388120; 
 Fri, 29 May 2026 07:36:28 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef356a4c4sm4180675f8f.31.2026.05.29.07.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 07:36:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/intc/exynos4210_combiner: Avoid hw_error for guest
 errors
Date: Fri, 29 May 2026 15:36:23 +0100
Message-ID: <20260529143624.158935-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529143624.158935-1-peter.maydell@linaro.org>
References: <20260529143624.158935-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

In the exynos4210_combiner device, several cases of bad register
offsets passed by the guest are handled by calling hw_error().  This
causes QEMU to abort with a guest register dump.  These days we
prefer to handle "guest does something wrong" by logging it and
continuing.

Update the hw_error() calls to qemu_log_mask(LOG_GUEST_ERROR).

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3396
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/exynos4210_combiner.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/hw/intc/exynos4210_combiner.c b/hw/intc/exynos4210_combiner.c
index e8cac331e4..dbbdee4d31 100644
--- a/hw/intc/exynos4210_combiner.c
+++ b/hw/intc/exynos4210_combiner.c
@@ -28,12 +28,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/core/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "hw/intc/exynos4210_combiner.h"
 #include "hw/arm/exynos4210.h"
-#include "hw/core/hw-error.h"
 #include "hw/core/irq.h"
 #include "hw/core/qdev-properties.h"
 #include "qom/object.h"
@@ -119,8 +119,10 @@ exynos4210_combiner_read(void *opaque, hwaddr offset, unsigned size)
         break;
     default:
         if (offset >> 2 >= IIC_REGSET_SIZE) {
-            hw_error("exynos4210.combiner: overflow of reg_set by 0x"
-                    HWADDR_FMT_plx "offset\n", offset);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "exynos4210.combiner: overflow of reg_set by 0x"
+                          HWADDR_FMT_plx "offset\n", offset);
+            return 0;
         }
         val = s->reg_set[offset >> 2];
     }
@@ -183,20 +185,24 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
     reg_n = (offset - (req_quad_base_n << 4)) >> 2;
 
     if (req_quad_base_n >= IIC_NGRP) {
-        hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                HWADDR_FMT_plx "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "exynos4210.combiner: unallowed write access at offset 0x"
+                      HWADDR_FMT_plx "\n", offset);
         return;
     }
 
     if (reg_n > 1) {
-        hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                HWADDR_FMT_plx "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "exynos4210.combiner: unallowed write access at offset 0x"
+                      HWADDR_FMT_plx "\n", offset);
         return;
     }
 
     if (offset >> 2 >= IIC_REGSET_SIZE) {
-        hw_error("exynos4210.combiner: overflow of reg_set by 0x"
-                HWADDR_FMT_plx "offset\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "exynos4210.combiner: overflow of reg_set by 0x"
+                      HWADDR_FMT_plx "offset\n", offset);
+        return;
     }
     s->reg_set[offset >> 2] = val;
 
@@ -245,8 +251,9 @@ static void exynos4210_combiner_write(void *opaque, hwaddr offset,
         exynos4210_combiner_update(s, grp_quad_base_n + 3);
         break;
     default:
-        hw_error("exynos4210.combiner: unallowed write access at offset 0x"
-                HWADDR_FMT_plx "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "exynos4210.combiner: unallowed write access at offset 0x"
+                      HWADDR_FMT_plx "\n", offset);
         break;
     }
 }
-- 
2.43.0


