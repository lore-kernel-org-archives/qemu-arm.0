Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EFDCDE002
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 16:03:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcmWr-0007Rm-7b; Thu, 25 Jun 2026 12:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wcmWo-0007LB-Np
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 12:02:10 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wcmWn-0006YB-10
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 12:02:10 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c85c531d4a9so11364a12.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 09:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782403327; x=1783008127; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDhXOI1Vjxfmo7Q3X1FJCZ1/5NbFYlpsfWgi5kj/YBk=;
 b=RelxD403XNqJO1BdahJAWVqHUEsCrmcjiDX1cOFy5aMY6xCqCeK1x31gKI144Wjo7i
 xpH7rak5fVZMLxRGKRqjqMNbEp35V1gQlav3lWxGxuiLDtvwTo+W/YivYeDjHikH991p
 vn50hdHtSJUWn7netd8+eDVh6knKygYwmJNZ5I77ETuDLhhfm93Ip1udgFf84GazP0Gr
 jaMKtJERwbKScI6/c8lF2F3OnONEEB46OKQXE2HVcWvpY2y68u/2dsg5kE50cKs0txhp
 02Zk6AfYsQBvHfB/niUDNES8qE4iqzRRbtN7AehyeAOPxF1NuUyRTvzQzSxKjOujVdgK
 Xbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782403327; x=1783008127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PDhXOI1Vjxfmo7Q3X1FJCZ1/5NbFYlpsfWgi5kj/YBk=;
 b=D8OpvMmQaViBO9qCat2Yqh4DarmP+QVH+OxwT7MakbmHmJwHis+ooEf84S8blJ2NZQ
 GXkGjUoky907hNIJwbyTw0wHlLcLaMzINjdQG6xtD/Nng+UHCRGU0tgm3YHz+mnn2r3C
 DYgpJ4EF8Ls0tz+FUELBGzHoR3WmGWO3THeA9e0OIF0h9FK+YcscEEaHfd5lpCb1WoLA
 YjSu1kp8BUYVLkvqDItEqPjKZ/32MgXRVGbY5udz3ahrnDFDyn4pg0tofzMTo/U4VgoC
 Lxpn/wYaWGdsJ/+Qyh9uiUJxIA2qnwXZv8hsVpWNiRaNCk01U8u0F/bo9t1UO1BfHzSZ
 jFzA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/oyJvyKVFMDaD99xhgOL3poHbSn64HS5QwVo7C7pHes48pWUGVLpWMvyurakOzauU+8t4l/oO5/g==@nongnu.org
X-Gm-Message-State: AOJu0YyaO6Oe2Ai1rr9LGl3hkspV2RUwaEmdOc0up1EV8XoHRoq2Ypvx
 atITmn9ZRuIGnfl8/ksuABV9r6lzWcVxUd6XCnruQAKYnDZT8Kta3T+I
X-Gm-Gg: AfdE7ckb64rLHXNu2DvUdIMvWvjzLgo1p4zo/froK1EOYmnX0N5zbPS18tiQWvlHoSK
 tDN5kwRsFvPWDz7XV5ivzlB3uaEPU5zk5Bn1g4wt7Sjf7YZxaUA9fOyZY5H0ITQm7VFEB4c+yqv
 6T6Ez+Yq7HYb9Nbll3ehWbDn/MJYYsa07Z/SyFGc6R50hvGG/5VWnBskKzzkmJIRHw716BRGW2f
 OKYcAxtaVJVRstO30LE2YZ6nOH/7+VvrzVPRPlbEYrBktZf7Vfgyy8ofJWdEk5HZoFB7W12c+Mf
 KgSiweGBnR3MRKZiRq85LqYoCmwRnF990cNA2rFUPIUnqlIVnnUv4Xzoqa1ZThRjB/T32CIEz+d
 tMjW782vucc/MuU8StpDNbezhCRF6YtQJOUVLms+iGa3dRchAx1RyyDK0hnUAyzsmNdMAJmdpla
 I+FwPOVOGr6RPs8IJh2kSIYFwQ0E4=
X-Received: by 2002:a05:6a20:e613:b0:3b4:b276:c5dc with SMTP id
 adf61e73a8af0-3bd4ac817e3mr3980706637.3.1782403326602; 
 Thu, 25 Jun 2026 09:02:06 -0700 (PDT)
Received: from localhost.localdomain ([212.135.211.99])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c92bcb9c14asm1924522a12.24.2026.06.25.09.02.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 25 Jun 2026 09:02:06 -0700 (PDT)
From: jack wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org
Cc: jack wang <163wangjack@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:i.MX31 (kzm))
Subject: [PATCH v2 1/3] hw/misc/imx_ccm: Replace DPRINTF with trace events
Date: Fri, 26 Jun 2026 00:01:42 +0800
Message-ID: <20260625160144.94565-2-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625160144.94565-1-163wangjack@gmail.com>
References: <20260625160144.94565-1-163wangjack@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=163wangjack@gmail.com; helo=mail-pg1-x536.google.com
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


