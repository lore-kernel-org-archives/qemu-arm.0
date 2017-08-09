Received: by 10.25.221.202 with SMTP id w71csp504132lfi;
        Tue, 8 Aug 2017 23:29:23 -0700 (PDT)
X-Received: by 10.200.33.232 with SMTP id 37mr9770210qtz.11.1502260163698;
        Tue, 08 Aug 2017 23:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502260163; cv=none;
        d=google.com; s=arc-20160816;
        b=p0gUK4aPnKw38i4UTCV4VWf3EjkA7F/RBysUKX93flGMdZRek7r7jzVtSMA4d/ALsu
         cnpD0ZfT2SDRsEH+IVZ+skc01dnE2HpKEhBBT2ahAx7hV19Q8T/3cHYb/LttgsrADi3u
         NjFHlriqaj2FsJE20HiL7F+Y+jLLKO3fvnlqwRqW1UvW/1/CgOpXOGN5J2Ue3RSHOovA
         ZJo0UuOkBl2ddkTTqyl0E3ctP3YQmIa4QS4COPcTutOeOWtpwPVykNr03Hebf8Q3JGh5
         +rATcGtw2I/r0+/RgCPQiqNcQ5fy6aHUTONGq/Y9ndWcQnh3hH0rf6BujpfrZ8Lpr3qW
         iy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=GNDR9vAWMtBkJSHNWfHfTP0dAWDNQ4A24GlGMzS/HTE=;
        b=a77oi1qcjiw8JAgSxCKtYfYj4nOmrYmNm6qoBfulbxEWVs/C49x4BSlMORSrfIhrB7
         8qCBWVAg2cbjLRJVRmiTHz4jmQixCtFfogJfH4nza9CKkHMyVEYZdZcHaoJ/w+SB73+U
         NG6Aj4tVfD9adt4fl64CKTmE6yYmOqboxdgwqQL1YT1OWNOaIR7H+3otolgzSY4p9So0
         +Kdk3gCKqQ0xnbXLaR4OdK/Wpt7n2xgquMcqWOgp/ybVUHK4ngtZ8nPP6oKdQ5jH3dQG
         kg41rNlC9E5duTPAEZ0lHPTqe2VlewdV5Xz3tuNa/uPQyTW3ulibY5KUH7eiUiLEOBEx
         OgOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=Jm6SYB99;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=dqGLmE/3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1si2409332qkb.286.2017.08.08.23.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Aug 2017 23:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=Jm6SYB99;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=dqGLmE/3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45873 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dfKUb-00064Y-1g
	for alex.bennee@linaro.org; Wed, 09 Aug 2017 02:29:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKUR-000631-N5
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dfKUO-00071P-KZ
	for qemu-arm@nongnu.org; Wed, 09 Aug 2017 02:29:11 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46323)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dfKUO-00070a-FG; Wed, 09 Aug 2017 02:29:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2DBA921D8E;
	Wed,  9 Aug 2017 02:29:08 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 09 Aug 2017 02:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=GNDR9v
	AWMtBkJSHNWfHfTP0dAWDNQ4A24GlGMzS/HTE=; b=Jm6SYB99QtOLhJTExMaFwj
	YT+KsU5B9Rj+ZLf8lVrDvAPF59UNM4SnXYc2Fu60C2sohnT39D3iz7HiKWUVBnuZ
	mpSP6uIGquIyNrWxpLdDI0uUTQvFisWhCJJGLoIwImGHuF1UjB62BAzAmsGhTF1g
	Fth5MzzEVZUk3LecahNW2goX7kwvnLg7FK/EdGyJ0fR8SQ2Za7fQASp3TcjuFxYt
	W/PGR8ThnkGelYxXaerc9Hs6G4mFMr30xVRAinEzLBwhTWgvkzVxNvtj+EomkqLv
	nb2llqBEhiqRW+SdA88c0GsD8E0kmPPcQG+dLgn4z0OfwusEIuMMSJ6DCEcIRcAQ
	==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=GNDR9vAWMtBkJSHNWfHfTP0dAWDNQ4A24GlGMzS/H
	TE=; b=dqGLmE/3WW2auXadagzWBkO+erkgutMijd9/oxliUv/kcURIggiTefLXJ
	Xg9cOcJFCx8Iz7lGyEvvKeVC0vsmK+kQ7eAdD6Op8G+hL+LaaXAFekJuMmGQN/3+
	UiinTm4nMfkKatxBxSkBtEaiEIZsttxm/d3/lwGnAyDAMQGxxqSLjkaUCGWOuu6p
	kzBQjG003H/8nwsFOrAf3RZMjt74EQ+b54azneAfjTheZhWNEyq874v18Ocv8mlr
	qYtxdJlDegN7W1jBE4mbU9zFlC9MQ2qasHEnIhJz9TA13I/RMJ8t4hz+2vtnPswl
	h+cyc95W8e/jn8ivKMkm61s805WdQ==
