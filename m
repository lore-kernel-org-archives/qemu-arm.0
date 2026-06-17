Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFCBCD98E2
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Jun 2026 16:15:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZsuN-0008QM-5H; Wed, 17 Jun 2026 12:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wZsuK-0008PC-UC
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 12:14:28 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wZsuI-0003t9-KF
 for qemu-arm@nongnu.org; Wed, 17 Jun 2026 12:14:28 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-84226d0f1d2so3877578b3a.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781712865; x=1782317665; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=227EW3L/59hcD2Q03G8dQiLU/RR2N6DLxA0E9gs88jY=;
 b=mSHC2nobkId7LmT2pTZGC5rqijv4iwJSaEl4/QNiYNCo9QBG/BX5TCeAlYCLwM6Urp
 KoGQBFY4H3LV7F7S49IF112fwOdCgzlLfiSpl4wcjNCOiNgK/5SuNuA1pkfSgk6Tyh9R
 RRsUYhk5mKWO6DeGTJPNqTArFm8fCHK3MlSV5IgoDwOOrzxVXAzDlvXu+MMSqD2TA7X3
 ynvqc3BZ8jDpfFP27DO9s6GdVu1hq/WbfkPT/CqSybh2ZWm/8IlBZJITUm0b2R3gnivM
 PEzs4gPYw9NwBOQserHZZ0GALIqFiljfgxbMhDSj3Izc+tglN8wB1Np0shRlPZeIzWal
 Bwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781712865; x=1782317665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=227EW3L/59hcD2Q03G8dQiLU/RR2N6DLxA0E9gs88jY=;
 b=JXxW189QFnkP1lV6xZeEnqFu4ji8KztP1U4YQ+wwXPI3G+kj6TcBDPvPxvoTyktUoE
 qoAKTUgoEXLbH2LkILY+Gc2XuHUtpt2FFAjFvku25FjJCh4J4N9v6P6pjT95njfrwEn3
 qYx2tyVlrNSUKSuW3fUcQdkMNzgy/0Lb8puYwenkmUo2VyHMtRKSfsDo8G4Sqgpr/wdN
 1Fs672FY0bRlz24V1m9eQEtbhSDeP90pLUy5dqBE6OaWO/MTbYcJa8dn2zPgSsNJNjWZ
 m20qhqzU1A5mSju9yBR3FH11ZhbhC32iFzAmilvfK3JtNzJg02OB9CUpSfP+Ly4IBWfN
 OcFA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Ux3IaHEFl9ktscmKHRO86jRY5b7BUa0sNSEn9TCW2HeObkd1S945qs/x+tGiVodv77EZNZ2JUtQ==@nongnu.org
X-Gm-Message-State: AOJu0YxYNbF5Si/WVOrT2gPPAUlHFb+ErvN3V8weCZ3Ppjac0VE+Zcwm
 i5ynEuTE5tBBmG+D0mPVRrG6uagKo5MwO80FYJkFf1Mxh0E1JcqWQ6lk
X-Gm-Gg: AfdE7ckVGQaX7K8rSRcaO5lFvyPLZcD+G1ovg71eBpnVPQvVoPPni68MspH6MQkCGEE
 /MojnjfQzycZpCpDbXuPaSX3y9YhIhbBZDzVNW3FLF+lpTNkficYDd9mEqlxsOqfRCUEScMzom7
 sQXo9ioKjWu85CutYfKj7+EWSIQG/IEli9bfh8SXjxOPy8aSWEu3HA3eJuc1ArEKBCY4tKoQlCL
 W0F5eudWxDLXaOsb1wZ6iFgr5Ay39eNRCr2+2WvB0tGPeO3WRHw3Xydnipq9CEQBli8/oocWljP
 j35tP6hZpV3//osux2Ana36mM4j+r4KPhofBwH4AQ7Pl2A3uC14B4o7Au9YYyyZMYo+LkE3WSmL
 w0CingAKs6oV2Olnigo+r0ia+sekWLPMsUXPeG3gZWhJo0e/gOSPsI2kE50obq2aBbVkHM261MT
 phAN6kAyPQCX640T7OmmbyJZkHKvlK6LC8PHTk7Q==
X-Received: by 2002:a05:6a00:1907:b0:824:374a:1407 with SMTP id
 d2e1a72fcca58-84524480f94mr4809339b3a.16.1781712864975; 
 Wed, 17 Jun 2026 09:14:24 -0700 (PDT)
