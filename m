Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp473289wrs;
        Wed, 14 Aug 2019 00:15:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8RyRIwNP4etpFsTsU/6BNuWGshzGNbAjyB5BdSmjxOa1L78vZnrLwhFHY3YJuT3n5rJsq
X-Received: by 2002:a37:454e:: with SMTP id s75mr7417812qka.183.1565766902221;
        Wed, 14 Aug 2019 00:15:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565766902; cv=none;
        d=google.com; s=arc-20160816;
        b=uczs561R0bGgJ0043mX2Vn8SUFZZfguF2y5qsvFjElT8Xkaj0EEFve0hDZTchCIrH/
         5xn2/zsM+0Rv5x2WW6FCE+B+FPrb5HBP6NBjNtRy3sNPOBQiWoBrusGg6GNQFLC2/bhA
         JuXj/M1HFDiS4QF90ujOSWD22o23fyzz5a0YixNCwzo7Krvlv5r/fm4BS27u+ozzJkhs
         9DM6SRb0PnsglTOTIaRjofiKENflbvSAoN2UAIe58ASOzDCoKDhxrJcQ1ciYcwMtupTE
         X7oxhUmz6COg4qYQH2iHMcjNz+8uABQ0fOyQ5rV6vQheWl+0m7P/aV+aM7MZYvSpRDJu
         GlGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
        b=uanhWsI1dokMXCi2zeJbxrZi0lCE1wiy5f3jp2ikisKUvOWlT2IXBSPCtIbfgCQ6E7
         Gpfuwf0IyStnH/Gir2WTByHA6nSfL44Xi3xcB/JbvPqjiG2EtfR0mnW+cosXvRYS6ep6
         VpFY6JNB7MUHbkzn6RvwuwB08mUC/nLWJh3IFaqEmaQwDZGw+kBO8Axa6zCFz8ww1mBw
         oSodU/bZ1z7j3c3Kk940XNq+FL14Kozr4TqeW0P94tOtltxenaFajWhqrot4SpvQEY5M
         4PcraW7vMDmEg80R45BRg3qDlPJ0r3C+AOmoy5ZyCCkVGkBFBOVCEynTdkH2NYm945iV
         m8ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="JcOFuN/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l126si4431961qkb.112.2019.08.14.00.15.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Aug 2019 00:15:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="JcOFuN/n";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxnUr-0002Tg-E1
	for alex.bennee@linaro.org; Wed, 14 Aug 2019 03:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1hxnUi-0002Qa-Bi
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 03:14:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hxnUh-0008Dg-3c
 for qemu-arm@nongnu.org; Wed, 14 Aug 2019 03:14:52 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41320)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hxnUg-0008DH-UO; Wed, 14 Aug 2019 03:14:51 -0400
Received: by mail-pg1-x543.google.com with SMTP id x15so42279496pgg.8;
 Wed, 14 Aug 2019 00:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
 b=JcOFuN/n3cjUBwhdgeNQBJ1ddYXpMruTVteMswqBicFRuP8yNIbTIQLlx4iMLZ9C7z
 HfxjXSlx9629gP+XV+lWdPpmy/5aIfEIIssryPwHwKsAcpImaE+89JuiNXk9HyYek7J7
 GLa+AxZ2UkjBNyRHAAtgzOSe/QZpzX6SQjW/8gi2dYzGbL7AcAHyRhfGiVkMDPK84eF+
 gPjaVqTwjNowcQloQ/3w0RfNmIF2rOO6AeOTqSippNt+VZ3Um5jqRR4Rq9OPr/V0rggC
 kGlxj4L6PgN3iNwOBcMDjC3CuYqd3z6iPLGxRk3yN9RCSZQxe8uMGVcBEa9/52Z7jDQb
 BVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lBGGTqXH/nhd6kXXGRtBAmp2V+9X81H4xeVXysgM8vc=;
 b=Zax6kg45G/poqX2+A7CY/UjaUhM5H3U6azTIr7r7+VmZdQtnZg+HNBj/uxeoNUuDU8
 TZe/FMAsEX+z0PuSKO1iVEWJvx97e9CIMWk5hVor1kw4sIVQn8dZTOKlt94JqHT2WeZL
 wU3AOH/G9wqXdOYtjnw7aqypn26MsBQpTCDTdYx6z2UlyYQM1Dd95cosGgfTjrYp3oJL
 pSLHCMiYmUqFMKG7iMZrgQg5QhIAFT9pku8p2IjgyX0EA8+3XOmyApxIfeUgRaq42AhF
 T6UNs7h1u1rR8UWuSThAVj5/ac9qt86WA/16q6Neh6jgxu1VIyPb9qRyt6nbw7tVrwEk
 oTig==
