Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD6DCDE001
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 16:19:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcmnQ-0005cQ-JS; Thu, 25 Jun 2026 12:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wcmnO-0005bd-Ch
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 12:19:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wcmnM-0003mv-Uj
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 12:19:18 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2c7f1db3ad4so986635ad.3
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 09:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782404355; x=1783009155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uI8qWvyl2Mgn+nLZPCFC1tyYQok17fDT7nBfLvBug6k=;
 b=qMseBr1yd0hTbm0ZVbaln3Euhkc9MQ7GfAN48TFFNBPmKGsQqU+L6nt5MmrtGsSjHS
 BEDR4elQyYNquP2H9pHmyoeLM88Y5gyjdoXhMFLbQZXin03B27YKnko9CanDWoqsuKRv
 WF5BhaXsAkvuyx/XGESX0Q/ZqEAvGkK19WOysstwq86h6TmK+dD2xIvwEUIiniNs8M2A
 cgc/zequ8zTu1F9BNGfVMUKSuw4yj3mRxeSCRkJM9oWJDtD2ukaJDcG8U14HKnp3vX5T
 WAlE9S2lYFtX6AGEbGoh3TGwM2s8UPKz3BnrjOViTGkwH7N0CkzUcjd+d7LKd2xnKJ9v
 rfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782404355; x=1783009155;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uI8qWvyl2Mgn+nLZPCFC1tyYQok17fDT7nBfLvBug6k=;
 b=hIE9HrRfWyrLEWim+oKsE0j8zAZpYct2RPhkcrbqO7qP8hihIur6NiVP6h0wa4sfBq
 ARkQPdMv41Bk2HgjztIKOdCHKhlOWSsgNXmmP2VXXOBwtchcsGTcezxo/UxF0ArG4YeK
 YXyIkS2YoRhT46RJ4JrNoRwFbxcQSAdmTka8KjfFCblvz/OVrkvXuUcDLFj9/j6Dm0be
 BhjXloI0q23KsK38kQk3bA93feNgkcxduGWPl7QfPg7XM4m4lfkcSS9cQT7MUCjO0RCM
 yUZt6PcCEHkNH4m5SRk0z6qffa/LAc+DvxZWoUIh3VJ2O3WE/jcpKMFfMhD4UocgIJQ1
 OxZA==
X-Forwarded-Encrypted: i=1;
 AHgh+RodceUtl6IjQgnWppACekgoIDl7mmOAiS5dTINgt32hLhA/y9iywlLo4qhMlGCwWXNrd3SHGzScSQ==@nongnu.org
X-Gm-Message-State: AOJu0YyLCtmChD+rctJC5KQYk5jOgZjZvyZ/aMso58yMbgJsm0Vsojsd
 ENYOHm5GyvzugyT2/bJWdx6M7fGMCYKGv4luFnmLptlyqMQRXGqAkrDv
X-Gm-Gg: AfdE7cmjEcp7il0xT4jAnemEYWHswjCkExJdUcZrdBuyxGsULzBioh/67ZUY0Icxgy1
 bJc023esfrHmVJZqQRDLM03F6lslIkxG0f2rZ+a7mbsEqZ4o1kX0a9NylZ48j6C6ByLiCvS01n3
 Twh9wS1VmmkkqWNLfa9fZtAIKR0HUlyZJiMuMoQvNzLCXMJF0YCKLprkcDgHFOHqOlPR86nu5/V
 iQ85u/nj2FaQllTYU/iolMdbMSOcsaNLOGgF24s63NLns4gB5nGfVIQgHPV1v8+dAMt2XOQmyms
 NQ3zwSnESpvl6MhyILcpDn+S2ScvXZKkh86VHlau3a0COfj+qbyYRRCBEQiFWe0xS4g/3gCGJnP
 KDqQ8C2HbPolgy3PBqlmHv94rBaOlOOoEF6glmWAFZa+qonNdV+xWl1DsBWsXUJa5fP5sLDM56T
 DZIvzivni1SDXqk65AOV7+DZ7Fv9Q=
X-Received: by 2002:a17:902:e744:b0:2c6:9758:9db2 with SMTP id
 d9443c01a7336-2c7fc9bfe23mr35411385ad.3.1782404355156; 
 Thu, 25 Jun 2026 09:19:15 -0700 (PDT)
Received: from localhost.localdomain ([212.135.211.99])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f64dc839sm22650235ad.68.2026.06.25.09.19.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Jun 2026 09:19:14 -0700 (PDT)
From: jack wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org
Cc: jack wang <163wangjack@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:i.MX31 (kzm))
Subject: [PATCH v3 1/3] hw/misc/imx_ccm: Replace DPRINTF with trace events
Date: Fri, 26 Jun 2026 00:18:51 +0800
Message-ID: <20260625161855.5132-1-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=163wangjack@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: jack wang <163wangjack@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx_ccm.c    | 18 +++---------------
 hw/misc/trace-events |  4 ++++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 9403c5daa3..b77e9561bb 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -14,18 +14,7 @@
 #include "qemu/osdep.h"
 #include "hw/misc/imx_ccm.h"
 #include "qemu/module.h"
-
-#ifndef DEBUG_IMX_CCM
-#define DEBUG_IMX_CCM 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX_CCM) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_CCM, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
+#include "hw/misc/trace.h"
 
 
 uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
@@ -37,7 +26,7 @@ uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
         freq = klass->get_clock_frequency(dev, clock);
     }
 
-    DPRINTF("(clock = %d) = %u\n", clock, freq);
+    trace_imx_ccm_get_clock_frequency(clock, freq);
 
     return freq;
 }
@@ -64,8 +53,7 @@ uint32_t imx_ccm_calc_pll(uint32_t pllreg, uint32_t base_freq)
     freq = ((2 * (base_freq >> 10) * (mfi * mfd + mfn)) /
             (mfd * pd)) << 10;
 
-    DPRINTF("(pllreg = 0x%08x, base_freq = %u) = %d\n", pllreg, base_freq,
-            freq);
+    trace_imx_ccm_calc_pll(pllreg, base_freq, freq);
 
     return freq;
 }
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b88accc437..fdb4844045 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -237,6 +237,10 @@ iotkit_secctl_s_write(uint32_t offset, uint64_t data, unsigned size) "IoTKit Sec
 iotkit_secctl_ns_read(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl NS regs read: offset 0x%x data 0x%" PRIx64 " size %u"
 iotkit_secctl_ns_write(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl NS regs write: offset 0x%x data 0x%" PRIx64 " size %u"
 
+# imx_ccm.c
+imx_ccm_get_clock_frequency(uint32_t clock, uint32_t freq) "(clock = %u) = %u"
+imx_ccm_calc_pll(uint32_t pllreq, uint32_t base_freq, uint32_t freq) "(pllreg = 0x%08x, base_freq = %u) = %u"
+
 # imx6_ccm.c
 imx6_analog_get_periph_clk(uint32_t freq) "freq = %u Hz"
 imx6_analog_get_pll2_clk(uint32_t freq) "freq = %u Hz"
-- 
2.53.0