X-ME-Sender: <xms:tKuKWfyzKbRVjFHDzuH6DlSj9U_LwVgwSO-muUHYdEaKMrquw5W3PQ>
X-Sasl-enc: ZU1C114svhnd1gywXlZDwGaDCqnAj4irrggN3aF2tm9D 1502260147
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id BE5147E4EA;
	Wed,  9 Aug 2017 02:29:04 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Wed,  9 Aug 2017 15:58:26 +0930
Message-Id: <20170809062828.3673-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170809062828.3673-1-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH for 2.11 v2 1/2] watchdog: wdt_aspeed: Add
 support for the reset width register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com,
	Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
	f4bug@amsat.org, qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zf2DPGK/lt57

The reset width register controls how the pulse on the SoC's WDTRST{1,2}
pins behaves. A pulse is emitted if the external reset bit is set in
WDT_CTRL. On the AST2500 WDT_RESET_WIDTH can consume magic bit patterns
to configure push-pull/open-drain and active-high/active-low
behaviours and thus needs some special handling in the write path.

As some of the capabilities depend on the SoC version a silicon-rev
property is introduced, which is used to guard version-specific
behaviour.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/watchdog/wdt_aspeed.c         | 93 +++++++++++++++++++++++++++++++++++-----
 include/hw/watchdog/wdt_aspeed.h |  2 +
 2 files changed, 84 insertions(+), 11 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 8bbe579b6b66..22bce364d7b5 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -8,16 +8,19 @@
  */
 
 #include "qemu/osdep.h"
+
+#include "qapi/error.h"
 #include "qemu/log.h"
+#include "qemu/timer.h"
 #include "sysemu/watchdog.h"
+#include "hw/misc/aspeed_scu.h"
 #include "hw/sysbus.h"
-#include "qemu/timer.h"
 #include "hw/watchdog/wdt_aspeed.h"
 
-#define WDT_STATUS              (0x00 / 4)
-#define WDT_RELOAD_VALUE        (0x04 / 4)
-#define WDT_RESTART             (0x08 / 4)
-#define WDT_CTRL                (0x0C / 4)
+#define WDT_STATUS                      (0x00 / 4)
+#define WDT_RELOAD_VALUE                (0x04 / 4)
+#define WDT_RESTART                     (0x08 / 4)
+#define WDT_CTRL                        (0x0C / 4)
 #define   WDT_CTRL_RESET_MODE_SOC       (0x00 << 5)
 #define   WDT_CTRL_RESET_MODE_FULL_CHIP (0x01 << 5)
 #define   WDT_CTRL_1MHZ_CLK             BIT(4)
@@ -25,18 +28,41 @@
 #define   WDT_CTRL_WDT_INTR             BIT(2)
 #define   WDT_CTRL_RESET_SYSTEM         BIT(1)
 #define   WDT_CTRL_ENABLE               BIT(0)
+#define WDT_RESET_WIDTH                 (0x18 / 4)
+#define   WDT_RESET_WIDTH_ACTIVE_HIGH   BIT(31)
+#define     WDT_POLARITY_MASK           (0xFF << 24)
+#define     WDT_ACTIVE_HIGH_MAGIC       (0xA5 << 24)
+#define     WDT_ACTIVE_LOW_MAGIC        (0x5A << 24)
+#define   WDT_RESET_WIDTH_PUSH_PULL     BIT(30)
+#define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
+#define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
+#define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
 