X-Gm-Message-State: APjAAAVHHNJL44DkAz6+fO4hN/dC8fwRZMZWnqP54KCxMk5fCYzVvZE/
 86U8qDArrUN5gYhG6SxAfe4=
X-Received: by 2002:a63:6c4:: with SMTP id 187mr35007414pgg.401.1565766889990; 
 Wed, 14 Aug 2019 00:14:49 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j187sm20086474pfg.178.2019.08.14.00.14.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 00:14:49 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Wed, 14 Aug 2019 17:14:32 +1000
Message-Id: <20190814071433.22243-3-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814071433.22243-1-rashmica.g@gmail.com>
References: <20190814071433.22243-1-rashmica.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v4 2/3] aspeed: add a GPIO controller to the SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, aik@ozlabs.ru, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOoE/2s52gjR

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 hw/arm/aspeed_soc.c         | 17 +++++++++++++++++
 include/hw/arm/aspeed_soc.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c6fb3700f2..ff422c8ad1 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -124,6 +124,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spis_num     = 1,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .gpio_typename = "aspeed.gpio-ast2400",
         .wdts_num     = 2,
         .irqmap       = aspeed_soc_ast2400_irqmap,
         .memmap       = aspeed_soc_ast2400_memmap,
@@ -136,6 +137,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spis_num     = 1,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .gpio_typename = "aspeed.gpio-ast2400",
         .wdts_num     = 2,
         .irqmap       = aspeed_soc_ast2400_irqmap,
         .memmap       = aspeed_soc_ast2400_memmap,
@@ -148,6 +150,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spis_num     = 1,
         .fmc_typename = "aspeed.smc.fmc",
         .spi_typename = aspeed_soc_ast2400_typenames,
+        .gpio_typename = "aspeed.gpio-ast2400",
         .wdts_num     = 2,
         .irqmap       = aspeed_soc_ast2400_irqmap,
         .memmap       = aspeed_soc_ast2400_memmap,
@@ -160,6 +163,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
         .spis_num     = 2,
         .fmc_typename = "aspeed.smc.ast2500-fmc",
         .spi_typename = aspeed_soc_ast2500_typenames,
+        .gpio_typename = "aspeed.gpio-ast2500",
         .wdts_num     = 3,
         .irqmap       = aspeed_soc_ast2500_irqmap,
         .memmap       = aspeed_soc_ast2500_memmap,
@@ -246,6 +250,9 @@ static void aspeed_soc_init(Object *obj)
 
     sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma),
                           TYPE_ASPEED_XDMA);
+
+    sysbus_init_child_obj(obj, "gpio", OBJECT(&s->gpio), sizeof(s->gpio),
+                          sc->info->gpio_typename);
 }
 
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -425,6 +432,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                     sc->info->memmap[ASPEED_XDMA]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->xdma), 0,
                        aspeed_soc_get_irq(s, ASPEED_XDMA));
+
+    /* GPIO */
+    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio), 0, sc->info->memmap[ASPEED_GPIO]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
+                       aspeed_soc_get_irq(s, ASPEED_GPIO));
 }
 static Property aspeed_soc_properties[] = {
     DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index cef605ad6b..fa04abddd8 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -22,6 +22,7 @@
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/watchdog/wdt_aspeed.h"
 #include "hw/net/ftgmac100.h"
+#include "hw/gpio/aspeed_gpio.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  3
@@ -47,6 +48,7 @@ typedef struct AspeedSoCState {
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
     FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
+    AspeedGPIOState gpio;
 } AspeedSoCState;
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -60,6 +62,7 @@ typedef struct AspeedSoCInfo {
     int spis_num;
     const char *fmc_typename;
     const char **spi_typename;
+    const char *gpio_typename;
     int wdts_num;
     const int *irqmap;
     const hwaddr *memmap;
-- 
2.20.1