Received: from localhost.localdomain ([212.135.211.99])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8434afc825csm16342800b3a.36.2026.06.17.09.14.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jun 2026 09:14:24 -0700 (PDT)
From: jack wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Cc: peter.maydell@linaro.org, mjt@tls.msk.ru, laurent@vivier.eu,
 jack wang <163wangjack@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v5] hw/timer/imx_epit: Replace DPRINTF with trace events
Date: Thu, 18 Jun 2026 00:14:06 +0800
Message-ID: <20260617161406.14705-1-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=163wangjack@gmail.com; helo=mail-pf1-x42a.google.com
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

Clean up the codebase by removing the outdated DEBUG_IMX_EPIT
and DPRINTF macros, replacing them with modern QEMU trace events.

This also removes an empty and meaningless DPRINTF("\n") in the
imx_epit_realize function.

Signed-off-by: jack wang <163wangjack@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
---
 hw/timer/imx_epit.c   | 25 +++++--------------------
 hw/timer/trace-events |  8 ++++++++
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index c67a39f10c..374ec7d324 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -20,18 +20,7 @@
 #include "hw/misc/imx_ccm.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
-
-#ifndef DEBUG_IMX_EPIT
-#define DEBUG_IMX_EPIT 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX_EPIT) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX_EPIT, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
+#include "trace.h"
 
 static const char *imx_epit_reg_name(uint32_t reg)
 {
@@ -80,7 +69,7 @@ static uint32_t imx_epit_get_freq(IMXEPITState *s)
     uint32_t prescaler = 1 + extract32(s->cr, CR_PRESCALE_SHIFT, CR_PRESCALE_BITS);
     uint32_t f_in = imx_ccm_get_clock_frequency(s->ccm, imx_epit_clocks[clksrc]);
     uint32_t freq = f_in / prescaler;
-    DPRINTF("ptimer frequency is %u\n", freq);
+    trace_imx_epit_get_freq(freq);
     return freq;
 }
 
@@ -146,8 +135,7 @@ static uint64_t imx_epit_read(void *opaque, hwaddr offset, unsigned size)
                       HWADDR_PRIx "\n", TYPE_IMX_EPIT, __func__, offset);
         break;
     }
-
-    DPRINTF("(%s) = 0x%08x\n", imx_epit_reg_name(offset >> 2), reg_value);
+    trace_imx_epit_read(imx_epit_reg_name(offset >> 2), reg_value);
 
     return reg_value;
 }
@@ -328,8 +316,7 @@ static void imx_epit_write(void *opaque, hwaddr offset, uint64_t value,
 {
     IMXEPITState *s = IMX_EPIT(opaque);
 
-    DPRINTF("(%s, value = 0x%08x)\n", imx_epit_reg_name(offset >> 2),
-            (uint32_t)value);
+    trace_imx_epit_write(imx_epit_reg_name(offset >> 2), value);
 
     switch (offset >> 2) {
     case 0: /* CR */
@@ -362,7 +349,7 @@ static void imx_epit_cmp(void *opaque)
     /* The cmp ptimer can't be running when the peripheral is disabled */
     assert(s->cr & CR_EN);
 
-    DPRINTF("sr was %d\n", s->sr);
+    trace_imx_epit_cmp(s->sr);
     /* Set interrupt status bit SR.OCIF and update the interrupt state */
     s->sr |= SR_OCIF;
     imx_epit_update_int(s);
@@ -399,8 +386,6 @@ static void imx_epit_realize(DeviceState *dev, Error **errp)
     IMXEPITState *s = IMX_EPIT(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
-    DPRINTF("\n");
-
     sysbus_init_irq(sbd, &s->irq);
     memory_region_init_io(&s->iomem, OBJECT(s), &imx_epit_ops, s, TYPE_IMX_EPIT,
                           0x00001000);
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index ac5afe84e8..cd83adb03d 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -122,3 +122,11 @@ hpet_ram_write_tn_cmp(uint8_t reg_off) "hpet_ram_writel HPET_TN_CMP + %" PRIu8
 hpet_ram_write_invalid_tn_cmp(void) "invalid HPET_TN_CMP + 4 write"
 hpet_ram_write_invalid(void) "invalid hpet_ram_writel"
 hpet_ram_write_counter_write_while_enabled(void) "Writing counter while HPET enabled!"
+
+# imx_epit.c
+imx_epit_get_freq(uint32_t freq) "ptimer frequency is %u"
+imx_epit_read(const char *name, uint32_t value) "(%s) = 0x%08x"
+imx_epit_write(const char *name, uint64_t value) "(%s, value = 0x%08" PRIx64 ")"
+imx_epit_cmp(uint32_t sr) "sr was %d"
+
+
-- 
2.53.0