-#define WDT_TIMEOUT_STATUS      (0x10 / 4)
-#define WDT_TIMEOUT_CLEAR       (0x14 / 4)
-#define WDT_RESET_WDITH         (0x18 / 4)
+#define WDT_TIMEOUT_STATUS              (0x10 / 4)
+#define WDT_TIMEOUT_CLEAR               (0x14 / 4)
 
-#define WDT_RESTART_MAGIC       0x4755
+#define WDT_RESTART_MAGIC               0x4755
 
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
 }
 
+static bool is_ast2500(const AspeedWDTState *s)
+{
+    switch (s->silicon_rev) {
+    case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
+        return true;
+    case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
+    default:
+        break;
+    }
+
+    return false;
+}
+
 static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
 {
     AspeedWDTState *s = ASPEED_WDT(opaque);
@@ -55,9 +81,10 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr offset, unsigned size)
         return 0;
     case WDT_CTRL:
         return s->regs[WDT_CTRL];
+    case WDT_RESET_WIDTH:
+        return s->regs[WDT_RESET_WIDTH];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
-    case WDT_RESET_WDITH:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented read at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -119,9 +146,27 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
             timer_del(s->timer);
         }
         break;
+    case WDT_RESET_WIDTH:
+    {
+        uint32_t property = data & WDT_POLARITY_MASK;
+
+        if (property && is_ast2500(s)) {
+            if (property == WDT_ACTIVE_HIGH_MAGIC) {
+                s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_ACTIVE_HIGH;
+            } else if (property == WDT_ACTIVE_LOW_MAGIC) {
+                s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_ACTIVE_HIGH;
+            } else if (property == WDT_PUSH_PULL_MAGIC) {
+                s->regs[WDT_RESET_WIDTH] |= WDT_RESET_WIDTH_PUSH_PULL;
+            } else if (property == WDT_OPEN_DRAIN_MAGIC) {
+                s->regs[WDT_RESET_WIDTH] &= ~WDT_RESET_WIDTH_PUSH_PULL;
+            }
+        }
+        s->regs[WDT_RESET_WIDTH] &= ~s->ext_pulse_width_mask;
+        s->regs[WDT_RESET_WIDTH] |= data & s->ext_pulse_width_mask;
+        break;
+    }
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
-    case WDT_RESET_WDITH:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
@@ -167,6 +212,7 @@ static void aspeed_wdt_reset(DeviceState *dev)
     s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
     s->regs[WDT_RESTART] = 0;
     s->regs[WDT_CTRL] = 0;
+    s->regs[WDT_RESET_WIDTH] = 0xFF;
 
     timer_del(s->timer);
 }
@@ -187,6 +233,25 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     AspeedWDTState *s = ASPEED_WDT(dev);
 
+    if (!is_supported_silicon_rev(s->silicon_rev)) {
+        error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
+                s->silicon_rev);
+        return;
+    }
+
+    switch (s->silicon_rev) {
+    case AST2400_A0_SILICON_REV:
+    case AST2400_A1_SILICON_REV:
+        s->ext_pulse_width_mask = 0xff;
+        break;
+    case AST2500_A0_SILICON_REV:
+    case AST2500_A1_SILICON_REV:
+        s->ext_pulse_width_mask = 0xfffff;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, aspeed_wdt_timer_expired, dev);
 
     /* FIXME: This setting should be derived from the SCU hw strapping
@@ -199,6 +264,11 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
+static Property aspeed_wdt_properties[] = {
+    DEFINE_PROP_UINT32("silicon-rev", AspeedWDTState, silicon_rev, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -207,6 +277,7 @@ static void aspeed_wdt_class_init(ObjectClass *klass, void *data)
     dc->reset = aspeed_wdt_reset;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     dc->vmsd = &vmstate_aspeed_wdt;
+    dc->props = aspeed_wdt_properties;
 }
 
 static const TypeInfo aspeed_wdt_info = {
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 080c2231222e..7de3e5c224fb 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -27,6 +27,8 @@ typedef struct AspeedWDTState {
     uint32_t regs[ASPEED_WDT_REGS_MAX];
 
     uint32_t pclk_freq;
+    uint32_t silicon_rev;
+    uint32_t ext_pulse_width_mask;
 } AspeedWDTState;
 
 #endif  /* ASPEED_WDT_H */
-- 
2.11.0

